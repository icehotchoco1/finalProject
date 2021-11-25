package kr.or.gw.controller;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.gw.command.AllbbsCriteria;
import kr.or.gw.service.AllbbsService;

@Controller
public class AllbbsController {

	@Autowired
	private AllbbsService service;
	
	@RequestMapping("/board/main")
	public ModelAndView list (AllbbsCriteria cri, ModelAndView mnv) throws SQLException{
		String url = "board/main";
		
		Map<String, Object> dataMap = service.getAllBbsList(cri);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
}
