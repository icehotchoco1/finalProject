package kr.or.gw.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.VacCriteria;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.service.DclzService;
import kr.or.gw.service.DclzVacService;

@Controller
@RequestMapping("/attendance/department")

public class DepAttController {
	
	@Autowired
	private DclzVacService vacService;
	
	@Autowired
	private DclzService dclzService;
	
	//부서별 근태조회 화면
	@RequestMapping("/dcommute")
	public ModelAndView dcommute(ModelAndView mnv, VacCriteria cri, SearchCriteria cri2, HttpSession session) throws SQLException {
		String url = "attendance/department/dcommute";
		
		OrgnztEmpMngtVO emp = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		int empno = emp.getEmpno();
		
		//부서별 근태현황
		//모든 empno의 이번달 정상근무 숫자 
		//부서별로 나눠서 정상근무 횟수
		
		
		//월별 부서 근태현황
		//loginuser의 부서 이번달 정상근무, 지각, 결근 숫자
		
		
		//연도 부서 근태현황
		
		
		
		//부서 휴가 목록
		Map<String, Object> dataMap = vacService.selectDeptVacList(cri, empno);
		mnv.addObject("dataMap", dataMap);
		
		//근태 이상자 목록
		Map<String, Object> dataMap2 = dclzService.getLateList(cri2, empno);
		mnv.addObject("dataMap2", dataMap2);
		
		mnv.setViewName(url);
		return mnv;
	}
	
}
