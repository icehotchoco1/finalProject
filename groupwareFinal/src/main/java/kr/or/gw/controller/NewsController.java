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

import kr.or.gw.command.NewsModifyCommand;
import kr.or.gw.command.NewsRegistCommand;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.BbsCmpnyDsptchVO;
import kr.or.gw.service.NewsService;
import kr.or.gw.util.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("/board")
public class NewsController {

	@Autowired
	private NewsService newsService;

	@Resource(name = "newsFileUpPath")
	private String fileUploadPath;

	@RequestMapping("/news")
	public ModelAndView list(SearchCriteria cri, ModelAndView mnv) throws SQLException {
		String url = "board/news/list";

		Map<String, Object> dataMap = newsService.getNewsList(cri);

		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/news/registForm")
	public String registForm() {
		String url = "board/news/regist";
		return url;
	}

	@RequestMapping(value="/news/regist",method = RequestMethod.POST,produces="text/plain;charset=utf-8")
	public String regist(NewsRegistCommand regReq, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		String url = "redirect:/board/news";

		BbsCmpnyDsptchVO news = regReq.toBbsCmpnyDsptchVO();

		List<AtchMnflVO> atchList = GetAttachesAsMultipartFiles.save(regReq.getUploadFile(), fileUploadPath);

		news.setSj((String) request.getAttribute("XSSsj"));
		news.setAtchList(atchList);
		newsService.regist(news);

		rttr.addFlashAttribute("from", "regist");

		return url;
	}

	@RequestMapping("/news/detail")
	public ModelAndView detail(String bbsctt_no, String from, ModelAndView mnv) throws SQLException {
		String url = "board/news/detail";

		BbsCmpnyDsptchVO news = null;
		if (from != null && from.equals("list")) {
			news = newsService.getNews(bbsctt_no);
			url = "redirect:/board/news/detail.do?bbsctt_no=" + bbsctt_no;
		} else {
			news = newsService.getNewsForModify(bbsctt_no);
		}

		// 파일명 재정의
		if (news != null) {
			List<AtchMnflVO> atchList = news.getAtchList();
			if (atchList != null) {
				for (AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}

		mnv.addObject("news", news);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/news/modifyForm")
	public ModelAndView modifyForm(String bbsctt_no, ModelAndView mnv) throws SQLException {
		String url = "board/news/modify";

		BbsCmpnyDsptchVO news = newsService.getNewsForModify(bbsctt_no);
		
		//파일명 재정의
		if(news != null) {
			List<AtchMnflVO> atchList = news.getAtchList();
			if(atchList != null) {
				for(AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}
				
		mnv.addObject("news", news);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/news/modify", method = RequestMethod.POST)
	public String modifyPost(NewsModifyCommand modifyReq, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		String url = "redirect:/board/news/detail.do";

		if(modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
			for(String file_no : modifyReq.getDeleteFile()) {
				AtchMnflVO atch = newsService.getAttachByFileNo(file_no);
				File deleteFile = new File(atch.getUploadpath(),atch.getFile_nm());
				newsService.removeAttachByFileNo(file_no);
				if(deleteFile.exists()) {
					deleteFile.delete();
				}
				newsService.removeAttachByFileNo(file_no);
			}
		}
		
		List<AtchMnflVO> atchList = GetAttachesAsMultipartFiles.save(modifyReq.getUploadFile(), fileUploadPath);
		BbsCmpnyDsptchVO news = modifyReq.toBbsCmpnyDsptchVO();
		
		news.setSj((String)request.getAttribute("XSSsj"));
		news.setAtchList(atchList);
		
		newsService.modify(news);

		rttr.addFlashAttribute("from", "modify");
		rttr.addAttribute("bbsctt_no", news.getBbsctt_no());

		return url;
	}

	@RequestMapping(value = "/news/remove", method = RequestMethod.POST)
	public String remove(String bbsctt_no, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/board/news/detail.do";
		
		List<AtchMnflVO> atchList = newsService.getNewsForModify(bbsctt_no).getAtchList();
		if(atchList !=  null) {
			for(AtchMnflVO atch : atchList) {
				File target = new File (atch.getUploadpath(),atch.getFile_nm());
				if(target.exists()) {
					target.delete();
				}
			}
		}
		
		
		newsService.remove(bbsctt_no);

		rttr.addFlashAttribute("from", "remove");
		rttr.addAttribute("bbsctt_no", bbsctt_no);
		
		return url;
	}

	@RequestMapping("/news/getFile")
	public String getFile(String file_no, Model model) throws Exception {
		String url = "downloadFile";

		AtchMnflVO atch = newsService.getAttachByFileNo(file_no);
		model.addAttribute("fileName", atch.getFile_nm());
		model.addAttribute("savedPath", atch.getUploadpath());

		return url;

	}

}
