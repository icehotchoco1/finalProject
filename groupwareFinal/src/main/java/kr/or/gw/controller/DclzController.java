package kr.or.gw.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.or.gw.dto.DclzMngtVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.service.DclzService;

@Controller
@RequestMapping("/attendance/individual")
public class DclzController {
	
	@Autowired
	private DclzService service;
	
	@RequestMapping("/view")
	public ModelAndView list (ModelAndView mnv)throws SQLException{
		String url = "attendance/individual/view";
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		OrgnztEmpMngtVO	emp = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		
		List<DclzMngtVO> dclzList = service.getDclzList(emp.getEmpno());
		List<DclzMngtVO> dclzcount = service.getDclzCount(emp.getEmpno());
		
		mnv.addObject("dclzList",dclzList);
		mnv.addObject("dclzcount",dclzcount);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	/*@RequestMapping(value="/list",method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mnv, String startDate, String endDate) throws SQLException {
		
		String url = "attendance/individual/view";
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
	    HttpSession session = request.getSession();
	    OrgnztEmpMngtVO emp = (OrgnztEmpMngtVO) session.getAttribute("loginUser");

	    if(startDate == null || startDate.equals("")||endDate == null || endDate.equals("")) {
	    	startDate= "sysdate";
	    	endDate= "sysdate";
	    } 

	    Map<String, String> paramMap = new HashMap<String, String>();
	    paramMap.put("startDate", startDate);
	    paramMap.put("endDate", endDate);
	    paramMap.put("empno", String.valueOf(emp.getEmpno()));
	    
	    Map<String,Object> dataMap = service.DclzLists(paramMap);
	    
		mnv.addObject("dataMap",dataMap);
		
		List<OrgnztEmpMngtVO> dclzLists = (List<OrgnztEmpMngtVO>)dataMap.get("dclzLists");
		
		System.out.println(dclzLists.size()+"sava");
		
		mnv.setViewName(url);
		
		
		
		return mnv;*/
	
	

}
