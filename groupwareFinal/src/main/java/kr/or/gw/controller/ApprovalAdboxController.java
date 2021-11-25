package kr.or.gw.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.or.gw.command.ApprovalAdboxCriteria;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.service.ApprovalAdboxService;

@Controller
@RequestMapping("/approval/adbox")
public class ApprovalAdboxController {

	@Autowired
	private ApprovalAdboxService approvalAdboxService;

//	@RequestMapping("/request")
//	public String reqt() {
//		String url = "/approval/adbox/request";
//		return url;
//	}

	@RequestMapping("/request")
	public String requestList(ApprovalAdboxCriteria cri, Model model) throws SQLException {
		String url = "/approval/adbox/request";

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		OrgnztEmpMngtVO emp = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		
		int empno = emp.getEmpno();

	    System.out.println(emp);
	
		Map<String, Object> dataMap = approvalAdboxService.eccRequestList(cri,empno);
		model.addAttribute("dataMap", dataMap);
		

		return url;
	}

	@RequestMapping("/requestGrid")
	public String reqtGrid() {
		String url = "/approval/adbox/requestGrid";
		return url;
	}

	@RequestMapping("/wait")
	public String apwait(ApprovalAdboxCriteria cri, Model model) throws Exception {
		String url = "/approval/adbox/wait";

		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		OrgnztEmpMngtVO emp = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		
		int empno = emp.getEmpno();

	    System.out.println(emp);
	
		Map<String, Object> dataMap = approvalAdboxService.eccWaitList(cri,empno);
		model.addAttribute("dataMap", dataMap);
		

		return url;
	
	}
	
	@RequestMapping("/reject")
	public String eccRejectList(ApprovalAdboxCriteria cri, Model model) throws Exception {
		String url = "/approval/adbox/reject";
		
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		OrgnztEmpMngtVO emp = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		
		int empno = emp.getEmpno();
		
		System.out.println(emp);
		
		Map<String, Object> dataMap = approvalAdboxService.eccRejectList(cri,empno);
		model.addAttribute("dataMap", dataMap);
		
		
		return url;
		
	}
	
	@RequestMapping("/completion")
	public String completion(ApprovalAdboxCriteria cri, Model model) throws Exception {
		String url = "/approval/adbox/completion";
		
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		OrgnztEmpMngtVO emp = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		
		int empno = emp.getEmpno();
		
		System.out.println(emp);
		
		Map<String, Object> dataMap = approvalAdboxService.eccCompletionList(cri,empno);
		model.addAttribute("dataMap", dataMap);
		
		
		return url;
		
	}


	

}
