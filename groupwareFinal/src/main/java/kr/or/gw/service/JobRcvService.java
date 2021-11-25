package kr.or.gw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.AllWorkCriteria;
import kr.or.gw.dto.JobRcvVO;

public interface JobRcvService {

	// 리스트 조회
	Map<String, Object> getJobRcvList(AllWorkCriteria cri) throws SQLException;

	// 상세보기
	JobRcvVO getJobRcvIn(String job_index) throws SQLException;
	List<JobRcvVO> getJobRcvNo(String job_no) throws SQLException;
	
	// 수정
	void modify(JobRcvVO job) throws SQLException;
	
}
