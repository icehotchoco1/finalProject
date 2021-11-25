package kr.or.gw.controller;

import java.io.File;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.gw.command.EccstModifyCommand;
import kr.or.gw.command.EccstRegistCommand;
import kr.or.gw.command.SanctnLnRegistCommand;
import kr.or.gw.command.TreeEmpCriteria;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.DclzMngtVO;
import kr.or.gw.dto.DclzVacVO;
import kr.or.gw.dto.EccstBkmkSanctnLnDtlsVO;
import kr.or.gw.dto.EccstBkmkSanctnLnVO;
import kr.or.gw.dto.EccstDbxVO;
import kr.or.gw.dto.EccstEnvrnSetupVO;
import kr.or.gw.dto.EccstRegstrFormVO;
import kr.or.gw.dto.EccstSanctnMngtVO;
import kr.or.gw.dto.EccstSanctnerVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.dto.SchdulMngtVO;
import kr.or.gw.service.DclzService;
import kr.or.gw.service.DclzVacService;
import kr.or.gw.service.EbkmkService;
import kr.or.gw.service.ErfService;
import kr.or.gw.service.EscDbxService;
import kr.or.gw.service.EscSetupService;
import kr.or.gw.service.SchService;
import kr.or.gw.service.ScmngtService;
import kr.or.gw.service.ScnerService;
import kr.or.gw.service.TreeEmpService;
import kr.or.gw.util.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("/approval/ddbox")
public class ErfController {
	
	@Autowired
	private ErfService erfService;
	
	@Autowired
	private TreeEmpService treeEmpservice;
	
	@Autowired
	private EbkmkService ebkmkService;
	
	@Autowired
	private ScnerService scnerService;
	
	@Autowired
	private ScmngtService scmngtService;
	
	@Autowired
	private EscDbxService escDbxService;
	
	@Autowired
	private EscSetupService escSetupService;
	
	@Autowired
	private DclzService dclzService;
	
	@Autowired
	private SchService schService;
	
	@Autowired
	private DclzVacService vacService;
	
	@Resource(name = "eccstUpPath")
	private String fileUploadPath;
	
	@RequestMapping("/form")
	public ModelAndView list(ModelAndView mnv) throws SQLException {
		String url = "approval/ddbox/form";
		
		Map<String, Object> dataMap = erfService.getErfList();
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	@RequestMapping("/registForm")
	public ModelAndView registForm(HttpServletRequest request, String form_no, ModelAndView mnv) throws SQLException {
		
//		String holidayStart = request.getParameter("holidayStart");
		
		/** 파라미터 검증 */
		
		TreeEmpCriteria cri = new TreeEmpCriteria();
		
		String url = "approval/ddbox/regist";
		EccstRegstrFormVO erf = null;
		erf = erfService.getErf(form_no);
		
		/** ${holidayStart} */
		String form_cn = erf.getForm_cn();
		
		
		Enumeration<String> parameterNames = request.getParameterNames();
		while(parameterNames.hasMoreElements()) {
			String nextElement = parameterNames.nextElement();
			form_cn = form_cn.replace("${"+nextElement+"}", request.getParameter(nextElement));
			
		}
		
		cri.setPerPageNum(99999);
		List<OrgnztEmpMngtVO> empList = treeEmpservice.getEmpListnopg(cri);
		
		mnv.addObject("erf", erf);
		mnv.addObject("empList",empList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/erf1regist")
	public ModelAndView erf1Reg(HttpServletRequest request, ModelAndView mnv, String selDate ) throws SQLException {
		
//		String holidayStart = request.getParameter("holidayStart");
		
		/** 파라미터 검증 */
		
		
		
		TreeEmpCriteria cri = new TreeEmpCriteria();
		
		String url = "approval/ddbox/regist";
		EccstRegstrFormVO erf = null;
		
		/** ${holidayStart} */
//		String form_cn = erf.getForm_cn();
		
//		
//		Enumeration<String> parameterNames = request.getParameterNames();
//		while(parameterNames.hasMoreElements()) {
//			String nextElement = parameterNames.nextElement();
//			form_cn = form_cn.replace("${"+nextElement+"}", request.getParameter(nextElement));
//			
//		}
		
		
		
		erf = erfService.getErf("erf1");
		
		
		cri.setPerPageNum(99999);
		
		
		List<OrgnztEmpMngtVO> empList = treeEmpservice.getEmpListnopg(cri);
		
		mnv.addObject("erf", erf);
		mnv.addObject("empList",empList);
		mnv.addObject("selDate",selDate);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/erf5regist")
	public ModelAndView erf5Reg(HttpServletRequest request, ModelAndView mnv, String rgsde , String worktime  ) throws Exception {
		
//		String holidayStart = request.getParameter("holidayStart");
		
		/** 파라미터 검증 */
		
		
		
		TreeEmpCriteria cri = new TreeEmpCriteria();
		
		String url = "approval/ddbox/regist";
		EccstRegstrFormVO erf = null;
		
		/** ${holidayStart} */
//		String form_cn = erf.getForm_cn();
		
//		
//		Enumeration<String> parameterNames = request.getParameterNames();
//		while(parameterNames.hasMoreElements()) {
//			String nextElement = parameterNames.nextElement();
//			form_cn = form_cn.replace("${"+nextElement+"}", request.getParameter(nextElement));
//			
//		}
		
		
		
		erf = erfService.getErf("erf5");
		
		
		cri.setPerPageNum(99999);
		
		
		List<OrgnztEmpMngtVO> empList = treeEmpservice.getEmpListnopg(cri);
		
		
		
		mnv.addObject("erf", erf);
		mnv.addObject("empList",empList);
		mnv.addObject("rgsde",rgsde);
		mnv.addObject("workTime",worktime);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/erf2regist")
	public ModelAndView erf2regist(HttpServletRequest request, ModelAndView mnv, String startDate , String endDate  , String rvac) throws Exception {
		
//		String holidayStart = request.getParameter("holidayStart");
		
		/** 파라미터 검증 */
		
		
		
		TreeEmpCriteria cri = new TreeEmpCriteria();
		
		String url = "approval/ddbox/regist";
		EccstRegstrFormVO erf = null;
		
		/** ${holidayStart} */
//		String form_cn = erf.getForm_cn();
		
//		
//		Enumeration<String> parameterNames = request.getParameterNames();
//		while(parameterNames.hasMoreElements()) {
//			String nextElement = parameterNames.nextElement();
//			form_cn = form_cn.replace("${"+nextElement+"}", request.getParameter(nextElement));
//			
//		}
		
		
		
		erf = erfService.getErf("erf2");
		
		
		cri.setPerPageNum(99999);
		
		
		List<OrgnztEmpMngtVO> empList = treeEmpservice.getEmpListnopg(cri);
		
		
		
		mnv.addObject("erf", erf);
		mnv.addObject("empList",empList);
		mnv.addObject("sDe",startDate);
		mnv.addObject("eDe",endDate);
		mnv.addObject("rVac",rvac);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/saveSancForm")
	public ModelAndView saveSancForm(ModelAndView mnv,String saveSancID,String erfID,String saver)throws SQLException,NumberFormatException {
		
		String url="approval/ddbox/saveSanctner";
		
		String[] split = saveSancID.split(",");
		
		List<OrgnztEmpMngtVO> empList = new ArrayList<OrgnztEmpMngtVO>();
		
		for(int i = 0; i < split.length; i++) {
			OrgnztEmpMngtVO emp = new OrgnztEmpMngtVO();
			emp = treeEmpservice.getEmp(Integer.parseInt(split[i]));
			empList.add(emp);
			
		}
		
		mnv.addObject("saver",saver);
		mnv.addObject("erfId",erfID);
		mnv.addObject("empList",empList);
		mnv.setViewName(url);
		return mnv;
	}

	
	@RequestMapping("/saveSanctn")
	public String saveSanctners(SanctnLnRegistCommand regReq,RedirectAttributes rttr)throws SQLException{
		
		String url = "approval/ddbox/saveSuccess";
		int seq = ebkmkService.getbkmkSeq();
		
		EccstBkmkSanctnLnVO ebkmkVO = new EccstBkmkSanctnLnVO();
		
		ebkmkVO.setBkmk_no("LNBM"+seq);
		ebkmkVO.setForm_no(regReq.getForm_no());
		ebkmkVO.setRgstr_empno(regReq.getSaveUser());
		ebkmkVO.setBkmk_sj(regReq.getLineName());
		ebkmkVO.setBkmk_info(regReq.getLineInfo());
		
		ebkmkService.insertBkmk(ebkmkVO);
		
		String[] saves = regReq.getEmpno();
		
		for(int i = saves.length; i > 0; i--) {
			EccstBkmkSanctnLnDtlsVO ebkmkDtlsVO = new EccstBkmkSanctnLnDtlsVO();
			ebkmkDtlsVO.setBkmk_no("LNBM"+seq);
			ebkmkDtlsVO.setSaved_empno(Integer.parseInt(saves[i-1]));
			ebkmkDtlsVO.setLn_no(i);
			ebkmkDtlsVO.setForm_no(regReq.getForm_no());
			ebkmkService.insertBkmkDtls(ebkmkDtlsVO);
		}
		
		return url;
	}
	
	@RequestMapping("/selectSancForm")
	public ModelAndView selectSancForm (ModelAndView mnv,HttpServletRequest request)throws SQLException{
		
		String url = "approval/ddbox/selectSanctnerLine";
		HttpSession session = request.getSession();
		OrgnztEmpMngtVO emp = (OrgnztEmpMngtVO)session.getAttribute("loginUser");
		
		List<EccstBkmkSanctnLnVO> ebkmkList =ebkmkService.getBkmkList(emp.getEmpno());
		
		mnv.addObject("ebkmkList",ebkmkList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/selectSancDtls")
	@ResponseBody
	public ResponseEntity<List<OrgnztEmpMngtVO>> getDtls(String bkmk_no) throws Exception{
		ResponseEntity<List<OrgnztEmpMngtVO>> entity = null;
		TreeEmpCriteria cri = new TreeEmpCriteria();
		
		
		
		try {
			List<EccstBkmkSanctnLnDtlsVO> bkmkDtlsList = ebkmkService.getBkmkListDetail(bkmk_no);
			List<OrgnztEmpMngtVO> empList = new ArrayList<OrgnztEmpMngtVO>();
			
			for(int i = 0; i < bkmkDtlsList.size(); i++) {
				EccstBkmkSanctnLnDtlsVO dtlsVO = bkmkDtlsList.get(i);
				int empno = dtlsVO.getSaved_empno();
				OrgnztEmpMngtVO empVO = treeEmpservice.getEmp(empno);
				empList.add(empVO);
			}
			
			entity = new ResponseEntity<List<OrgnztEmpMngtVO>>(empList, HttpStatus.OK);
			
		} catch (Exception e) {
			System.out.println(e);
			entity = new ResponseEntity<List<OrgnztEmpMngtVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/removeLine")
	@ResponseBody
	public ResponseEntity<String> removeLine(String bkmk_no) throws Exception{
		ResponseEntity<String> entity = null;
		
		try {
			ebkmkService.deleteBkmkDtls(bkmk_no);
			ebkmkService.deleteBkmk(bkmk_no);
			
			entity = new ResponseEntity<String>("good", HttpStatus.OK);
			
		} catch (Exception e) {
			System.out.println(e);
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/regist",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	public String registEccst(EccstRegistCommand req,RedirectAttributes rttr,HttpServletRequest request)throws Exception{
		
		
		String url = "redirect:/approval/ddbox/fromScript.do";

		//결재기안
		EccstSanctnMngtVO mngt = req.toEccstVo();
		
		System.out.println(req.getUplFile()+"upupupupupup");
		
		List<AtchMnflVO> atchList = GetAttachesAsMultipartFiles.save(req.getUplFile(),fileUploadPath);
		
		int seq = scmngtService.selectSeqNextVal();
		String sanctn_no = "scno"+seq;
		mngt.setSanctn_no(sanctn_no);
		
		mngt.setAtchList(atchList);
		
		scmngtService.FirstRegist(mngt);
		
		//결재선
		if(!req.getSanctners().equals("")) {
			
			String[] scs = req.getSanctners().split(",");
			
			for(int i = 0; i < scs.length; i++) {
				EccstSanctnerVO sanc = new EccstSanctnerVO();
				
				
				OrgnztEmpMngtVO emp = treeEmpservice.getEmp(Integer.parseInt(scs[i]));
				
				
				sanc.setSanctn_no(sanctn_no);
				sanc.setSanctner_nm(emp.getNm());
				sanc.setSanctner_empno(Integer.parseInt(scs[i]));
				sanc.setLn_no(i+1);
				if(i == 0) {
					sanc.setSanctn_sttus("L001");
				}else {
					sanc.setSanctn_sttus("L002");
				}
				
				sanc.setLst_confirm_at("N");
				EccstEnvrnSetupVO setVO = escSetupService.selectEscSetupByEmpno(emp.getEmpno());
				
				if(setVO != null) {
					int check = setVO.getDrsc_setup();
					if (check == 1) {
						sanc.setReplace_empno(setVO.getReplc_sanctner_empno());
					}else {
						sanc.setReplace_empno(-1234567890);
					}
				}else if(setVO == null) {
					sanc.setReplace_empno(-1234567890);
				}
				
				scnerService.insertSanctners(sanc);
			}
		}
		
		//참조자
		if(!req.getRefferers().equals("")) {
			String [] dbx = req.getRefferers().split(",");
			String[] scs = req.getSanctners().split(",");
			
			List<String> dbxList = new ArrayList(Arrays.asList(dbx));
			List<String> scsList = new ArrayList(Arrays.asList(scs));
			
			
			dbxList.removeAll(scsList);
			dbxList.addAll(scsList);
			
			String [] Fdbx = dbxList.toArray(new String[0]);
			
			for(int j = 0; j < Fdbx.length; j++) {
				EccstDbxVO dbxv = new EccstDbxVO();
				
				dbxv.setEmpno(Integer.parseInt(req.getUserNum()));
				dbxv.setRec_empno(Integer.parseInt(Fdbx[j]));
				dbxv.setSanctn_no(sanctn_no);
				
				escDbxService.insertDbx(dbxv);
			}
		}else {
			if(req.getSanctners() != null && req.getSanctners().length() > 0) {
				
				String[] scs = req.getSanctners().split(",");
				
				
				for(int j = 0; j < scs.length; j++) {
					EccstDbxVO dbxv = new EccstDbxVO();
					
					dbxv.setEmpno(Integer.parseInt(req.getUserNum()));
					dbxv.setRec_empno(Integer.parseInt(scs[j]));
					dbxv.setSanctn_no(sanctn_no);
					
					escDbxService.insertDbx(dbxv);
				}
			}
		}
		if(req.getSttus().equals("G001")) {
			rttr.addFlashAttribute("from","regist1");
		}else if(req.getSttus().equals("G004")) {
			rttr.addFlashAttribute("from","regist2");
		}
		return url;
	}
	
	@RequestMapping("/fromScript")
	public String goScript() {
		String url ="approval/ddbox/fromScript";
		return url;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modify(ModelAndView mnv, String sanctn_no)throws Exception {
		String url = "approval/ddbox/modifyForm";
		
		EccstSanctnMngtVO esc = scmngtService.selectEccstDetail(sanctn_no);
		List<EccstSanctnerVO> sanctners = scnerService.selectSanctners(sanctn_no);
		List<EccstDbxVO> refferers = escDbxService.getRefferList(sanctn_no);
		List<OrgnztEmpMngtVO> scList = new ArrayList<>();
		List<OrgnztEmpMngtVO> rfList = new ArrayList<>();
		
		TreeEmpCriteria cri = new TreeEmpCriteria();
		cri.setPerPageNum(99999);
		List<OrgnztEmpMngtVO> empList = treeEmpservice.getEmpListnopg(cri);

		if(sanctners != null && sanctners.size() > 0) {
			for(EccstSanctnerVO sc : sanctners) {
				System.out.println(sc.getSanctner_empno()+"결재선");
				OrgnztEmpMngtVO emp = treeEmpservice.getEmp(sc.getSanctner_empno());
				scList.add(emp);
			}
		}
		
		if(refferers!= null && refferers.size() > 0) {
			for(EccstDbxVO bx : refferers) {
				System.out.println(bx.getRec_empno()+"참조자");
				OrgnztEmpMngtVO emp = treeEmpservice.getEmp(bx.getRec_empno());
				rfList.add(emp);
			}
		}
		
		String formStyle = erfService.getErf(esc.getForm_no()).getForm_style();
		String formNm = erfService.getErf(esc.getForm_no()).getForm_nm();
		String FileAt = erfService.getErf(esc.getForm_no()).getFileatc_at();
		
		if(esc != null) {
			List<AtchMnflVO> atchList = esc.getAtchList();
			if(atchList != null && atchList.size()>0) {
				for(AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}
		
		if(refferers!=null && refferers.size() != 0) {
			mnv.addObject("reff",rfList);
		}
		if(sanctners !=null && sanctners.size() != 0) {
			mnv.addObject("sanctners",scList);
			mnv.addObject("sancdtl",sanctners);
		}
		mnv.addObject("style",formStyle);
		mnv.addObject("formNm",formNm);
		mnv.addObject("esc",esc);
		mnv.addObject("empList",empList);
		mnv.addObject("fileatc_at",FileAt);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/modify",method = RequestMethod.POST,produces="text/plain;charset=utf-8")
	public String modify(HttpServletRequest request,EccstModifyCommand req,RedirectAttributes rttr)throws Exception{
		String url = "redirect:/approval/ddbox/fromScript.do";
		
		if(req.getDeleteFile() != null &&  req.getDeleteFile().length >0) {
			for(String file_no : req.getDeleteFile()) {
				AtchMnflVO atch =scmngtService.getAttachByFileNo(file_no);
				File deletefile = new File(atch.getUploadpath(),atch.getFile_nm());
				scmngtService.removeAttachByFileNo(file_no);
				if(deletefile.exists()) {
					deletefile.delete();
				}
				scmngtService.removeAttachByFileNo(file_no);
			}
		}
		
		if(req.getUplFile() != null && req.getUplFile().size() > 0) {
			System.out.println(req.getUplFile().size()+"<--size");
			List<MultipartFile> ff = req.getUplFile();
			
			for(MultipartFile file : ff) {
				System.out.println(file.getOriginalFilename()+"이름"); 
			}
		}
		
		
		List<AtchMnflVO> atchList = GetAttachesAsMultipartFiles.save(req.getUplFile(), fileUploadPath);
		
		
		EccstSanctnMngtVO mngt = req.toEccstVo();
		mngt.setAtchList(atchList);
		
		scmngtService.updateEccst(mngt);
		scnerService.deleteSanctners(req.getScno());
		//결재선
				if(!req.getSanctners().equals("")) {
					
					String[] scs = req.getSanctners().split(",");
					
					scnerService.deleteSanctners(req.getScno());
					for(int i = 0; i < scs.length; i++) {
						EccstSanctnerVO sanc = new EccstSanctnerVO();
						
						
						OrgnztEmpMngtVO emp = treeEmpservice.getEmp(Integer.parseInt(scs[i]));
						
						
						sanc.setSanctn_no(req.getScno());
						sanc.setSanctner_nm(emp.getNm());
						sanc.setSanctner_empno(Integer.parseInt(scs[i]));
						sanc.setLn_no(i+1);
						if(i == 0) {
							sanc.setSanctn_sttus("L001");
						}else {
							sanc.setSanctn_sttus("L002");
						}
						
						sanc.setLst_confirm_at("N");
						
						EccstEnvrnSetupVO setVO = escSetupService.selectEscSetupByEmpno(emp.getEmpno());
						
						if(setVO != null) {
							int check = setVO.getDrsc_setup();
							if (check == 1) {
								sanc.setReplace_empno(setVO.getReplc_sanctner_empno());
							}else {
								sanc.setReplace_empno(-1234567890);
							}
						}else if(setVO == null) {
							sanc.setReplace_empno(-1234567890);
						}
						
						scnerService.insertSanctners(sanc);
					}
				}
				
				escDbxService.deleteDbx(req.getScno());
				//참조자
				if(!req.getRefferers().equals("")) {
					String [] dbx = req.getRefferers().split(",");
					String[] scs = req.getSanctners().split(",");
					
					if(dbx != null && dbx.length > 0) {
						if(req.getSanctners() != null && req.getSanctners().length() > 0) {
							
							List<String> dbxList = new ArrayList(Arrays.asList(dbx));
							List<String> scsList = new ArrayList(Arrays.asList(scs));
							
							
							dbxList.removeAll(scsList);
							dbxList.addAll(scsList);
							
							String [] Fdbx = dbxList.toArray(new String[0]);
							
							escDbxService.deleteDbx(req.getScno());
							
							for(int j = 0; j < Fdbx.length; j++) {
								EccstDbxVO dbxv = new EccstDbxVO();
								
								dbxv.setEmpno(Integer.parseInt(req.getUserNum()));
								dbxv.setRec_empno(Integer.parseInt(Fdbx[j]));
								dbxv.setSanctn_no(req.getScno());
								
								escDbxService.insertDbx(dbxv);
							}
							
						}
					}else {
						if(req.getSanctners() != null && req.getSanctners().length() > 0) {
							String[] scs2 = req.getSanctners().split(",");
							
							escDbxService.deleteDbx(req.getScno());
							
							for(int j = 0; j < scs2.length; j++) {
								EccstDbxVO dbxv = new EccstDbxVO();
								
								dbxv.setEmpno(Integer.parseInt(req.getUserNum()));
								dbxv.setRec_empno(Integer.parseInt(scs2[j]));
								dbxv.setSanctn_no(req.getScno());
								
								escDbxService.insertDbx(dbxv);
							}
						}
					}
					
				}else {
					
					if(req.getSanctners() != null && req.getSanctners().length() > 0) {
						String[] scs = req.getSanctners().split(",");
						
						escDbxService.deleteDbx(req.getScno());
						
						for(int j = 0; j < scs.length; j++) {
							EccstDbxVO dbxv = new EccstDbxVO();
							
							dbxv.setEmpno(Integer.parseInt(req.getUserNum()));
							dbxv.setRec_empno(Integer.parseInt(scs[j]));
							dbxv.setSanctn_no(req.getScno());
							
							escDbxService.insertDbx(dbxv);
						}
					}
				}
		
		
		
		
		
		if(req.getSttus().equals("G001")) {
			rttr.addFlashAttribute("from","regist1");
		}else if(req.getSttus().equals("G004")) {
			rttr.addFlashAttribute("from","modify");
			rttr.addFlashAttribute("scno",req.getScno());
		}
		return url;
	}
	
	
	@RequestMapping("/detail")
	public ModelAndView Detail(ModelAndView mnv,String sanctn_no,HttpSession session) throws Exception{
		String url = "approval/ddbox/detail";
		
		EccstSanctnMngtVO esc = scmngtService.selectEccstDetail(sanctn_no);
		esc.setCn(esc.getCn().replace("contenteditable=\"true\"", ""));
		
		
		OrgnztEmpMngtVO Registeremp = treeEmpservice.getEmp(esc.getEmpno());
		
		List<EccstSanctnerVO> sanctners = scnerService.selectSanctners(sanctn_no);
		List<EccstDbxVO> refferers = escDbxService.getRefferList(sanctn_no);
		List<OrgnztEmpMngtVO> scList = new ArrayList<>();
		List<OrgnztEmpMngtVO> rfList = new ArrayList<>();
		List<OrgnztEmpMngtVO> repSanctners = new ArrayList<>();
		
		//결재 전체 대기상태인지 확인!!!
		int Chck = 1;
		
		if(sanctners != null && sanctners.size() > 0) {
			for(EccstSanctnerVO sc : sanctners) {
//				System.out.println(sc.getSanctner_empno()+"결재선");
				OrgnztEmpMngtVO emp = treeEmpservice.getEmp(sc.getSanctner_empno());
				scList.add(emp);
				
				OrgnztEmpMngtVO repEmp = treeEmpservice.getEmp(sc.getReplace_empno());
				if(repEmp == null) {
					repSanctners.add(null);
				}else {
					repSanctners.add(repEmp);
				}
				
				
				
			}
			int repCheck = 0;
			for(OrgnztEmpMngtVO rep : repSanctners) {
				if (rep != null) {
					repCheck = 1;
				}
			}
			if (repCheck == 0) {
				repSanctners = null;
			}
			if(!sanctners.get(0).getSanctn_sttus().equals("L001")){
					Chck = 0;
			}
		}
		
		if(refferers!= null && refferers.size() > 0) {
			for(EccstDbxVO bx : refferers) {
//				System.out.println(bx.getRec_empno()+"참조자");
				OrgnztEmpMngtVO emp = treeEmpservice.getEmp(bx.getRec_empno());
				rfList.add(emp);
			}
		}
		
		String formStyle = erfService.getErf(esc.getForm_no()).getForm_style();
		formStyle = formStyle.replace("#E0F2F7", "#FFFFFF");
		String formNm = erfService.getErf(esc.getForm_no()).getForm_nm();
		String FileAt = erfService.getErf(esc.getForm_no()).getFileatc_at();
		
		if(esc != null) {
			List<AtchMnflVO> atchList = esc.getAtchList();
			if(atchList != null && atchList.size()>0) {
				for(AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}
		
		
		
		if(refferers!=null && refferers.size() != 0) {
			mnv.addObject("reff",rfList);
		}
		if(sanctners !=null && sanctners.size() != 0) {
			mnv.addObject("sanctners",scList);
			mnv.addObject("sncDetail",sanctners);
			mnv.addObject("chckCn",Chck);
			mnv.addObject("repSanc",repSanctners);
		}
		mnv.addObject("style",formStyle);
		mnv.addObject("formNm",formNm);
		mnv.addObject("esc",esc);
		mnv.addObject("fileatc_at",FileAt);
		mnv.addObject("regEmp",Registeremp);
		
		
		mnv.setViewName(url);
		return mnv;
		
	}
	
	@RequestMapping("changeSttus")
	public String changeSttus (String sanctn_no,RedirectAttributes rttr)throws Exception {
		String url = "redirect:/approval/ddbox/fromScript.do";
		
		EccstSanctnMngtVO scMngtVO = new EccstSanctnMngtVO();
		scMngtVO.setSanctn_no(sanctn_no);
		scMngtVO.setSttus_code("G004");
		
		scmngtService.updateEccstStatus(scMngtVO);
		
		rttr.addFlashAttribute("from","cancel");

		return url;
	}
	
	@RequestMapping("/getFile")
	public String getFile(String file_no,Model model) throws Exception{
		String url = "downloadFile";
		
		AtchMnflVO atch = scmngtService.getAttachByFileNo(file_no);
		model.addAttribute("fileName",atch.getFile_nm());
		model.addAttribute("savedPath",atch.getUploadpath());
		
		return url;
		
	}
	
	@RequestMapping("sancHandle")
	public ModelAndView sancHandle (RedirectAttributes rttr,String sanc_no,String snerEmpno,ModelAndView mnv, String sanctn_code, String ReturnReason,String repCheck,String yearVacval)throws Exception{
		String url = "redirect:/approval/ddbox/fromScript.do";
		
		if(sanctn_code.equals("L004")) {
			EccstSanctnerVO scnerVO = new EccstSanctnerVO();
			if(repCheck.equals("Y")) {
				scnerVO.setReplace_empno(Integer.parseInt(snerEmpno));
				scnerVO.setSanctner_empno(-1234567890);
			}else {
				scnerVO.setSanctner_empno(Integer.parseInt(snerEmpno));
				scnerVO.setReplace_empno(-1234567890);
			}
			scnerVO.setSanctn_no(sanc_no);
			scnerVO.setSanctn_sttus(sanctn_code);
			scnerService.updateSanctner(scnerVO);
			
			int lnno = scnerService.selectLineNobySanctnNo(scnerVO);
			int maxlnno = scnerService.selectMaxLineNo(sanc_no);
			
			if(lnno == maxlnno) {
				scnerVO.setLst_confirm_at("Y");
				scnerService.updateAllConfirmAt(scnerVO);
				
				EccstSanctnMngtVO escVO = new EccstSanctnMngtVO();
				escVO.setSanctn_no(sanc_no);
				escVO.setSttus_code("G005");
				scmngtService.updateEccstStatus(escVO);
				
				
				EccstSanctnMngtVO sanctnVOs = scmngtService.selectEccstDetail(sanc_no);
				if(sanctnVOs.getForm_no().equals("erf5")) {
					DclzMngtVO dclz = new DclzMngtVO();
					dclz.setRgsde(sanctnVOs.getBgnde());
					dclz.setEmpno(sanctnVOs.getEmpno());
					
					dclzService.updateDclzMngtbyEmpno(dclz);
				}
				if(sanctnVOs.getForm_no().equals("erf2")) {
					SchdulMngtVO schVO = new SchdulMngtVO();
					DclzVacVO vacVO = new DclzVacVO();
					
					
					schVO.setEmpno(sanctnVOs.getEmpno());
					schVO.setNm(sanctnVOs.getNm());
					schVO.setSchdul_code("I001");
					schVO.setSchdul_sj("개인휴가");
					schVO.setSchdul_cn("개인휴가");
					DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
					
					Calendar cal = Calendar.getInstance();
					cal.setTime(sanctnVOs.getEndde());
					cal.add(Calendar.DATE, +1);
					
					schVO.setBgnde(df.format(sanctnVOs.getBgnde()));
					schVO.setEndde(df.format(cal.getTime()));
					schVO.setBg_color("#ffa94d");
					schVO.setDept_code(treeEmpservice.getEmp(sanctnVOs.getEmpno()).getDept_code());
					schService.regist(schVO);
					
					vacVO.setVcatn_no(vacService.selectVacSeqNextValue());
					vacVO.setVcatn_code("VCDE27");
					vacVO.setEmpno(sanctnVOs.getEmpno());
					vacVO.setEmpnm(sanctnVOs.getNm());
					vacVO.setTot_vcatn_daycnt(15);
					vacVO.setUse_vcatn_daycnt(Integer.parseInt(yearVacval.replace("일", "")));
					vacVO.setSanctn_no(sanc_no);
					vacService.insertVac(vacVO);
				}
				
				
			}else{
				scnerVO.setSanctn_sttus("L001");
				scnerVO.setLn_no(lnno+1);
				scnerService.updateNextSanctner(scnerVO);
			}
			
			rttr.addFlashAttribute("from","approve");
			rttr.addFlashAttribute("sanc_no",sanc_no);
		}else if(sanctn_code.equals("L003")) {
			EccstSanctnerVO scnerVO = new EccstSanctnerVO();
			EccstSanctnMngtVO escVO = new EccstSanctnMngtVO();
			

			escVO.setReturn_reason(ReturnReason);
			escVO.setSanctn_no(sanc_no);
			escVO.setSttus_code("G003");
			scmngtService.returnEccst(escVO);
			
			scnerVO.setSanctn_sttus("L003");
			scnerVO.setSanctn_no(sanc_no);
			if(repCheck.equals("Y")) {
				scnerVO.setReplace_empno(Integer.parseInt(snerEmpno));
				scnerVO.setSanctner_empno(-1234567890);
			}else {
				scnerVO.setSanctner_empno(Integer.parseInt(snerEmpno));
				scnerVO.setReplace_empno(-1234567890);
			}
			
			scnerService.updateSanctner(scnerVO);
			
			rttr.addFlashAttribute("from","reject");
			rttr.addFlashAttribute("sanc_no",sanc_no);
		}
		
		mnv.setViewName(url);
		return mnv;
	}
//	
//	@RequestMapping("/checkEccstPW")
//	@ResponseBody
//	public ResponseEntity<>()
//	
}
