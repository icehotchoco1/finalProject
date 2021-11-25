package kr.or.gw.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.gw.command.VacCriteria;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.service.DclzVacService;
import kr.or.gw.service.MypageService;

@Controller
@RequestMapping("/attendance/individual/vacation")
public class DclzVacController {

	@Autowired
	private DclzVacService vacService;
	
	@Autowired
	private MypageService mypageService;
	
	
	@RequestMapping("")
	public ModelAndView vacList(VacCriteria cri, HttpSession session, ModelAndView mnv) throws SQLException {
		String url = "attendance/individual/vacation";

		int empno = ((OrgnztEmpMngtVO)session.getAttribute("loginUser")).getEmpno();

		int totVacCnt = mypageService.selectTotVacCnt(empno); // 총 발생 휴가일수
		int totUsedVacDays = mypageService.selectTotUsedVacDays(empno); // 총 사용 휴가일수
		
		Map<String, Object> dataMap = vacService.getVacList(cri, empno);
		
		Float f = vacService.selectsumUseVac(empno);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("F",f);
		mnv.setViewName(url);

		mnv.addObject("totVacCnt", totVacCnt);
		mnv.addObject("totUsedVacDays", totUsedVacDays);
		
		return mnv;
	}
	
	@RequestMapping("/registForm")
	public String vacRegistForm() {
		String url = "결재쪽으로 넘어가야함";
		return url;
	}

}
