package kr.or.gw.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.gw.command.DbxModifyCommand;
import kr.or.gw.command.DbxRegistCommand;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.TreeEmpCriteria;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.DbxVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.service.DbxService;
import kr.or.gw.service.TreeEmpService;
import kr.or.gw.util.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("/document/individual")
public class DbxIndiController {
	
	@Autowired
	private DbxService dbxService;
	
	@Autowired
	private TreeEmpService treeEmpservice;
	
	@Resource(name = "dbxIndiFileUpPath")
	private String fileUploadPath;
	
	@RequestMapping("")
	public ModelAndView list(SearchCriteria cri, HttpSession session, ModelAndView mnv)throws SQLException{
		String url="document/individual/list";		
		int empno = ((OrgnztEmpMngtVO)session.getAttribute("loginUser")).getEmpno();
		Map<String,Object> dataMap = dbxService.getDbxIndiList(cri, empno);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/registForm")
	public String registForm() {
		String url = "document/individual/regist";
		return url;
	}
	
	@RequestMapping("/regist")
	public String registdo(DbxRegistCommand regReq, 
							HttpServletRequest request,
							RedirectAttributes rttr)throws Exception{
		String url="redirect:/document/individual.do";
		
		DbxVO dbx=regReq.toDbxVO();
		
		//첨부파일
		List<AtchMnflVO> atchList = GetAttachesAsMultipartFiles.save(regReq.getUploadFile(), fileUploadPath);
		dbx.setAtchList(atchList);
		
		dbx.setSj((String)request.getAttribute("XSSsj"));
		dbxService.regist(dbx);
		
		rttr.addFlashAttribute("from","regist");
		
		return url;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(String dbx_no, ModelAndView mnv) throws SQLException {
		String url = "document/individual/detail";

		DbxVO dbx = dbxService.getDbx(dbx_no);

		// 파일명 재정의
		if (dbx != null) {
			List<AtchMnflVO> atchList = dbx.getAtchList();
			if (atchList != null) {
				for (AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}

		mnv.addObject("dbx", dbx);
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(String dbx_no,ModelAndView mnv)throws SQLException{
		String url="document/individual/modify";
		
		DbxVO dbx = dbxService.getDbx(dbx_no);
		
		//파일명 재정의
		if(dbx != null) {
			List<AtchMnflVO> atchList = dbx.getAtchList();
			if(atchList != null) {
				for(AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}
		
		
		mnv.addObject("dbx",dbx);		
		mnv.setViewName(url);
		
		return mnv;
	}
	

	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modifyPost(DbxModifyCommand modifyReq,
								HttpServletRequest request,
			 					RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/document/individual/detail.do";
		
		if(modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
			for(String file_no : modifyReq.getDeleteFile()) {
				AtchMnflVO atch = dbxService.getAttachByFileNo(file_no);
				File deleteFile = new File(atch.getUploadpath(),atch.getFile_nm());
				dbxService.removeAttachByFileNo(file_no);
				if(deleteFile.exists()) {
					deleteFile.delete();
				}
				dbxService.removeAttachByFileNo(file_no);
			}
		}
		
		DbxVO dbx = modifyReq.toDbxVO();
		
		List<AtchMnflVO> atchList = GetAttachesAsMultipartFiles.save(modifyReq.getUploadFile(), fileUploadPath);
		dbx.setAtchList(atchList);
		dbx.setSj((String)request.getAttribute("XSSsj"));
		
		dbxService.modify(dbx);
		
		rttr.addFlashAttribute("from","modify");
		rttr.addAttribute("dbx_no",dbx.getDbx_no());
		
		return url;
	}
	
	@RequestMapping(value="/remove",method=RequestMethod.POST)
	public String remove(String dbx_no, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/document/individual/detail.do";
		
		List<AtchMnflVO> dbxList = dbxService.getDbx(dbx_no).getAtchList();
		if(dbxList !=  null) {
			for(AtchMnflVO atch : dbxList) {
				File target = new File (atch.getUploadpath(),atch.getFile_nm());
				if(target.exists()) {
					target.delete();
				}
			}
		}
		
		
		dbxService.remove(dbx_no);
		
		rttr.addAttribute("dbx_no",dbx_no);
		rttr.addFlashAttribute("from","remove");
		return url;
	}


	@RequestMapping("/shareForm")
	public ModelAndView shareForm(SearchCriteria cri, HttpSession session, ModelAndView mnv) throws SQLException{
		TreeEmpCriteria empCri = new TreeEmpCriteria();
		List<OrgnztEmpMngtVO> empList = treeEmpservice.getEmpListnopg(empCri);
		
		String url = "document/individual/share";
		int empno = ((OrgnztEmpMngtVO)session.getAttribute("loginUser")).getEmpno();
		Map<String, Object> dataMap = dbxService.getDbxIndiList(cri, empno);
		
		mnv.addObject("empList",empList);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/public/modalDoc", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<DbxVO>> modalDocForm(
					@RequestParam(value="docList[]") List<String> docList) throws Exception {
		
		ResponseEntity<List<DbxVO>> entity = null;

		List<DbxVO> dblist = new ArrayList<>(); 

		
		System.out.println("============================================");
		for (String dbx_no : docList) {
			System.out.println(dbx_no);
			
			DbxVO put = dbxService.getDbx(dbx_no);
			dblist.add(put);
		}
		
		entity = new ResponseEntity<List<DbxVO>>(dblist, HttpStatus.OK);
		
		return entity;
	}
	
	//첨부파일
	@RequestMapping("/getFile")
	public String getFile(String file_no, Model model) throws Exception {
		String url = "downloadFile";
		
		AtchMnflVO atch = dbxService.getAttachByFileNo(file_no);
		model.addAttribute("fileName", atch.getFile_nm());
		model.addAttribute("savedPath", atch.getUploadpath());
		
		return url;
	}

}
