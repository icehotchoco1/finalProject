package kr.or.gw.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.gw.command.EscMngtModifyCommand;
import kr.or.gw.command.tempstorageCriteria;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.EccstSanctnMngtVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.service.EscDbxService;
import kr.or.gw.service.EscMngtService;
import kr.or.gw.service.ScmngtService;
import kr.or.gw.service.ScnerService;

@Controller
@RequestMapping("/approval/ddbox")
public class EscMngtController {
	
	@Autowired
	private EscMngtService escMngtService;
	
	@Autowired
	private ScnerService scnerService;
	
	@Autowired
	private EscDbxService escDbxService;
	
	@Autowired
	private ScmngtService scmngtService;
	
	@RequestMapping("/tempstorage")
	public ModelAndView list(ModelAndView mnv, tempstorageCriteria cri, HttpSession session) throws SQLException {
		String url = "approval/ddbox/tempstorage_list";
		
		OrgnztEmpMngtVO loginUser = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		int empno = loginUser.getEmpno();
		
		Map<String, Object> dataMap = escMngtService.getEscMngtList(cri, empno);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/tempstorage/detail")
	public ModelAndView detail(String sanctn_no, ModelAndView mnv) throws Exception {
		String url = "approval/ddbox/tempstorage_detail";
		
		EccstSanctnMngtVO escMngt = null;
		
		escMngt = escMngtService.getEscMngtPlusErf(sanctn_no);
		mnv.addObject("escMngt", escMngt);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/tempstorage/modify", method=RequestMethod.POST)
	public String modifyPost(EscMngtModifyCommand modifyReq,
								HttpServletRequest request, 
								RedirectAttributes rttr) throws Exception {
		String url ="redirect:/approval/ddbox/tempstorage/detail.do?sanctn_no="+modifyReq.getSanctn_no();
		
		EccstSanctnMngtVO escMngt = modifyReq.toEccstSanctnMngtVO();
		escMngt.setSj((String)request.getAttribute("XSSsj"));

		escMngtService.modify(escMngt);
		rttr.addFlashAttribute("from", "modify");
		
		return url;
	}

	@RequestMapping(value="/tempstorage/remove", method=RequestMethod.POST)
	public String remove(String sanctn_no, RedirectAttributes rttr) throws Exception {
		
		String url = "redirect:/approval/ddbox/tempstorage.do";
		
		EccstSanctnMngtVO escm = scmngtService.selectEccstDetail(sanctn_no);
		List<AtchMnflVO> fileList = escm.getAtchList();
		
		if(fileList != null && fileList.size() > 0) {
			for(AtchMnflVO file : fileList) {
				String file_no = file.getFile_no();
				scmngtService.removeAttachByFileNo(file_no);
				
				File deletefile = new File(file.getUploadpath(),file.getFile_nm());
				if(deletefile.exists()) {
					deletefile.delete();
				}
				scmngtService.removeAttachByFileNo(file_no);
			}
		}
		escMngtService.remove(sanctn_no);
		scnerService.deleteSanctners(sanctn_no);
		escDbxService.deleteDbx(sanctn_no);
		
		rttr.addAttribute("sanctn_no", sanctn_no);
		rttr.addFlashAttribute("from", "remove");
		
		return url;
	}
}
