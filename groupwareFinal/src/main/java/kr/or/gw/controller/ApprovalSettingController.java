package kr.or.gw.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.gw.command.TreeEmpCriteria;
import kr.or.gw.dto.EccstEnvrnSetupVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.service.ApprovalSettingService;
import kr.or.gw.service.EscSetupService;
import kr.or.gw.service.TreeEmpService;

@Controller
@RequestMapping("/approval/settings")
public class ApprovalSettingController {
	@Autowired
	private TreeEmpService treeEmpservice;
	@Autowired
	ApprovalSettingService approvalSettingService;
	@Autowired
	EscSetupService escSetupService;
	
	@RequestMapping("")
	public ModelAndView setting(ModelAndView mnv,HttpSession session) throws SQLException {
		String url = "/approval/settings/settings";
		TreeEmpCriteria cri = new TreeEmpCriteria();
		cri.setPerPageNum(99999);
		List<OrgnztEmpMngtVO> empList = treeEmpservice.getEmpListnopg(cri);
		
		int empno = ((OrgnztEmpMngtVO) session.getAttribute("loginUser")).getEmpno();
		EccstEnvrnSetupVO setVO = escSetupService.selectEscSetupByEmpno(empno);
		
		OrgnztEmpMngtVO Remp = null;
		if(setVO != null) {
			Remp = treeEmpservice.getEmp(setVO.getReplc_sanctner_empno());
		}
		
		mnv.addObject("Remp",Remp);
		mnv.addObject("EcsSetting",setVO);
		mnv.addObject("empList",empList);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/sign")
	public String sign() {
		String url = "/approval/settings/sign";
		return url;
	}
	
	
	@RequestMapping("/instead")
	public ModelAndView instead(HttpServletRequest request, ModelAndView mnv) throws SQLException {
		
		TreeEmpCriteria cri = new TreeEmpCriteria();
		
		String url = "approval/settings/instead";
		
		cri.setPerPageNum(99999);
		List<OrgnztEmpMngtVO> empList = treeEmpservice.getEmpListnopg(cri);
		
		mnv.addObject("empList",empList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/approvalPassword" , method = RequestMethod.POST)
	public String approvalPassword(String sanctn_password,String password2,
			RedirectAttributes rttr,HttpServletResponse response)  throws Exception{
		String url = "redirect:/approval/settings";
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		OrgnztEmpMngtVO emp = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		
		 if(sanctn_password == null || sanctn_password.equals("")||password2 == null || password2.equals("")) {
			 sanctn_password= "1234";
		    } 
		 
		 
		if(sanctn_password.equals(password2)) {
			
		emp.setSanctn_password(sanctn_password);
		
		approvalSettingService.modify(emp);
		
		}
		
		rttr.addFlashAttribute("from", "approvalPassword");
		rttr.addFlashAttribute("empno",emp.getEmpno());
	
		return url;
	}
	
	@RequestMapping("/registReplcSetting")
	@ResponseBody
	public ResponseEntity<EccstEnvrnSetupVO> registReplcSetting (String checker,String rempno,HttpSession session) throws Exception{
		
		ResponseEntity<EccstEnvrnSetupVO> entity = null;
		
		
		try {
			int empno = ((OrgnztEmpMngtVO) session.getAttribute("loginUser")).getEmpno();
			
			EccstEnvrnSetupVO setVO = escSetupService.selectEscSetupByEmpno(empno);
			
			
			if(setVO != null) {
				setVO.setReplc_sanctner_empno(Integer.parseInt(rempno));
				setVO.setDrsc_setup(Integer.parseInt(checker));
				escSetupService.updateEscSetup(setVO);
			}else {
				EccstEnvrnSetupVO esc = new EccstEnvrnSetupVO();
				esc.setReplc_sanctner_empno(Integer.parseInt(rempno));
				esc.setDrsc_setup(Integer.parseInt(checker));
				esc.setEmpno(empno);
				escSetupService.insertEscSetup(esc);
			}
			entity = new ResponseEntity<EccstEnvrnSetupVO>(HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<EccstEnvrnSetupVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
}
