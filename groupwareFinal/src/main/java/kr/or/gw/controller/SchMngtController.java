package kr.or.gw.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.gw.command.SchModifyCommand;
import kr.or.gw.command.SchRegistCommand;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.dto.SchdulMngtVO;
import kr.or.gw.service.SchService;

@Controller
@RequestMapping("/schedule")
public class SchMngtController {

	@Autowired
	private SchService schService;

	@RequestMapping("")
	public ModelAndView list(ModelAndView mnv) throws Exception {
		String url = "schedule/list";

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		OrgnztEmpMngtVO emp = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		SchdulMngtVO sch;

		Map<String, Object> schList = schService.schList(emp.getEmpno());

		if (schList.isEmpty() || schList == null) {
			System.out.println("");
		} else {
			mnv.addObject("schList", schList);
			mnv.setViewName(url);

		}
		return mnv;

	}

	@RequestMapping("/registForm")
	public String registForm() {
		String url = "schedule/registForm";
		return url;
	}

	@RequestMapping("/regist")
	public String regist(SchRegistCommand regReq, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		String url = "redirect:/schedule";

		SchdulMngtVO sch = regReq.toSchdulMngtVO();

		if (sch.getSchdul_code().equals("개인")) {
			sch.setSchdul_code("I001");
		} else if (sch.getSchdul_code().equals("부서")) {
			sch.setSchdul_code("I002");
		} else if (sch.getSchdul_code().equals("전사")) {
			sch.setSchdul_code("I003");
		}

		schService.regist(sch);

		rttr.addFlashAttribute("from", "regist");

		return url;
	}

	@RequestMapping("/detail")
	public ModelAndView detail(String schdul_no, ModelAndView mnv) throws SQLException {
		String url = "schedule/detail";

		SchdulMngtVO sch = null;
		sch = schService.getSchedule(schdul_no);
		mnv.addObject("schdul_no", schdul_no);
		mnv.addObject("sch", sch);

		mnv.setViewName(url);
		System.out.println(mnv.getModel());
		System.out.println(mnv.getModelMap());
		System.out.println(mnv.getViewName());
		return mnv;
	}

	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(String schdul_no, ModelAndView mnv) throws SQLException {
		String url = "schedule/modify";

		SchdulMngtVO sch = schService.getSchedule(schdul_no);

		mnv.addObject("schdul_no", schdul_no);
		mnv.addObject("sch", sch);
		mnv.setViewName(url);

		return mnv;

	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(SchModifyCommand modifyReq, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		String url = "redirect:/schedule/detail.do";

		SchdulMngtVO sch = modifyReq.toSchdulMngtVO();

		if (sch.getSchdul_code().equals("개인")) {
			sch.setSchdul_code("I001");
		} else if (sch.getSchdul_code().equals("부서")) {
			sch.setSchdul_code("I002");
		} else if (sch.getSchdul_code().equals("전사")) {
			sch.setSchdul_code("I003");
		}
		
		schService.modify(sch);

		rttr.addFlashAttribute("from", "modify");
		rttr.addAttribute("schdul_no", modifyReq.getSchdul_no());

		return url;
	}

//	@RequestMapping(value = "/remove", method = RequestMethod.GET)
//	public String remove(String schdul_no, RedirectAttributes rttr) throws Exception {
//		String url = "redirect:/schedule/detail.do";
//
//		schService.remove(schdul_no);
//
//		rttr.addFlashAttribute("from", "remove");
//		rttr.addAttribute("schdul_no", schdul_no);
//		return url;
//	}
	@RequestMapping("/remove")
	public String remove(String schdul_no, RedirectAttributes rttr) throws Exception {
		String url = "schedule/remove_success";
		
		schService.remove(schdul_no);
		
		rttr.addFlashAttribute("from", "remove");
		rttr.addAttribute("schdul_no", schdul_no);
		return url;
	}

	@RequestMapping("/modifyByDrag")
	@ResponseBody
	public ResponseEntity<String> modifyByDrag(SchModifyCommand modifyReq) throws Exception {
		ResponseEntity<String> entity = null;
		SchdulMngtVO sch = modifyReq.toSchdulMngtVO();
		/*
		 * System.out.println(sch.getMber_schdul_sn());
		 * System.out.println(sch.getMber_schdul_bgnde());
		 * System.out.println(sch.getMber_schdul_endde());
		 */

		try {
			schService.modifyByDrag(sch);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {

		}

		return entity;
	}

}
