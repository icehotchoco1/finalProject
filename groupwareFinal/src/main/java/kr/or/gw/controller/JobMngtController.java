package kr.or.gw.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.gw.command.AllWorkCriteria;
import kr.or.gw.command.TreeEmpCriteria;
import kr.or.gw.command.WorkSendModifyCommand;
import kr.or.gw.command.WorkSendRegistCommand;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.JobMngtVO;
import kr.or.gw.dto.JobRcvVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.service.JobRcvService;
import kr.or.gw.service.JobService;
import kr.or.gw.service.TreeEmpService;
import kr.or.gw.util.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("/work")
public class JobMngtController {
	
	@Autowired
	private JobService jobService;
	
	@Autowired
	private TreeEmpService treeEmpservice;
	
	@Autowired
	private JobRcvService jobRcvService;
	
	@Resource(name = "jobFileUpPath")
	private String fileUploadPath;
	
	@RequestMapping("/main")
	public String main(AllWorkCriteria cri, HttpSession session, Model model) throws SQLException {
		String url = "work/main";
		
		int rcver_empno = ((OrgnztEmpMngtVO)session.getAttribute("loginUser")).getEmpno();
		int drctr_empno = ((OrgnztEmpMngtVO)session.getAttribute("loginUser")).getEmpno();
		
		Map<String,Object> result1 = jobService.getJobList(cri);
		Map<String,Object> result2 = jobService.getJobRecList(cri, rcver_empno);
		Map<String,Object> result3 = jobService.getJobWaitList(cri, rcver_empno);
		Map<String,Object> result4 = jobService.getJobSendList(cri, drctr_empno);
		Map<String,Object> result5 = jobService.getJobCompletionList(cri, rcver_empno,drctr_empno);
		
		model.addAttribute("jobList", result1);
		model.addAttribute("jobRecList", result2);
		model.addAttribute("jobWaitList", result3);
		model.addAttribute("jobSendList", result4);
		model.addAttribute("jobComList", result5);
		
		return url;
	}
	
	//첨부파일
	@RequestMapping("/getFile")
	public String getFile(String file_no, Model model) throws Exception {
		String url = "downloadFile";
		
		AtchMnflVO atch = jobService.getAttachByFileNo(file_no);
		model.addAttribute("fileName", atch.getFile_nm());
		model.addAttribute("savedPath", atch.getUploadpath());
		
		return url;
	}
	
	//===========================================전체 업무================================allwork==============================
	
	@RequestMapping("/allwork")
	public String allwork(AllWorkCriteria cri, Model model) throws SQLException {
		String url = "work/allwork/list";
		
		Map<String,Object> result = jobService.getJobList(cri);
		
		model.addAttribute("dataMap", result);
		
		return url;
	}
	//===========================================받은 업무============================receive=============================
	@RequestMapping("/receive")
	public String receiveList(AllWorkCriteria cri, HttpSession session,Model model) throws SQLException {
		String url = "work/receive/list";
		
		int rcver_empno = ((OrgnztEmpMngtVO)session.getAttribute("loginUser")).getEmpno();
		
		Map<String,Object> result = jobService.getJobRecList(cri, rcver_empno);
		
		model.addAttribute("dataMap",result);
		
		return url;
	}
	
	public ModelAndView receiveDetail(String job_no, ModelAndView mnv) throws SQLException {
		String url = "work/send/detail";
		
		JobMngtVO job = jobService.getJob(job_no);
		
		// 파일명 재정의
		if (job != null) {
			List<AtchMnflVO> atchList = job.getAtchList();
			if (atchList != null) {
				for (AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}
		
		jobRcvService.getJobRcvNo(job_no);
		
		mnv.addObject("job", job);
		mnv.setViewName(url);

		return mnv;
		
	}
	
	
	//대기 업무======waitwork=========
	@RequestMapping("/waitwork")
	public String waitworkList(AllWorkCriteria cri, HttpSession session,Model model) throws SQLException {
		String url = "work/waitwork/list";
		
		int rcver_empno = ((OrgnztEmpMngtVO)session.getAttribute("loginUser")).getEmpno();
		
		Map<String,Object> result = jobService.getJobWaitList(cri, rcver_empno);
		
		model.addAttribute("dataMap",result);
		return url;
	}
	
	//지시 업무==========send========
	@RequestMapping("/send")
	public String sendList(AllWorkCriteria cri, HttpSession session,Model model) throws SQLException {
		String url = "work/send/list";
		
		int drctr_empno = ((OrgnztEmpMngtVO)session.getAttribute("loginUser")).getEmpno();
		
		Map<String,Object> result = jobService.getJobSendList(cri, drctr_empno);
		
	    model.addAttribute("dataMap",result);
	    
	    return url;
	}

	@RequestMapping("/send/registForm")
	public ModelAndView sendRegistForm(AllWorkCriteria cri, ModelAndView mnv) throws SQLException {
		String url = "work/send/regist";
		
		TreeEmpCriteria empCri = new TreeEmpCriteria();
		empCri.setPerPageNum(99999);
		List<OrgnztEmpMngtVO> empList = treeEmpservice.getEmpListnopg(empCri);
		
		Map<String, Object> dataMap = jobService.getJobList(cri);
		
		mnv.addObject("empList",empList);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}

	@RequestMapping(value="send/regist", method= RequestMethod.POST,produces="text/plain;charset=utf-8")
	public String sendRegist(WorkSendRegistCommand regReq, String jrcv, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		String url = "redirect:/work/send";
		
		JobMngtVO job = regReq.toJobMngtVO();
		
		//첨부파일
		List<AtchMnflVO> atchList = GetAttachesAsMultipartFiles.save(regReq.getUploadFile(), fileUploadPath);
		job.setAtchList(atchList);
		
		
		System.out.println("===================담당자 지정========================");
		
		//수신자설정=======================================
		String[] rcver_array = jrcv.split(",");
		int[] rcver_empno_array = new int[rcver_array.length];
		for(int i = 0; i < rcver_array.length; i++) {
		    rcver_empno_array[i] = Integer.parseInt(rcver_array[i]);
		}
		
		job.setJrempnoList(rcver_empno_array);
		
		//======================================================
		
		
		job.setSj((String) request.getAttribute("XSSsj"));
		
		jobService.sendRegist(job);
		rttr.addFlashAttribute("from", "regist");

		return url;
	}

	@RequestMapping("/send/detail")
	public ModelAndView sendDetail(String job_no, ModelAndView mnv) throws SQLException {
		String url = "work/send/detail";

		JobMngtVO job = jobService.getJob(job_no);

		// 파일명 재정의
		if (job != null) {
			List<AtchMnflVO> atchList = job.getAtchList();
			if (atchList != null) {
				for (AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}
		
		List<JobRcvVO> jobRcvList = jobRcvService.getJobRcvNo(job_no);
		mnv.addObject("jobRcvList", jobRcvList);
		mnv.addObject("job", job);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/send/modifyForm")
	public ModelAndView sendModifyForm(String job_no, ModelAndView mnv) throws SQLException {
		String url = "work/send/modify";

		JobMngtVO job = jobService.getJob(job_no);
		
		//파일명 재정의
		if(job != null) {
			List<AtchMnflVO> atchList = job.getAtchList();
			if(atchList != null) {
				for(AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}
		
		List<JobRcvVO> jobRcvList = jobRcvService.getJobRcvNo(job_no);
		mnv.addObject("jobRcvList", jobRcvList);
		mnv.addObject("job", job);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/send/modify", method = RequestMethod.POST)
	public String sendModifyPost(WorkSendModifyCommand modifyReq, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		String url = "redirect:/work/send/detail.do";

		if(modifyReq.getDeleteFile() != null && modifyReq.getDeleteFile().length > 0) {
			for(String file_no : modifyReq.getDeleteFile()) {
				AtchMnflVO atch = jobService.getAttachByFileNo(file_no);
				File deleteFile = new File(atch.getUploadpath(),atch.getFile_nm());
				jobService.removeAttachByFileNo(file_no);
				if(deleteFile.exists()) {
					deleteFile.delete();
				}
				jobService.removeAttachByFileNo(file_no);
			}
		}
		
		JobMngtVO job = modifyReq.toJobMngtVO();

		List<AtchMnflVO> atchList = GetAttachesAsMultipartFiles.save(modifyReq.getUploadFile(), fileUploadPath);
		job.setAtchList(atchList);
		
		job.setSj((String)request.getAttribute("XSSsj"));
		
		jobService.modify(job);
		
		//담당자 진행도 수정
		if(modifyReq.getJob_index()!=null) {
			JobRcvVO jRcv = modifyReq.toJobRcvVO();
			jobRcvService.modify(jRcv);
		}
		
		
		
		rttr.addFlashAttribute("from", "modify");
		rttr.addAttribute("job_no", job.getJob_no());

		return url;
	}

	@RequestMapping(value = "/send/remove", method = RequestMethod.POST)
	public String sendRemove(String job_no, RedirectAttributes rttr) throws Exception {
		String url = "work/remove_success";
		
		List<AtchMnflVO> atchList = jobService.getJob(job_no).getAtchList();
		if(atchList !=  null) {
			for(AtchMnflVO atch : atchList) {
				File target = new File (atch.getUploadpath(),atch.getFile_nm());
				if(target.exists()) {
					target.delete();
				}
			}
		}
		
		
		jobService.remove(job_no);

		rttr.addFlashAttribute("from", "remove");
		rttr.addAttribute("job_no", job_no);
		
		return url;
	}

	//완료 업무=======completion=====
	@RequestMapping("/completion")
	public String completionList(AllWorkCriteria cri, HttpSession session, Model model) throws SQLException{
		String url = "work/completion/list";
		
		int rcver_empno = ((OrgnztEmpMngtVO)session.getAttribute("loginUser")).getEmpno();
		int drctr_empno = ((OrgnztEmpMngtVO)session.getAttribute("loginUser")).getEmpno();
		
		Map<String, Object> result = jobService.getJobCompletionList(cri, rcver_empno, drctr_empno);
		
		model.addAttribute("dataMap",result);
		
		return url;
	}

	@RequestMapping("/completion/detail")
	public ModelAndView completionDetail(String job_no, ModelAndView mnv) throws SQLException {
		String url = "work/send/detail";

		JobMngtVO job = jobService.getJob(job_no);
		
		
		// 파일명 재정의
		if (job != null) {
			List<AtchMnflVO> atchList = job.getAtchList();
			if (atchList != null) {
				for (AtchMnflVO atch : atchList) {
					String file_nm = atch.getFile_nm().split("\\$\\$")[1];
					atch.setFile_nm(file_nm);
				}
			}
		}

		mnv.addObject("job", job);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping(value = "/completion/remove", method = RequestMethod.POST)
	public String completionRemove(String job_no, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/work/send/detail.do";
		
		List<AtchMnflVO> atchList = jobService.getJob(job_no).getAtchList();
		if(atchList !=  null) {
			for(AtchMnflVO atch : atchList) {
				File target = new File (atch.getUploadpath(),atch.getFile_nm());
				if(target.exists()) {
					target.delete();
				}
			}
		}
		
		jobService.remove(job_no);

		rttr.addFlashAttribute("from", "remove");
		rttr.addAttribute("job_no", job_no);
		
		return url;
	}

	
	
}
