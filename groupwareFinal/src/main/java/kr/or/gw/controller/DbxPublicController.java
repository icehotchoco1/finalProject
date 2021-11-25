package kr.or.gw.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.gw.command.DbxCcrShareCommand;
import kr.or.gw.command.DbxPublicRegistCommand;
import kr.or.gw.command.TreeEmpCriteria;
import kr.or.gw.command.basicCriteria;
import kr.or.gw.dto.DbxCocnrVO;
import kr.or.gw.dto.DbxVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.service.DbxCcrService;
import kr.or.gw.service.DbxPublicService;
import kr.or.gw.service.TreeEmpService;

@Controller
@RequestMapping("/document")
public class DbxPublicController {
	
	@Autowired
	private DbxPublicService dbxPublicService;

	@Autowired
	private TreeEmpService treeEmpservice;
	
	@Autowired
	private DbxCcrService dbxCcrService;
	
	@RequestMapping("/public")
	public ModelAndView list(basicCriteria cri, ModelAndView mnv, HttpSession session) throws SQLException {
		String url = "document/public/list";
		OrgnztEmpMngtVO loginUser = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		int rcvr_empno = loginUser.getEmpno();
//		Map<String, Object> dataMap = dbxPublicService.getDbxList(cri);
		Map<String, Object> dataMap = dbxPublicService.getDbxList(cri,rcvr_empno);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}

	@RequestMapping("/public/registForm")
	public ModelAndView registForm(ModelAndView mnv) throws SQLException{
		String url = "document/public/regist";

		TreeEmpCriteria empCri = new TreeEmpCriteria();
		empCri.setPerPageNum(99999);
		List<OrgnztEmpMngtVO> empList = treeEmpservice.getEmpListnopg(empCri);
		
		String dbxNext = dbxPublicService.dbxNext();
		
		mnv.addObject("dbxNext",dbxNext);
		mnv.addObject("empList",empList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/public/regist", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String regist(DbxPublicRegistCommand regReq,
							HttpServletRequest request,
							RedirectAttributes rttr) throws Exception {
		String url = "redirect:/document/public";
		
		DbxVO dbx = regReq.toDbsVO();
		
		dbx.setSj((String)request.getAttribute("XSSsj"));
		
		dbxPublicService.regist(dbx);
		
		rttr.addFlashAttribute("from", "regist");
		
		return url;
	}
	
	
	@RequestMapping("/public/shareForm")
	public ModelAndView shareForm(ModelAndView mnv, HttpSession session) throws SQLException{
		OrgnztEmpMngtVO loginUser = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		int rcvr_empno = loginUser.getEmpno();
		
		TreeEmpCriteria empCri = new TreeEmpCriteria();
		empCri.setPerPageNum(99999);
		List<OrgnztEmpMngtVO> empList = treeEmpservice.getEmpListnopg(empCri);
		
		String url = "document/public/share";
		Map<String, Object> dataMap = dbxPublicService.getDbxAllList(rcvr_empno);
		
		mnv.addObject("empList",empList);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/public/share", method= RequestMethod.POST,produces="text/plain;charset=utf-8")
	public String share(RedirectAttributes rttr,DbxCcrShareCommand regReq, HttpServletRequest request) throws SQLException {
		String url = "redirect:/document/public";
		
//		System.out.println("====================share========================");
		List<DbxCocnrVO> dbxList = regReq.toDbxCocnrVOList();
		
		for(DbxCocnrVO dbxVO : dbxList) {
			dbxCcrService.share(dbxVO);
			dbxPublicService.modifySe(dbxVO.getDbx_no());
			
//			
//			System.out.println(dbxVO.getDbx_no());
//			System.out.println(dbxVO.getCocnr_no());
//			System.out.println(dbxVO.getCocnr_empno());
//			System.out.println(dbxVO.getCocnr_nm());
//			System.out.println(dbxVO.getRcvr_empno());
//			System.out.println("============절취선===========================");
		}
		
		DbxVO dbx = regReq.toDbsVO();

		if (dbx.getSj() != null) {
			
			dbx.setSj((String)request.getAttribute("XSSsj"));
			
			dbxPublicService.regist(dbx);
		}
		
		rttr.addFlashAttribute("from", "share"); 
		
		
		return url;
	}
	
	@RequestMapping(value="/public/modalDoc", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<DbxVO>> modalDocForm(
					@RequestParam(value="docList[]") List<String> docList) throws Exception {
		
		ResponseEntity<List<DbxVO>> entity = null;

		List<DbxVO> dblist = new ArrayList<>(); 

		
//		System.out.println("============================================");
		for (String dbx_no : docList) {
//			System.out.println(dbx_no);
			
			DbxVO put = dbxPublicService.getDbxAll(dbx_no);
			dblist.add(put);
		}
		
		entity = new ResponseEntity<List<DbxVO>>(dblist, HttpStatus.OK);
		
		return entity;
	}

	
	@RequestMapping("/public/detail")
	public ModelAndView detail(String dbx_no, String from, ModelAndView mnv) throws SQLException {
		String url = "document/public/detail";
		
		DbxVO dbx = null;
		
		if (from!=null && from.equals("list")) {
			dbx = dbxPublicService.getDbx(dbx_no);
			
			url = "redirect:/document/public/detail.do?dbx_no=" + dbx_no;
		} else {
			dbx = dbxPublicService.getDbxForModify(dbx_no);
		}
		
		mnv.addObject("dbx", dbx);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	@RequestMapping(value="/public/remove", method=RequestMethod.POST)
	public String remove(String dbx_no, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/document/public.do";
		
		dbxPublicService.removeShare(dbx_no);
		dbxPublicService.remove(dbx_no);
		
		rttr.addAttribute("dbx_no", dbx_no);
		rttr.addFlashAttribute("from", "remove");
		
		return url;
		
	}
	

	
}
