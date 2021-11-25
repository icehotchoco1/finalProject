package kr.or.gw.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.AllWorkCriteria;
import kr.or.gw.command.AllWorkPageMaker;
import kr.or.gw.dao.AtchDAO;
import kr.or.gw.dao.CodeDAO;
import kr.or.gw.dao.EmpDAO;
import kr.or.gw.dao.JobAnsDAO;
import kr.or.gw.dao.JobDAO;
import kr.or.gw.dao.JobRcvDAO;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.JobMngtVO;
import kr.or.gw.dto.JobRcvVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public class JobServiceImpl implements JobService {

	private JobDAO jobDAO;
	public void setJobDAO(JobDAO jobDAO) {
		this.jobDAO = jobDAO;
	}
	private AtchDAO atchDAO;
	public void setAtchDAO(AtchDAO atchDAO) {
		this.atchDAO = atchDAO;
	}
	private CodeDAO codeDAO;
	public void setCodeDAO(CodeDAO codeDAO) {
		this.codeDAO = codeDAO;
	}
	private JobAnsDAO jobAnsDAO;
	public void setJobAnsDAO(JobAnsDAO jobAnsDAO) {
		this.jobAnsDAO = jobAnsDAO;
	}
	private JobRcvDAO jobRcvDAO;
	public void setJobRcvDAO(JobRcvDAO jobRcvDAO) {
		this.jobRcvDAO = jobRcvDAO;
	}
	private EmpDAO empDAO;
	public void setEmpDAO(EmpDAO empDAO) {
		this.empDAO = empDAO;
	}
	
	//공통
	@Override
	public JobMngtVO getJob(String job_no) throws SQLException {
		JobMngtVO job = jobDAO.selectJobByJno(job_no);
		addAtchList(job);
		
		List<JobRcvVO> jRcvList = jobRcvDAO.selectJobRcvByJobNo(job_no);
		
		int avg = 0;
		int sum = 0;
		List<Integer> b = new ArrayList<>();
		
		for(JobRcvVO vo : jRcvList) {
			int a = vo.getRcver_progrs();
			b.add(a);
		}
		for(int i = 0; i < b.size(); i++) {
			sum += b.get(i);
			System.out.println(b.size());
		}
		
		avg = sum/b.size();
		job.setRcver_progrs(avg);
		
		if(job.getRcver_progrs()==0) {
			job.setSttus_code("J001");
		} else if (job.getRcver_progrs()>0&&job.getRcver_progrs()<100) {
			job.setSttus_code("J002");
		} else if (job.getRcver_progrs()==100) {
			job.setSttus_code("J003");
		}
		
		return job;
	}
	
	
	
	@Override
	public void remove(String job_no) throws SQLException {
		jobAnsDAO.deleteAllAns(job_no);
		jobRcvDAO.deleteJobRcv(job_no);
		jobDAO.deleteJob(job_no);
	}
	
	
	
	//업무 지시하기
	@Override
	public void sendRegist(JobMngtVO job) throws SQLException {
		String job_no = jobDAO.selectJobSeqNextValue();
		job.setJob_no(job_no);
		
		int index = 0;
		
		if(job.getAtchList() != null) {
			for(AtchMnflVO atch : job.getAtchList()) {
				atch.setBbsctt_no(job_no);
				atch.setAtch_order(index);
				atchDAO.insertAtch(atch);
				index++;
			}
		}
		
		//im_code 		낮음, 보통, 긴급
		//sttus_code	대기, 진행, 완료, 지연
		
		//스트링으로 받아온 다음 스트링에 해당하는 코드값을 불러와야한다.
		String im = job.getIm_code();
		String im_code = codeDAO.selectCodeNoByDc(im);
		job.setIm_code(im_code);
		
		jobDAO.insertJob(job);
		
		
		// jrcvList = 1,2,3 사번리스트     String[]
		// JobRcvVO = 사번, 이름, 순번
		
		int[] jrcvList = job.getJrempnoList();
		for (int empno : jrcvList) {
			OrgnztEmpMngtVO vo = (OrgnztEmpMngtVO)empDAO.selectEmpByEmpno(empno);
			int rcver_empno = vo.getEmpno();
			String rcver_nm = vo.getNm();
			
			
			String jobRcv_index = jobRcvDAO.selectJobRcvSequenceNextValue();
			JobRcvVO jrcv = new JobRcvVO();
			jrcv.setJob_index(jobRcv_index);
			jrcv.setJob_no(job_no);
			jrcv.setRcver_empno(rcver_empno);
			jrcv.setRcver_nm(rcver_nm);
			jrcv.setRcver_order(index);
			jobRcvDAO.insertJobRcv(jrcv);
			index++;
		}
	}
	
	//업무 수정
	@Override
	public void modify(JobMngtVO job) throws SQLException {

		int index = 1+job.getAtchList().size();
		if(job.getAtchList() != null) {
			for(AtchMnflVO atch : job.getAtchList()) {
				atch.setBbsctt_no(job.getJob_no());
				atch.setAtch_order(index);
				atchDAO.insertAtch(atch);
				index++;
			}
		}
		
		String im = job.getIm_code();
		System.out.println("imimimimimimimimimimimimim"+im);
		if(im.equals("H001")||im.equals("H002")||im.equals("H004")) {
			job.setIm_code(im);
		} else {
			String im_code = codeDAO.selectCodeNoByDc(im);
			job.setIm_code(im_code);
		}
		
		jobDAO.updateJob(job);
	}
	
	//전체업무조회
	@Override
	public Map<String, Object> getJobList(AllWorkCriteria cri) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져온다.
		List<JobMngtVO> jobList = jobDAO.selectSearchJobList(cri);
		
		if(jobList != null) {
			for(JobMngtVO alljob : jobList) {
				addAtchList(alljob);
			}
			for(JobMngtVO jRcv : jobList) {
				addRcverList(jRcv);
			}
		}
		int totalCount = jobDAO.selectSearchJobListCount(cri);
		
		
		// pageMaker 생성
		AllWorkPageMaker pageMaker = new AllWorkPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("jobList", jobList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	//대기 업무 조회
	@Override
	public Map<String, Object> getJobWaitList(AllWorkCriteria cri, int rcver_empno) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져온다.
		List<JobMngtVO> jobWaitList = jobDAO.selectSearchJobWaitList(cri, rcver_empno);
		
		if(jobWaitList != null) {
			for(JobMngtVO alljob : jobWaitList) {
				addAtchList(alljob);
			}
			for(JobMngtVO jRcv : jobWaitList) {
				addRcverList(jRcv);
			}
		}

		int totalCount = jobDAO.selectSearchJobWaitListCount(cri, rcver_empno);
		
		// pageMaker 생성
		AllWorkPageMaker pageMaker = new AllWorkPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("jobWaitList", jobWaitList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	
	//받은 업무 조회
	@Override
	public Map<String, Object> getJobRecList(AllWorkCriteria cri, int rcver_empno) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져온다.
		List<JobMngtVO> jobRecList = jobDAO.selectSearchJobRecList(cri, rcver_empno);
		
		if(jobRecList != null) {
			for(JobMngtVO alljob : jobRecList) {
				addAtchList(alljob);
			}
			for(JobMngtVO jRcv : jobRecList) {
				addRcverList(jRcv);
			}
		}
		
		int totalCount = jobDAO.selectSearchJobRecListCount(cri, rcver_empno);
		
		// pageMaker 생성
		AllWorkPageMaker pageMaker = new AllWorkPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("jobRecList", jobRecList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	//지시 업무 조회
	@Override
	public Map<String, Object> getJobSendList(AllWorkCriteria cri, int drctr_empno) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져온다.
		List<JobMngtVO> jobSendList = jobDAO.selectSearchJobSendList(cri, drctr_empno);
		
		if(jobSendList != null) {
			for(JobMngtVO alljob : jobSendList) {
				addAtchList(alljob);
			}
			for(JobMngtVO jRcv : jobSendList) {
				addRcverList(jRcv);
			}
		}
		
		int totalCount = jobDAO.selectSearchJobSendListCount(cri, drctr_empno);
		
		// pageMaker 생성
		AllWorkPageMaker pageMaker = new AllWorkPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("jobSendList", jobSendList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	//완료리스트조회
	@Override
	public Map<String, Object> getJobCompletionList(AllWorkCriteria cri, int rcver_empno, int drctr_empno) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져온다.
		List<JobMngtVO> jobComList = jobDAO.selectSearchJobCompletionList(cri, rcver_empno, drctr_empno);
		
		if(jobComList != null) {
			for(JobMngtVO alljob : jobComList) {
				addAtchList(alljob);
			}
			for(JobMngtVO jRcv : jobComList) {
				addRcverList(jRcv);
			}
		}

		int totalCount = jobDAO.selectSearchJobCompletionListCount(cri, rcver_empno, drctr_empno);
		
		// pageMaker 생성
		AllWorkPageMaker pageMaker = new AllWorkPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("jobComList", jobComList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	//첨부파일
	@Override
	public AtchMnflVO getAttachByFileNo(String file_no) throws SQLException {
		AtchMnflVO atch = atchDAO.selectAtchByFileNo(file_no);
		return atch;
	}
	
	@Override
	public void removeAttachByFileNo(String file_no) throws SQLException {
		atchDAO.deleteAtch(file_no);
	}
	
	private void addAtchList(JobMngtVO job) throws SQLException{
		if(job == null) {
			return;
		}
		String job_no = job.getJob_no();
		List<AtchMnflVO> atchList = atchDAO.selectAtchByBbscttNo(job_no);
		
		job.setAtchList(atchList);
	}
	
	private void addRcverList(JobMngtVO job) throws SQLException{
		if(job==null) {
			return;
		}
		String job_no = job.getJob_no();
		List<JobRcvVO> jRcvList = jobRcvDAO.selectJobRcvByJobNo(job_no);
		
		int avg = 0;
		int sum = 0;
		List<Integer> b = new ArrayList<>();
		
		for(JobRcvVO vo : jRcvList) {
			int a = vo.getRcver_progrs();
			b.add(a);
		}
		for(int i = 0; i < b.size(); i++) {
			sum += b.get(i);
			System.out.println(b.size());
		}
		
		avg = sum/b.size();
		job.setRcver_progrs(avg);
		
		if(job.getRcver_progrs()==0) {
			job.setSttus_code("J001");
		} else if (job.getRcver_progrs()>0&&job.getRcver_progrs()<100) {
			job.setSttus_code("J002");
		} else if (job.getRcver_progrs()==100) {
			job.setSttus_code("J003");
		}
		
		job.setJrcvList(jRcvList);
	}
	
	
}

