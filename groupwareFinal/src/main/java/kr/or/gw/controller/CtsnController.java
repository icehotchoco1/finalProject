package kr.or.gw.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.gw.command.CtsnModifyCommand;
import kr.or.gw.command.CtsnRegistCommand;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.BbsCtsnnbdVO;
import kr.or.gw.service.CtsnService;
import kr.or.gw.util.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("/board")
public class CtsnController {
	
	@Autowired
	private CtsnService service;
	
	@Resource(name = "ctsnFileUpPath")
	private String fileUploadPath;
	
	@RequestMapping("/ctsn")
	public ModelAndView list (SearchCriteria cri,ModelAndView mnv)throws SQLException{
		String url = "board/ctsn/list";
		
		Map<String, Object> dataMap = service.getCtsnList(cri);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/ctsn/registForm")
	public String regist() {
		String url = "board/ctsn/regist";
		return url;
	}
	
	@RequestMapping(value="/ctsn/regist",method = RequestMethod.POST,produces="text/plain;charset=utf-8")
	public String regist(CtsnRegistCommand regReq, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/board/ctsn";
		
		BbsCtsnnbdVO ctsn = regReq.toBbsCtsnnbdVO();
		
		List<AtchMnflVO> atchList = GetAttachesAsMultipartFiles.save(regReq.getUploadFile(), fileUploadPath);
		
		ctsn.setSj((String)request.getAttribute("XSSsj"));
		ctsn.setAtchList(atchList);
		
		service.regist(ctsn);
		
		rttr.addFlashAttribute("from","regist");
		
		return url;
	}
	
	@RequestMapping("/ctsn/detail")
	public ModelAndView detail(String bbsctt_no,String from, ModelAndView mnv) throws Exception{
		String url = "board/ctsn/detail";
		
		BbsCtsnnbdVO ctsn = null;
		
		if(from != null && from.equals("list")) {
			ctsn = service.getCtsn(bbsctt_no);
			url="redirect:/board/ctsn/detail.do?bbsctt_no="+bbsctt_no;
			
		}else {
			ctsn = service.getCtsnForModify(bbsctt_no);
		}
		
		//파일명 재정의
		if(ctsn != null) {
			List<AtchMnflVO> atchList = ctsn.getAtchList();
			if(atchList != null) {
				for(AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}
		
		mnv.addObject("ctsn",ctsn);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/ctsn/modifyForm")
	public ModelAndView modifyForm(String bbsctt_no,ModelAndView  mnv) throws Exception{
		String url = "board/ctsn/modify";
		
		BbsCtsnnbdVO ctsn  = service.getCtsn(bbsctt_no);
		
		//파일명 재정의
		if(ctsn != null) {
			List<AtchMnflVO> atchList = ctsn.getAtchList();
			if(atchList != null) {
				for(AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}

		mnv.addObject("ctsn",ctsn);
		mnv.setViewName(url);
		
		return mnv;
	}
	@RequestMapping(value="/ctsn/modify",method = RequestMethod.POST,produces="text/plain;charset=utf-8")
	public String modifyPOST(HttpServletRequest request,CtsnModifyCommand modifyReq,RedirectAttributes rttr)throws Exception{
		String url = "redirect:/board/ctsn/detail.do";
		
		if(modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
			for(String file_no : modifyReq.getDeleteFile()) {
				AtchMnflVO atch = service.getAttachByFileNo(file_no);
				File deleteFile = new File(atch.getUploadpath(),atch.getFile_nm());
				service.removeAttachByFileNo(file_no);
				if(deleteFile.exists()) {
					deleteFile.delete();
				}
				service.removeAttachByFileNo(file_no);
			}
		}
		
		List<AtchMnflVO> atchList = GetAttachesAsMultipartFiles.save(modifyReq.getUploadFile(), fileUploadPath);
		
		BbsCtsnnbdVO ctsn = modifyReq.toBbsCtsnnbdVO();
		ctsn.setAtchList(atchList);
		ctsn.setSj((String)request.getAttribute("XSSsj"));
		
		service.modify(ctsn);
		
		
		rttr.addFlashAttribute("from","modify");
		rttr.addAttribute("bbsctt_no",modifyReq.getBbsctt_no());
		
		return  url;
	}
	
	@RequestMapping("/ctsn/remove")
	public String remove(String bbsctt_no, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/board/ctsn/detail.do";
		
		List<AtchMnflVO> atchList = service.getCtsnForModify(bbsctt_no).getAtchList();
		if(atchList !=  null) {
			for(AtchMnflVO atch : atchList) {
				File target = new File (atch.getUploadpath(),atch.getFile_nm());
				if(target.exists()) {
					target.delete();
				}
			}
		}
		
		service.remove(bbsctt_no);
		
		rttr.addFlashAttribute("from","remove");
		rttr.addAttribute("bbsctt_no",bbsctt_no);
		
		return url;
	}
	
	@RequestMapping("/ctsn/getFile")
	public  String getFile(String file_no,Model model)throws Exception{
		String url = "downloadFile";
		
		AtchMnflVO atch = service.getAttachByFileNo(file_no);
		model.addAttribute("fileName",atch.getFile_nm());
		model.addAttribute("savedPath",atch.getUploadpath());
		
		return url;
		
	}
	
}
