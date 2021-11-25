package kr.or.gw.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.service.EmpSignService;

@Controller
@RequestMapping("/sign")
public class EmpSignController {
	@Autowired
	private EmpSignService empSignService;

	@Resource(name = "memberSign")
	private String memberSign;

	@RequestMapping(value = "/upload", method = RequestMethod.POST/* ,produces="text/plain;charset=utf-8" */)
	public String regist(OrgnztEmpMngtVO emp, HttpSession session) throws Exception {
		String url = "/sign";
		System.out.println("asdasda" + emp.getSanctn_sign());
		OrgnztEmpMngtVO loginUser = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		emp.setEmpno(loginUser.getEmpno());
		empSignService.modify(emp);

		return url;
	}

	
	@RequestMapping(value = "/select", method = RequestMethod.POST)
	public @ResponseBody String getSign(@RequestParam("sign") String sign, HttpSession session) throws Exception {
		OrgnztEmpMngtVO loginUser = (OrgnztEmpMngtVO) session.getAttribute("loginUser");

		String mysign = empSignService.getSign(loginUser.getEmpno());
		System.out.println("mysign======================================= ::"+mysign);
		System.out.println("'''''''''''''''''''''''''''''''''''''");
		return mysign;
		
	}

}
