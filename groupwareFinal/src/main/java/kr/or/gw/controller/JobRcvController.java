package kr.or.gw.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.gw.dto.JobRcvVO;
import kr.or.gw.service.JobRcvService;

@Controller
@RequestMapping("/work/rcv")
public class JobRcvController {
	
	@Autowired
	private JobRcvService jobRcvService;
	
	//update
	@RequestMapping("/modifyForm")
	public ModelAndView rcvModifyForm(String job_index, ModelAndView mnv) throws SQLException {
		String url = "work/send/modify";

		JobRcvVO jRcv = jobRcvService.getJobRcvIn(job_index);
		
		mnv.addObject("jRcv", jRcv);
		mnv.setViewName(url);

		return mnv;
	}
//	
//	@RequestMapping(value = "/modify", method = RequestMethod.POST)
//	public String sendModifyPost(WorkSendModifyCommand modifyReq, HttpServletRequest request, RedirectAttributes rttr)
//			throws Exception {
//
//		String url = "redirect:/work/send/detail.do";
//
//		JobMngtVO job = modifyReq.toJobMngtVO();
//
//		List<AtchMnflVO> atchList = GetAttachesAsMultipartFiles.save(modifyReq.getUploadFile(), fileUploadPath);
//		job.setAtchList(atchList);
//		
//		job.setSj((String)request.getAttribute("XSSsj"));
//		
//		if(job.getProgrs_sittn()==0) {
//			job.setSttus_code("업무대기");
//		} else if (job.getProgrs_sittn()>0&&job.getProgrs_sittn()<100) {
//			job.setSttus_code("업무진행");
//		} else if (job.getProgrs_sittn()==100) {
//			job.setSttus_code("업무완료");
//		}
//		
//		jobService.modify(job);
//		
//		rttr.addFlashAttribute("from", "modify");
//		rttr.addAttribute("job_no", job.getJob_no());
//
//		return url;
//	}
	//delete
	
	
}
