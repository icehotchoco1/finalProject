package kr.or.gw.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.gw.command.Criteria;

@Controller
@RequestMapping("/approval")
public class ApprovalController {
	
	@RequestMapping("/docstorage")
	public String allwork(Criteria cri, Model model) throws SQLException {
		String url = "approval/docstorage";
		
//		Map<String,Object> result = appService.getDocList(cri);
		
//		model.addAttribute("dataMap", result);
		
		return url;
	}
}
