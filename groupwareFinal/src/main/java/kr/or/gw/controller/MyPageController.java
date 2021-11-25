package kr.or.gw.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.gw.command.AllWorkCriteria;
import kr.or.gw.command.ApprovalAdboxCriteria;
import kr.or.gw.command.MypageModifyCommand;
import kr.or.gw.dto.DclzMngtVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.service.ApprovalAdboxService;
import kr.or.gw.service.JobService;
import kr.or.gw.service.MypageService;



@Controller
@RequestMapping("/mypage")
public class MyPageController {
  
	@Autowired
	private MypageService mypageService;

	@Autowired
	private JobService jobService;
	
	@Autowired
	private ApprovalAdboxService approvalAdboxService;

	@RequestMapping("")
	public String mypage(ApprovalAdboxCriteria cri2, AllWorkCriteria cri, HttpSession session, Model model, DclzMngtVO dclz) throws SQLException {
		String url = "/mypage/mypage";

		int empno = ((OrgnztEmpMngtVO) session.getAttribute("loginUser")).getEmpno();

		String clsf_code = ((OrgnztEmpMngtVO) session.getAttribute("loginUser")).getClsf_code();
		String clsfName = mypageService.selectCodeDcbyCodeNo(clsf_code);

		DclzMngtVO dclzmngt = mypageService.selectCheckInOutTime(empno);
		
		int dclzLateCnt = mypageService.selectDclzMngtLateCount(empno); // 지각 횟수
		int dclzAbsentCnt = mypageService.selectDclzMngtAbsentCount(empno); // 결근 횟수
		int dclzECkOutCnt = mypageService.selectDclzMngtEarlieCkOutCount(empno); // 조퇴 횟수
		int dclzMissingCnt = mypageService.selectDclzMngtMissingCount(empno); // 미체크 횟수
		
		int workingDaysCnt = mypageService.selectDclzMngtWorkingDayCount(empno); // 당월 총 근무 일수
		String workingHrsStr = mypageService.selectDclzMngtWorkingHrs(empno); // 당월 총 근무 시간
		
		int totVacCnt = mypageService.selectTotVacCnt(empno); // 총 발생 휴가일수
		
		int totUsedVacDays = mypageService.selectTotUsedVacDays(empno); // 총 사용 휴가일수
		int vacLeftCnt = totVacCnt - totUsedVacDays; // 잔여 연차
		
		int totUsedDayOff = mypageService.selectUsedDayoffDays(empno);// 연차 사용일수
		int totUsedHalfDayOffDays = mypageService.selectUsedHalfDayoffDays(empno);// 반차 사용일수
		int totUsedSickDayOff = mypageService.selectUsedSickDayoffDays(empno);// 병가 사용일수
		
		
		if(workingHrsStr != null) {
			int workedMin = Integer.parseInt(workingHrsStr.substring(workingHrsStr.length() - 2, workingHrsStr.length())); // 당월 근무 분
			int workedHrs = Integer.parseInt(workingHrsStr.substring(0, workingHrsStr.length() - 2));// 당 월 근무 시간 합
			
			int workingDay = mypageService.selectWorkingDayCnt(); // 오늘까지 이번달에 일해야 하는 일자 수
			int avgWokringMinTot = (workedHrs * 60 + workedMin) / workingDay;// 이번 달 평균 근무 시간 (분)
			int avgWorkedHrs = avgWokringMinTot / 60; // 이번달 평균 근무 시간
			int avgWorkedMin = avgWokringMinTot % 60; // 이번달 평균 근무 분
			model.addAttribute("workedHrs", workedHrs); // 총 근무 시간
			model.addAttribute("workedMin", workedMin); // 총 근무 분
			model.addAttribute("workingDay", workingDay); // 총 근무 분
			model.addAttribute("avgWorkedHrs", avgWorkedHrs); // 평균 근무 분
			model.addAttribute("avgWorkedMin", avgWorkedMin); // 평균 근무 분
		} else {
			int zero = 0;
			model.addAttribute("workedHrs", zero); // 총 근무 시간
			model.addAttribute("workedMin", zero); // 총 근무 분
			model.addAttribute("workingDay", zero); // 총 근무 분
			model.addAttribute("avgWorkedHrs", zero); // 평균 근무 분
			model.addAttribute("avgWorkedMin", zero); // 평균 근무 분
		}
		

		Map<String, Object> jobSendList = jobService.getJobSendList(cri, empno);
		Map<String, Object> jobRecList = jobService.getJobRecList(cri, empno);
		
		Map<String, Object> eccWaitList = approvalAdboxService.eccWaitList(cri2, empno); // 기안 대기함
		Map<String, Object> eccRequestList = approvalAdboxService.eccRequestList(cri2, empno); // 기안함

		model.addAttribute("lateCnt", dclzLateCnt); // 지각 횟수
		model.addAttribute("AbsentCnt", dclzAbsentCnt); // 결근 횟수
		model.addAttribute("ECkOutCnt", dclzECkOutCnt); // 조퇴 횟수
		model.addAttribute("MissingCnt", dclzMissingCnt); // 미체크 횟수
		
		model.addAttribute("clsfName", clsfName);
		model.addAttribute("jobSendListDataMap", jobSendList); // 발신업무
		model.addAttribute("jobRecListDataMap", jobRecList); // 수신업무
		
		model.addAttribute("eccWaitListDataMap", eccWaitList); // 기안대기함
		model.addAttribute("eccRequestListDataMap", eccRequestList); // 기안함
		
		model.addAttribute("checkInOut", dclzmngt); // 출퇴근 시간
		model.addAttribute("workingDays", workingDaysCnt); // 총 근무일수
		model.addAttribute("totVacCnt", totVacCnt); // 총 발생휴가일수
		model.addAttribute("totUsedVacDays", totUsedVacDays); // 총 사용 휴가일수
		model.addAttribute("vacLeftCnt", vacLeftCnt); // 잔여 연차
		model.addAttribute("totUsedDayOff", totUsedDayOff);// 연차 사용일수
		model.addAttribute("totUsedHalfDayOffDays", totUsedHalfDayOffDays);// 반차 사용일수
		model.addAttribute("totUsedSickDayOff", totUsedSickDayOff);// 병가 사용일수

		return url;
	}

	@RequestMapping(value = "/myPageDetails.do", method = RequestMethod.GET)
	public String myPageDetails(HttpSession session, Model model) throws SQLException {
		String url = "/mypage/myPageDetails";

		OrgnztEmpMngtVO emp = (OrgnztEmpMngtVO) session.getAttribute("loginUser");

		int empno = emp.getEmpno();
		String clsf_code = ((OrgnztEmpMngtVO) session.getAttribute("loginUser")).getClsf_code();
		String rspofc_code = ((OrgnztEmpMngtVO) session.getAttribute("loginUser")).getRspofc_code();
		String dept_code = ((OrgnztEmpMngtVO) session.getAttribute("loginUser")).getDept_code();

		String clsfName = mypageService.selectCodeDcbyCodeNo(clsf_code);
		String rspofcName = mypageService.selectCodeDcbyCodeNo(rspofc_code);
		String deptName = mypageService.selectCodeDcbyCodeNo(dept_code);
		
		String cttpc = mypageService.selectEmp(empno).getCttpc();
		String email_adres = mypageService.selectEmp(empno).getEmail_adres();
		
//		System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//		System.out.println(cttpc);
//		System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		
		model.addAttribute("clsfName", clsfName);
		model.addAttribute("rspofcName", rspofcName);
		model.addAttribute("deptName", deptName);
		model.addAttribute("cttpc", cttpc);
		model.addAttribute("email_adres", email_adres);

		return url;
	}

	@RequestMapping("/myPageDetailsModifyForm")
	public String modifyForm(HttpSession session, Model model) throws SQLException {
		OrgnztEmpMngtVO emp = (OrgnztEmpMngtVO) session.getAttribute("loginUser");

		String url = "mypage/myPageDetailsModify";

		int empno = emp.getEmpno();

		String clsf_code = ((OrgnztEmpMngtVO) session.getAttribute("loginUser")).getClsf_code();
		String rspofc_code = ((OrgnztEmpMngtVO) session.getAttribute("loginUser")).getRspofc_code();
		String dept_code = ((OrgnztEmpMngtVO) session.getAttribute("loginUser")).getDept_code();

		String clsfName = mypageService.selectCodeDcbyCodeNo(clsf_code);
		String rspofcName = mypageService.selectCodeDcbyCodeNo(rspofc_code);
		String deptName = mypageService.selectCodeDcbyCodeNo(dept_code);
		String cttpc = mypageService.selectEmp(empno).getCttpc();
		String email_adres = mypageService.selectEmp(empno).getEmail_adres();

		model.addAttribute("clsfName", clsfName);
		model.addAttribute("rspofcName", rspofcName);
		model.addAttribute("deptName", deptName);
		model.addAttribute("cttpc", cttpc);
		model.addAttribute("email_adres", email_adres);

		return url;

	}

	@RequestMapping(value = "/myPageDetailsModify", method = RequestMethod.POST)
	public String sendModifyPost(MypageModifyCommand modifyReq, HttpSession session, RedirectAttributes rttr)
			throws SQLException, IOException {
		String url = "redirect:/mypage/myPageDetails.do";

		int empno = ((OrgnztEmpMngtVO) session.getAttribute("loginUser")).getEmpno();

		OrgnztEmpMngtVO emp = modifyReq.toOrgnztEmpMngtVO();

		emp.setEmpno(empno);
		
//		System.out.println("==================================================================================================");
//		System.out.println(emp.getEmail_adres());
//		System.out.println(emp.getCttpc());
//		System.out.println("==================================================================================================");

		mypageService.modify(emp);

		rttr.addFlashAttribute("from", "modify");

		return url;
	}

	// 비밀번호 수정
	@RequestMapping(value = "/pwModify", method = RequestMethod.POST)
	public String sendPwModifyPost(MypageModifyCommand modifyReq, HttpSession session, RedirectAttributes rttr)
			throws SQLException, IOException {
		String url = "redirect:/mypage/myPageDetails.do";
		
		int empno = ((OrgnztEmpMngtVO) session.getAttribute("loginUser")).getEmpno();
		
		OrgnztEmpMngtVO emp = modifyReq.toOrgnztEmpMngtVO();
		
		emp.setEmpno(empno);
		
		mypageService.pwModify(emp);
		
		rttr.addFlashAttribute("from", "modify");
		
		System.out.println("==================================================================================================");
		System.out.println(emp.getPassword());
		System.out.println("==================================================================================================");
//		
		return url;
	}
	
	
	
}