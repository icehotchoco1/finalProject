package kr.or.gw.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.gw.command.ApprovalAdboxCriteria;
import kr.or.gw.command.EmpPwChangeCommand;
import kr.or.gw.command.MypageModifyCommand;
import kr.or.gw.command.basicCriteria;
import kr.or.gw.dto.DclzMngtVO;
import kr.or.gw.dto.JobRcvVO;
import kr.or.gw.dto.MenuVO;
import kr.or.gw.dto.NtcnVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.exception.InvalidPasswordException;
import kr.or.gw.exception.NotFoundIDException;
import kr.or.gw.exception.PasswordChangeException;
import kr.or.gw.service.ApprovalAdboxService;
import kr.or.gw.service.DbxPublicService;
import kr.or.gw.service.DclzComService;
import kr.or.gw.service.DclzService;
import kr.or.gw.service.EmpService;
import kr.or.gw.service.JobRcvService;
import kr.or.gw.service.MenuService;
import kr.or.gw.service.MngtService;
import kr.or.gw.service.NoticeService;
import kr.or.gw.service.NtcnService;
import kr.or.gw.service.SchService;
import kr.or.gw.util.ExceptionLoggerHelper;

@Controller
public class CommonController {

	@Autowired
	private MenuService menuService;

	@Autowired
	private EmpService empService;
	
	@Autowired
	private NtcnService ntcnService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private SchService schService;
	
	@Autowired
	private ApprovalAdboxService approvalAdboxService;
	
	@Autowired
	private DclzService dclzService;
	
	@Autowired
	private DclzComService dclzComService;
	
	@Autowired
	private DbxPublicService dbxPublicService;
	
	@Autowired
	private MngtService mngtService;

	@RequestMapping("/index")
	public String index(@RequestParam(defaultValue = "M000000") String mCode, Model model, HttpSession session) throws Exception {
		String url = "common/home";
		
		try {
			List<MenuVO> menuList = menuService.getMainMenuList();
			List<MenuVO> LevelTwoMenuList = menuService.getLevelTwoMenuList();
			List<MenuVO> LevelThreeMenuList = menuService.getLevelThreeMenuList();
			MenuVO menu = menuService.getMenuByMcode(mCode);
			List<MenuVO> LVTwoMenuListByMcode = menuService.getLevelTwoMenuListByMcode(mCode);
			List<MenuVO> LVThreeMenuListByMcode = menuService.getLevelThreeMenuListByMcode(mCode);
			
			int empno = ((OrgnztEmpMngtVO) session.getAttribute("loginUser")).getEmpno();
			int ntcnCnt = ntcnService.countNtcnList(empno);
			
			List<NtcnVO> ntcnList = ntcnService.allNtcnList(empno);
			
			model.addAttribute("ntcnCnt", ntcnCnt);
			model.addAttribute("ntcnList", ntcnList);
			
			model.addAttribute("menuList", menuList);
			model.addAttribute("TwoMenuList", LevelTwoMenuList);
			model.addAttribute("ThreeMenuList", LevelThreeMenuList);
			model.addAttribute("menu", menu);
			model.addAttribute("LVTwoList",LVTwoMenuListByMcode);
			model.addAttribute("LVThreeList",LVThreeMenuListByMcode);
			model.addAttribute("mmCode",mCode);
		} catch (SQLException e) {
			e.printStackTrace();
			url = null;
			// throw e;
		}
		return url;
	}
	
	@RequestMapping(value = "/common/ntcnChk")
	@ResponseBody
	public ResponseEntity<NtcnVO> sendNtcnChkModify(String ntcnNo) throws SQLException{
		ResponseEntity<NtcnVO> entity = null;
		try {
			ntcnService.chkNtcn(ntcnNo);
			entity = new ResponseEntity<NtcnVO>(HttpStatus.OK);
		} catch (Exception e){
			entity = new ResponseEntity<NtcnVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}

	@RequestMapping(value = "/common/ntcnList")
	@ResponseBody
	public ResponseEntity<List<NtcnVO>> sendNtcnListPost(HttpSession session) throws SQLException{
		ResponseEntity<List<NtcnVO>> entity = null;
		int empno = ((OrgnztEmpMngtVO) session.getAttribute("loginUser")).getEmpno();
		try {
			List<NtcnVO> ntcnList = ntcnService.allNtcnList(empno);
			entity = new ResponseEntity<List<NtcnVO>>(ntcnList, HttpStatus.OK);
		} catch (Exception e){
			entity = new ResponseEntity<List<NtcnVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value = "/common/loginForm.do", method = RequestMethod.GET)
	public void loginForm() {
	}
	@RequestMapping(value = "/common/passwordChange.do", method = RequestMethod.GET)
	public void passwordChange() {
	}

	@RequestMapping(value = "/common/login", method = RequestMethod.POST)
	public String login(int empno, String pwd, HttpServletRequest request, HttpSession session, RedirectAttributes rttr)
			throws Exception {

		String url = "redirect:/index.do";
		try {
			
			empService.login(empno, pwd);
			session.setAttribute("loginUser", empService.getEmp(empno));
		
		} catch (InvalidPasswordException | NotFoundIDException e) {

			rttr.addFlashAttribute("message", e.getMessage());
			url = "redirect:/common/loginForm.do";
		} catch (PasswordChangeException e) {
			
			rttr.addFlashAttribute("message", e.getMessage());
			url = "redirect:/common/passwordChange";

		} catch (SQLException e) {

			ExceptionLoggerHelper.write(request, e, empService);
			e.printStackTrace();
			throw e;
		}
		
		return url;
	}
	
	@RequestMapping("/subMenu")
	@ResponseBody
	public ResponseEntity<List<List>> subMenuToJson(String mCode) throws Exception {
		ResponseEntity<List<List>> entity = null;

		List<MenuVO> subMenu = null;
		List<MenuVO> LVTwoMenuListByMcode = null;
		List<MenuVO> LVThreeMenuListByMcode = null;
		List<MenuVO> subSubMenu  = null;
		List<List> subMenuList = new ArrayList<List>();
	
		
		try {
			subMenu = menuService.getSubMenuList(mCode);
			LVTwoMenuListByMcode = menuService.getLevelTwoMenuListByMcode(mCode);
			LVThreeMenuListByMcode = menuService.getLevelThreeMenuListByMcode(mCode);
			subSubMenu = menuService.getSubSubMenuList(mCode);
			
			subMenuList.add(subMenu);
			subMenuList.add(LVTwoMenuListByMcode);
			subMenuList.add(LVThreeMenuListByMcode);
			subMenuList.add(subSubMenu);
			
			entity = new ResponseEntity<List<List>>(subMenuList, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<List>>(HttpStatus.INTERNAL_SERVER_ERROR);

			e.printStackTrace();
		}

		return entity;
	}

	@RequestMapping(value = "/common/logout", method = RequestMethod.POST)
	public String logout(HttpSession session) {
		String url = "redirect:/";
		session.invalidate();
		return url;
	}
	@RequestMapping(value = "/common/loginTimeOut")
	public String logintimeout(HttpSession session) {
		String url = "redirect:/";
		session.invalidate();
		return url;
	}

	@RequestMapping("/main")
	public ModelAndView main(basicCriteria cri, ApprovalAdboxCriteria cri2, ModelAndView mnv, HttpSession session) throws SQLException {
		String url = "common/main";
		OrgnztEmpMngtVO loginUser = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		int empno = loginUser.getEmpno();
		
		
		cri.setPerPageNum(5);
		cri.setDept_code(loginUser.getDept_code());
		cri.setEmpno(loginUser.getEmpno());

		// 회원 사진
		Map<String, Object> deptInfo = dclzService.getDeptInfo();
      
        // 출퇴근시간
		DclzMngtVO myCommute = dclzComService.getMyCommute(empno);
		
		// 공지사항        
		Map<String, Object> dataMap = noticeService.getNoticeList(cri);
		dataMap.put("cri", cri);
		
		// 일정 d-day
		Map<String, Object> schMap = schService.schDdayList(cri);
		schMap.put("cri", cri);
		
		// 결재대기함
		cri2.setPerPageNum(5);
		Map<String, Object> adboxMap = approvalAdboxService.eccWaitList(cri2, empno);
		adboxMap.put("cir", cri2);
		
		// 공유문서함
		Map<String, Object> public_dataMap = dbxPublicService.getDbxList(cri, empno);
		public_dataMap.put("cri", cri);
		
		// 경조사게시팜
		Map<String, Object> mngtMap = mngtService.getMngtList(cri);
		
		mnv.addObject("mngtMap", mngtMap);
		mnv.addObject("deptInfo", deptInfo);
		mnv.addObject("myCommute",myCommute);
		mnv.addObject("dataMap",dataMap);
		mnv.addObject("schMap",schMap);
		mnv.addObject("adboxMap",adboxMap);
		mnv.addObject("public_dataMap", public_dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/getMcode")
	@ResponseBody
	public ResponseEntity<MenuVO> getMcode(String mName) throws Exception{
		ResponseEntity<MenuVO> entity = null;
		
		try {
			MenuVO menu = menuService.getMenuByMname(mName);
			entity = new ResponseEntity<MenuVO>(menu, HttpStatus.OK);
		} catch(SQLException e) {
			entity = new ResponseEntity<MenuVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/pwChange")
	public String pwChange(HttpServletRequest request, EmpPwChangeCommand chaReq,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		
		String url = "redirect:/index.do";
		
		OrgnztEmpMngtVO emp = chaReq.toOrgnztEmpMngtVO();
		System.out.println(emp.getEmpno()+"사번");
		System.out.println(emp.getPassword()+"훠원번호");
		
		if(chaReq.getClsf_code().equals("C001") || chaReq.getClsf_code().equals("C002") || chaReq.getClsf_code().equals("C003") || chaReq.getClsf_code().equals("C004") || chaReq.getClsf_code().equals("C005") || chaReq.getClsf_code().equals("C006") || chaReq.getClsf_code().equals("C007"))  {
			emp.setAuthor_code("ROLE_EMPLOYEE");
		}else if(chaReq.getClsf_code().equals("C008") ) {
			emp.setAuthor_code("ROLE_DEPTMANAGER");
		}else {
			emp.setAuthor_code("ROLE_DIRECTOR");
		}
		
		empService.modifyPw(emp);
		
		rttr.addFlashAttribute("from", "pwChange");
		rttr.addFlashAttribute("msg", "비밀번호 변경이 완료되었습니다. 다시 로그인 해주세요.");
		
		return url;
		
		
	}
	@RequestMapping(value="/pwChangeMain", method = RequestMethod.POST)
	public String pwChangeMain(HttpServletRequest request, MypageModifyCommand modifyReq,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		
		String url = "redirect:/common/loginForm.do";
		
		OrgnztEmpMngtVO emp = modifyReq.toOrgnztEmpMngtVO();
		empService.modifyPwMain(emp);
		
		rttr.addFlashAttribute("from", "pwChange");
		
		return url;
		
		
	}
	
	
	
}