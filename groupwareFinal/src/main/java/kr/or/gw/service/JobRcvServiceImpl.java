package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.AllWorkCriteria;
import kr.or.gw.command.AllWorkPageMaker;
import kr.or.gw.dao.JobRcvDAO;
import kr.or.gw.dto.JobRcvVO;

public class JobRcvServiceImpl implements JobRcvService {

	private JobRcvDAO jobRcvDAO;
	public void setJobRcvDAO(JobRcvDAO jobRcvDAO) {
		this.jobRcvDAO = jobRcvDAO;
	}

	@Override
	public Map<String, Object> getJobRcvList(AllWorkCriteria cri) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져온다.
		List<JobRcvVO> jobRcvList = jobRcvDAO.selectSearchJobRcvList(cri);
		
		int totalCount = jobRcvDAO.selectSearchJobRcvListCount(cri);
		
		// pageMaker 생성
		AllWorkPageMaker pageMaker = new AllWorkPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("jobRcvList", jobRcvList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public JobRcvVO getJobRcvIn(String job_index) throws SQLException {
		JobRcvVO jobRcv = jobRcvDAO.selectJobRcvByJobIn(job_index);
		return jobRcv;
	}
	@Override
	public List<JobRcvVO> getJobRcvNo(String job_no) throws SQLException {
		List<JobRcvVO> jobRcvList = jobRcvDAO.selectJobRcvByJobNo(job_no);
		return jobRcvList;
	}

	@Override
	public void modify(JobRcvVO jobRcv) throws SQLException {
		jobRcvDAO.updateJobRcv(jobRcv);
	}

}
