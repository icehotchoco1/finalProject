package kr.or.gw.controller;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.gw.command.JobAnsModifyCommand;
import kr.or.gw.command.JobAnsRegistCommand;
import kr.or.gw.command.PageMaker;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.JobAnswerVO;
import kr.or.gw.service.JobAnsService;

// url : /replies

// job_no번 게시글의 페이징 처리된 댓글 목록
// /replies/{job_no}/{page}		page list : GET 방식
// /replies						regist : POST 방식  : 댓글 입력
// /replies/{answer_no}				modify : PUT,PATCH방식, answer_no 댓글의 수정
// /replies/{job_no}/{answer_no}/{page}	remove : DELETE방식, answer_no 댓글의 삭제
// /replies

@RestController
@RequestMapping("/replies")
public class JobAnswerController {
	
	
	@Autowired
	private JobAnsService service;
	
	@RequestMapping(value="/{job_no}/{page}",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> ansList(@PathVariable("job_no") String job_no,
														@PathVariable("page")int page)
														throws Exception {
		
		ResponseEntity<Map<String,Object>> entity = null;
		
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(page);
		
		try {
			Map<String, Object> dataMap = service.getAnsList(job_no,cri);
			entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		} catch(SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
		
	}
	
	@RequestMapping(value="",method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody JobAnsRegistCommand ansReq)
																				throws Exception {
		ResponseEntity<String> entity = null;
		JobAnswerVO ans = ansReq.toJobAnswerVO();
//		ans.setAcn(HTMLInputFilter.htmlSpecialChars(ans.getAcn()));
		
		try {
			service.registAns(ans);
			
			SearchCriteria cri = new SearchCriteria();
			
			Map<String, Object> dataMap = service.getAnsList(ans.getJob_no(), cri);
			PageMaker pageMaker = (PageMaker) dataMap.get("pageMaker");
			int realEndPage = pageMaker.getRealEndPage();
			
			entity = new ResponseEntity<String>(realEndPage+"",HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}
	
	@RequestMapping(value="/{answer_no}",method= {RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> modify(@PathVariable("answer_no") String answer_no,
													 @RequestBody JobAnsModifyCommand modifyReq)
																throws Exception {
		ResponseEntity<String> entity = null;
		
		JobAnswerVO ans = modifyReq.toJobAnswerVO();
		ans.setAnswer_no(answer_no);
		try {
			service.modifyAns(ans);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			System.out.println(entity);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/{job_no}/{answer_no}/{page}",method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("job_no") String job_no,
										@PathVariable("answer_no")String answer_no,
										@PathVariable("page")int page)
													throws Exception {
		
		ResponseEntity<String> entity = null;
		
		try {
			
			service.removeAns(answer_no);
			
			SearchCriteria cri = new SearchCriteria();
			
			Map<String, Object> dataMap = service.getAnsList(job_no, cri);
			PageMaker pageMaker = (PageMaker)dataMap.get("pageMaker");
			
			int realEndPage = pageMaker.getRealEndPage();
			if(page>realEndPage) {page=realEndPage;}
			
			entity = new ResponseEntity<String>(""+page, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
}
