package kr.or.gw.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.basicCriteria;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.service.DbxPublicService;
import kr.or.gw.service.DbxService;

@Controller
public class DbxController {
	
	@Autowired
	private DbxService dbxService;

	@Autowired
	private DbxPublicService dbxPublicService;
	
	@RequestMapping("/document/main")
	public ModelAndView main(basicCriteria cri,HttpSession session, SearchCriteria cri2,ModelAndView mnv) throws SQLException {
		String url = "document/main";
		
		cri.setPerPageNum(5);
		
		OrgnztEmpMngtVO loginUser = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		int rcvr_empno = loginUser.getEmpno();
		Map<String, Object> public_dataMap = dbxPublicService.getDbxList(cri,rcvr_empno);
		Map<String, Object> individual_dataMap = dbxService.getDbxIndiList(cri2, rcvr_empno);

		public_dataMap.put("cri", cri);
		
		mnv.addObject("public_dataMap", public_dataMap);
		mnv.addObject("individual_dataMap", individual_dataMap);
		mnv.setViewName(url);
		return mnv;
	}
}
