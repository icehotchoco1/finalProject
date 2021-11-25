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

import kr.or.gw.command.FreeModifyCommand;
import kr.or.gw.command.FreeRegistCommand;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.BbsFreebdVO;
import kr.or.gw.service.FreeService;
import kr.or.gw.util.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("/board")
public class FreeController {
	
	@Autowired
	private FreeService service;
	
	@Resource(name = "freeFileUpPath")
	private String fileUploadPath;
	
	@RequestMapping("/free")
	public ModelAndView list (SearchCriteria cri,ModelAndView mnv)throws SQLException{
		String url = "board/free/list";
		
		Map<String, Object> dataMap = service.getFreeList(cri);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/free/registForm")
	public String regist() {
		String url = "board/free/regist";
		return url;
	}
	
	@RequestMapping(value="/free/regist",method = RequestMethod.POST,produces="text/plain;charset=utf-8")
	public String regist(FreeRegistCommand regReq, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/board/free";
		
		BbsFreebdVO free = regReq.toBbsFreebdVO();
		
		List<AtchMnflVO> atchList = GetAttachesAsMultipartFiles.save(regReq.getUploadFile(), fileUploadPath);
		
		free.setSj((String)request.getAttribute("XSSsj"));
		free.setAtchList(atchList);
		
		service.regist(free);
		
		rttr.addFlashAttribute("from","regist");
		
		return url;
	}
	
	@RequestMapping("/free/detail")
	public ModelAndView detail(String bbsctt_no,String from, ModelAndView mnv) throws Exception{
		String url = "board/free/detail";
		
		BbsFreebdVO free = null;
		
		if(from != null && from.equals("list")) {
			free = service.getFree(bbsctt_no);
			url="redirect:/board/free/detail.do?bbsctt_no="+bbsctt_no;
			
		}else {
			free = service.getFreeForModify(bbsctt_no);
		}
		
		//파일명 재정의
		if(free != null) {
			List<AtchMnflVO> atchList = free.getAtchList();
			if(atchList != null) {
				for(AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}
		
		mnv.addObject("free",free);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/free/modifyForm")
	public ModelAndView modifyForm(String bbsctt_no,ModelAndView  mnv) throws Exception{
		String url = "board/free/modify";
		
		BbsFreebdVO free  = service.getFree(bbsctt_no);
		
		//파일명 재정의
		if(free != null) {
			List<AtchMnflVO> atchList = free.getAtchList();
			if(atchList != null) {
				for(AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}

		mnv.addObject("free",free);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/free/modify")
	public String modifyPOST(HttpServletRequest request,FreeModifyCommand modifyReq,RedirectAttributes rttr)throws Exception{
		String url = "redirect:/board/free/detail.do";
		
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
		
		BbsFreebdVO free = modifyReq.toBbsFreebdVO();
		free.setAtchList(atchList);
		free.setSj((String)request.getAttribute("XSSsj"));
		
		service.modify(free);
		
		rttr.addFlashAttribute("from","modify");
		rttr.addAttribute("bbsctt_no",modifyReq.getBbsctt_no());
		
		return  url;
	}
	
	@RequestMapping("/free/remove")
	public String remove(String bbsctt_no, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/board/free/detail.do";
		
		List<AtchMnflVO> atchList = service.getFreeForModify(bbsctt_no).getAtchList();
		if(atchList !=  null) {
			for(AtchMnflVO atch : atchList) {
				File target = new File (atch.getUploadpath(),atch.getFile_nm());
				if(target.exists()) {
					target.delete();
				}
			}
		}
		
		service.remove(bbsctt_no);
		
		rttr.addFlashAttribute("from","delete");
		rttr.addAttribute("bbsctt_no",bbsctt_no);
		
		return url;
	}
	
	@RequestMapping("/free/getFile")
	public  String getFile(String file_no,Model model)throws Exception{
		String url = "downloadFile";
		
		AtchMnflVO atch = service.getAttachByFileNo(file_no);
		model.addAttribute("fileName",atch.getFile_nm());
		model.addAttribute("savedPath",atch.getUploadpath());
		
		return url;
		
	}
	
}
