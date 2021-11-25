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

import kr.or.gw.command.MngtModifyCommand;
import kr.or.gw.command.MngtRegistCommand;
import kr.or.gw.command.basicCriteria;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.BbsMngtbdVO;
import kr.or.gw.service.MngtService;
import kr.or.gw.util.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("/board")
public class MngtController {

	@Autowired
	private MngtService mngtService;

	@Resource(name = "mngtFileUpPath")
	private String fileUploadPath;

	@RequestMapping("/management")
	public ModelAndView list(basicCriteria cri, ModelAndView mnv) throws SQLException {
		String url = "mngt/list";

		Map<String, Object> dataMap = mngtService.getMngtList(cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/management/registForm")
	public String registForm() {
		String url = "mngt/regist";
		return url;
	}

	@RequestMapping(value = "/management/regist", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String regist(MngtRegistCommand regReq, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		String url = "redirect:/board/management";

		BbsMngtbdVO mngt = regReq.toBbsMngtbdVO();

		List<AtchMnflVO> atchList = GetAttachesAsMultipartFiles.save(regReq.getUploadFile(), fileUploadPath);

		mngt.setSj((String) request.getAttribute("XSSsj"));
		mngt.setAtchList(atchList);

		mngtService.regist(mngt);

		rttr.addFlashAttribute("from", "regist");

		return url;
	}

	@RequestMapping("/management/detail")
	public ModelAndView detail(String bbsctt_no, String from, ModelAndView mnv) throws SQLException {
		String url = "mngt/detail";

		BbsMngtbdVO mngt = null;

		if (from != null && from.equals("list")) {
			mngt = mngtService.getMngt(bbsctt_no);
			url = "redirect:/board/management/detail.do?bbsctt_no=" + bbsctt_no;

		} else {
			mngt = mngtService.getMngtForModify(bbsctt_no);
		}

		// 파일명 재정의
		if (mngt != null) {
			List<AtchMnflVO> atchList = mngt.getAtchList();
			if (atchList != null) {
				for (AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}

		mnv.addObject("mngt", mngt);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/management/modifyForm")
	public ModelAndView modifyForm(String bbsctt_no, ModelAndView mnv) throws SQLException {
		String url = "mngt/modify";

		BbsMngtbdVO mngt = mngtService.getMngt(bbsctt_no);

		// 파일명 재정의
		if (mngt != null) {
			List<AtchMnflVO> atchList = mngt.getAtchList();
			if (atchList != null) {
				for (AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}
		mnv.addObject("mngt", mngt);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/management/modify", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String modifyPOST(HttpServletRequest request, MngtModifyCommand modifyReq, RedirectAttributes rttr)
			throws Exception {
		String url = "mngt/modify_success";

		if (modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
			for (String file_no : modifyReq.getDeleteFile()) {
				AtchMnflVO atch = mngtService.getAttachByFileNo(file_no);
				File deleteFile = new File(atch.getUploadpath(), atch.getFile_nm());
				mngtService.removeAttachByFileNo(file_no);
				if (deleteFile.exists()) {
					deleteFile.delete();
				}
				mngtService.removeAttachByFileNo(file_no);
			}
		}

		List<AtchMnflVO> atchList = GetAttachesAsMultipartFiles.save(modifyReq.getUploadFile(), fileUploadPath);

		BbsMngtbdVO mngt = modifyReq.toBbsMngtbdVO();
		mngt.setAtchList(atchList);
		mngt.setSj((String) request.getAttribute("XSSsj"));

		mngtService.modify(mngt);

		rttr.addFlashAttribute("from", "modify");
		rttr.addAttribute("bbsctt_no", modifyReq.getBbsctt_no());

		return url;
	}

	@RequestMapping("/management/remove")
	public String remove(String bbsctt_no, RedirectAttributes rttr) throws Exception {
		String url = "mngt/remove_success";

		List<AtchMnflVO> atchList = mngtService.getMngtForModify(bbsctt_no).getAtchList();
		if (atchList != null) {
			for (AtchMnflVO atch : atchList) {
				File target = new File(atch.getUploadpath(), atch.getFile_nm());
				if (target.exists()) {
					target.delete();
				}
			}
		}

		mngtService.remove(bbsctt_no);

		rttr.addFlashAttribute("from", "remove");
		rttr.addAttribute("bbsctt_no", bbsctt_no);

		return url;
	}

	@RequestMapping("/management/getFile")
	public String getFile(String file_no, Model model) throws Exception {
		String url = "downloadFile";

		AtchMnflVO atch = mngtService.getAttachByFileNo(file_no);
		model.addAttribute("fileName", atch.getFile_nm());
		model.addAttribute("savedPath", atch.getUploadpath());

		return url;

	}

}
