package kr.or.gw.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.gw.command.EscDbxCriteria;
import kr.or.gw.dto.EccstSanctnMngtVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.service.EscDbxService;

@Controller
@RequestMapping("/approval/rdbox")
public class EscDbxController {

	@Autowired
	private EscDbxService escDbxService;

	@RequestMapping("receive")
	public String rcvList(EscDbxCriteria cri, HttpSession session, Model model) throws SQLException {
		String url = "approval/rdbox/rcvList";
		
		int empno = ((OrgnztEmpMngtVO)session.getAttribute("loginUser")).getEmpno();
		Map<String, Object> result = escDbxService.getRdRcvList(cri, empno);
		
		model.addAttribute("dataMap",result);

		return url;
	}

	@RequestMapping("send")
	public String sendList(EscDbxCriteria cri, HttpSession session, Model model) throws SQLException {
		String url = "approval/rdbox/sendList";
		
		int empno = ((OrgnztEmpMngtVO)session.getAttribute("loginUser")).getEmpno();
		Map<String, Object> result = escDbxService.getRdSendList(cri, empno);
		
		model.addAttribute("dataMap",result);

		return url;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(String sanctn_no, String from, ModelAndView mnv) throws SQLException {
		String url = "approval/rdbox/detail";
		
		EccstSanctnMngtVO escMngt = escDbxService.getEscSanctn(sanctn_no);
		
		mnv.addObject("escMngt", escMngt);
		mnv.setViewName(url);
		
		return mnv;
	}

}
