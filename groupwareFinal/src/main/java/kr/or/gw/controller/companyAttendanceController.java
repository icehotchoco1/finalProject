package kr.or.gw.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.gw.service.DclzComService;
import kr.or.gw.service.DclzService;

@Controller
@RequestMapping("/attendance")
public class companyAttendanceController {

	@Autowired
	private DclzService dclzService;
	
	@Autowired
	private DclzComService dclzComService;
	
	//================================전사 근태현황 ================================
	@RequestMapping("/company")
	public ModelAndView companyMain(ModelAndView mnv) throws SQLException {
		String url = "attendance/company/main";
		
		Map<String, Object> dataMap = dclzService.getMonth();
		Map<String, Object> deptInfo = dclzService.getDeptInfo();
		Map<String, Object> cha = new HashMap<String, Object>();
		Map<String, Object> count = new HashMap<String, Object>();
		cha.put("oneCha", dclzService.getOneCha());
		cha.put("twoCha", dclzService.getTwoCha());
		cha.put("threeCha", dclzService.getThreeCha());
		cha.put("fourCha", dclzService.getFourCha());
		cha.put("fiveCha", dclzService.getFiveCha());
		
		count.put("tardy", dclzComService.getTardy());
		count.put("earlyLeave", dclzComService.getEarlyLeave());
		count.put("absenteeism", dclzComService.getAbsenteeism());
		
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("deptInfo", deptInfo);
		mnv.addObject("cha", cha);
		mnv.addObject("count", count);
		mnv.setViewName(url);
		return mnv;
	}
}
