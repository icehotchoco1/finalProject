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

import kr.or.gw.command.NoticeModifyCommand;
import kr.or.gw.command.NoticeRegistCommand;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.basicCriteria;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.BbsNtbdVO;
import kr.or.gw.service.NoticeService;
import kr.or.gw.util.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("/board")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@Resource(name = "noticeFileUpPath")
	private String fileUploadPath;
	
	@RequestMapping("/notice")
	public ModelAndView list(basicCriteria cri, ModelAndView mnv) throws SQLException {
		String url = "board/notice/list";
		
		Map<String, Object> dataMap = noticeService.getNoticeList(cri);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/notice/registForm")
	public String registForm() {
		String url = "board/notice/regist";
		return url;
	}
	
	@RequestMapping(value="/notice/regist", method= RequestMethod.POST,produces="text/plain;charset=utf-8")
	public String regist(NoticeRegistCommand regReq,
							HttpServletRequest request,
							RedirectAttributes rttr) throws Exception{
		String url = "redirect:/board/notice";
		
		BbsNtbdVO notice = regReq.toBbsNtbdVO();
		
		List<AtchMnflVO> atchList = GetAttachesAsMultipartFiles.save(regReq.getUploadFile(), fileUploadPath);
		
		notice.setSj((String)request.getAttribute("XSSsj"));
		notice.setAtchList(atchList);
		
		noticeService.regist(notice);
		
		rttr.addFlashAttribute("from", "regist");
		
		return url;
	}
	
	@RequestMapping("/notice/detail")
	public ModelAndView detail(String bbsctt_no, String from, ModelAndView mnv) throws SQLException {
		String url = "board/notice/detail";
		
		BbsNtbdVO notice = null;
		
		if (from!=null && from.equals("list")) {
			notice = noticeService.getNotice(bbsctt_no);
			url = "redirect:/board/notice/detail.do?bbsctt_no=" + bbsctt_no;
		} else {
			notice = noticeService.getNoticeForModify(bbsctt_no);
		}
		
		//파일명 재정의
		if(notice != null) {
			List<AtchMnflVO> atchList = notice.getAtchList();
			if(atchList != null) {
				for(AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}
		
		mnv.addObject("notice", notice);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/notice/modifyForm")
	public ModelAndView modifyForm(String bbsctt_no, ModelAndView mnv) throws SQLException {
		String url = "board/notice/modify";
		
		BbsNtbdVO notice = noticeService.getNoticeForModify(bbsctt_no);
		
		//파일명 재정의
		if(notice != null) {
			List<AtchMnflVO> atchList = notice.getAtchList();
			if(atchList != null) {
				for(AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}
		
		mnv.addObject("notice", notice);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/notice/modify", method = RequestMethod.POST)
	public String modifyPost(NoticeModifyCommand modifyReq,
								HttpServletRequest request,
								RedirectAttributes rttr) throws Exception {
		String url = "redirect:/board/notice/detail.do";
		
		if (modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
			for (String file_no  : modifyReq.getDeleteFile()) {
				AtchMnflVO atch = noticeService.getAttachByFileNo(file_no);
				File deleteFile = new File(atch.getUploadpath(), atch.getFile_nm());
				noticeService.removeAttachByFileNo(file_no);
				if (deleteFile.exists()) {
					deleteFile.delete();
				}
				noticeService.removeAttachByFileNo(file_no);
			}
		}
		
		List<AtchMnflVO> atchList = GetAttachesAsMultipartFiles.save(modifyReq.getUploadFile(), fileUploadPath);
		
		BbsNtbdVO notice = modifyReq.toBbsNtbdVO();
		notice.setAtchList(atchList);
		notice.setSj((String)request.getAttribute("XSSsj"));
		
		noticeService.modify(notice);
		
		rttr.addAttribute("bbsctt_no", notice.getBbsctt_no());
		rttr.addFlashAttribute("from", "modify");
		
		return url;
	}
	
	@RequestMapping(value="/notice/remove",method=RequestMethod.POST)
	public String remove(String bbsctt_no, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/board/notice/detail.do";
		
		List<AtchMnflVO> atchList = noticeService.getNoticeForModify(bbsctt_no).getAtchList();
		if(atchList !=  null) {
			for(AtchMnflVO atch : atchList) {
				File target = new File (atch.getUploadpath(),atch.getFile_nm());
				if(target.exists()) {
					target.delete();
				}
			}
		}
		
		noticeService.remove(bbsctt_no);
		
		rttr.addAttribute("bbsctt_no", bbsctt_no);
		rttr.addFlashAttribute("from", "remove");
		
		return url;
	}
	
	@RequestMapping("/notice/getFile")
	public  String getFile(String file_no,Model model)throws Exception{
		String url = "downloadFile";
		
		AtchMnflVO atch = noticeService.getAttachByFileNo(file_no);
		model.addAttribute("fileName",atch.getFile_nm());
		model.addAttribute("savedPath",atch.getUploadpath());
		
		return url;
		
	}
}
