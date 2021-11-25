package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.AllWorkCriteria;
import kr.or.gw.dto.JobRcvVO;

public interface JobRcvDAO {
	
	List<JobRcvVO> selectSearchJobRcvList(AllWorkCriteria cri) throws SQLException;
	int selectSearchJobRcvListCount(AllWorkCriteria cri) throws SQLException;
	
	JobRcvVO selectJobRcvByJobIn(String job_index) throws SQLException;
	List<JobRcvVO> selectJobRcvByJobNo(String job_no) throws SQLException;

	void insertJobRcv(JobRcvVO job) throws SQLException;

	void updateJobRcv(JobRcvVO job) throws SQLException;

	void deleteJobRcv(String job_index) throws SQLException;

	// seq.nextval 가져오기
	String selectJobRcvSequenceNextValue() throws SQLException;
}
