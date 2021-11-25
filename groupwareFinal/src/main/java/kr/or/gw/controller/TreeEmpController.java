package kr.or.gw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.gw.command.TreeEmpCriteria;
import kr.or.gw.command.TreeEmpModifyCommand;
import kr.or.gw.command.TreeEmpRegistCommand;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.service.TreeEmpService;
import kr.or.gw.util.MakeFileName;

@Controller
@RequestMapping("/organogram")
public class TreeEmpController {
	@Autowired
	private TreeEmpService treeEmpService;
	
	@Resource(name="memberPicture")
	private String memberPicture;
	
	@RequestMapping("/main")
	public ModelAndView list (TreeEmpCriteria cri,ModelAndView mnv) throws SQLException{
		String url ="organogram/list";
		
		Map<String, Object> dataMap = treeEmpService.getEmpList(cri);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value = "registForm",method = RequestMethod.GET)
	public String registForm() {
		String url = "organogram/regist";
		return url;
	}
	
	@RequestMapping(value = "/picture", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> picture(@RequestParam("pictureFile") MultipartFile multi, String oldPicture)
			throws Exception {
		ResponseEntity<String> entity = null;

		String result = "";
		HttpStatus status = null;

		/* 파일저장확인 */
		if ((result = savePicture(oldPicture, multi)) == null) {
			result = "업로드 실패했습니다.!";
			status = HttpStatus.BAD_REQUEST;
		} else {
			status = HttpStatus.OK;
		}

		entity = new ResponseEntity<String>(result, status);

		return entity;
	}
	
	private String savePicture(String oldPicture, MultipartFile multi) throws Exception {
		String fileName = null;

		/* 파일유무확인 */
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {

			/* 파일저장폴더설정 */
			String uploadPath = memberPicture;
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile = new File(uploadPath, fileName);

			storeFile.mkdirs();

			// local HDD 에 저장.
			multi.transferTo(storeFile);

			if (oldPicture != null && !oldPicture.isEmpty()) {
				File oldFile = new File(uploadPath, oldPicture);
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		return fileName;
	}
	
	@RequestMapping(value = "/getPicture", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getPicture(String picture) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.memberPicture;
		try {

			in = new FileInputStream(new File(imgPath, picture));

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
					HttpStatus.CREATED);
		} catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		return entity;
	}
	
	@RequestMapping(value = "/getPictureByEmpno/{empno}",method=RequestMethod.GET, 
			produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getPictureById(@PathVariable("empno") int empno) 
																throws Exception {
		String picture =  treeEmpService.getEmp(empno).getFace_photo();
			
		return  getPicture(picture);
	}
	
	@RequestMapping("/empnoCheck")
	@ResponseBody
	public ResponseEntity<String> idCheck(int empno) throws Exception {
		ResponseEntity<String> entity = null;

		try {
			OrgnztEmpMngtVO emp = treeEmpService.getEmp(empno);
			
			if (emp != null) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("", HttpStatus.OK);
			}
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(TreeEmpRegistCommand empRegReq) throws SQLException, IOException {
		String url = "organogram/regist_success";
		
		OrgnztEmpMngtVO emp = empRegReq.toEmpVO();
		treeEmpService.regist(emp);

		return url;
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@ModelAttribute("empno") int empno, Model model) 
													throws SQLException {
		String url = "organogram/detail";
		
		System.out.println(empno+"<--- empno!");
		
		OrgnztEmpMngtVO emp = treeEmpService.getEmp(empno);
		
		model.addAttribute("emp", emp);
		
		return url;
	}
	
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public String modifyForm(int empno, Model model)throws SQLException {

		String url = "organogram/modify";
		
		OrgnztEmpMngtVO emp = treeEmpService.getEmp(empno);
		
		model.addAttribute("emp", emp);
		

		return url;
	}
	
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(TreeEmpModifyCommand empModifyReq ,HttpSession session,
						 RedirectAttributes rttr)throws Exception {
		String url="redirect:/organogram/detail.do";
		
		OrgnztEmpMngtVO emp = empModifyReq.toEmpVO();
		
		
		emp.setPassword(treeEmpService.getEmp(empModifyReq.getEmpno()).getPassword());
		emp.setAuthor_code(treeEmpService.getEmp(empModifyReq.getEmpno()).getAuthor_code());
		

		// 신규 파일 변경 및 기존 파일 삭제
		String fileName = savePicture(empModifyReq.getOldPicture(), empModifyReq.getPicture());
		emp.setFace_photo(fileName);
		
		//파일변경 없을시 기존 파일명 유지
		if (empModifyReq.getPicture().isEmpty()) {
			emp.setFace_photo(empModifyReq.getOldPicture());
		}
		//DB 내용 수정
		treeEmpService.modify(emp);
		
		rttr.addFlashAttribute("parentReload",false);
		
		// 로그인한 사용자의 경우 수정된 정보로 session 업로드
		OrgnztEmpMngtVO loginUser = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		if (loginUser != null && emp.getEmpno() == (loginUser.getEmpno())) {
			session.setAttribute("loginUser", emp);
			rttr.addFlashAttribute("parentReload",true);
		}
		
		rttr.addAttribute("empno",emp.getEmpno());
		rttr.addAttribute("from","modify");
		
		rttr.addFlashAttribute("emp",treeEmpService.getEmp(empModifyReq.getEmpno()));
		
		return url;
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(int empno, HttpSession session, RedirectAttributes rttr) throws SQLException {
		String url = "redirect:/organogram/detail.do";
		
		OrgnztEmpMngtVO emp;

		// 이미지 파일을 삭제
		emp = treeEmpService.getEmp(empno);
		String savePath = this.memberPicture;
		File imageFile = new File(savePath, emp.getFace_photo());
		if (imageFile.exists()) {
			imageFile.delete();
		}
		//DB삭제
		treeEmpService.remove(empno);
		
		// 삭제되는 회원이 로그인 회원인경우 로그아웃 해야함.
		OrgnztEmpMngtVO loginUser = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		if (loginUser.getEmpno()==(emp.getEmpno())) {
			session.invalidate();
		}
		
		rttr.addFlashAttribute("removeEmp",emp);
		
		rttr.addAttribute("from","remove");		
		rttr.addAttribute("empno",empno);
		
		return url;
	}
	
	
}
