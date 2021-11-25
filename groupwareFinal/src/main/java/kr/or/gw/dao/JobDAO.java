package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.AllWorkCriteria;
import kr.or.gw.dto.JobMngtVO;

public interface JobDAO {
	
	//공통
	JobMngtVO selectJobByJno(String job_no) throws SQLException;
	void deleteJob(String job_no) throws SQLException;
	String selectJobSeqNextValue() throws SQLException;
	
	
	
	List<JobMngtVO> selectSearchJobList(AllWorkCriteria cri) throws SQLException;

	int selectSearchJobListCount(AllWorkCriteria cri) throws SQLException;

	void insertJob(JobMngtVO job) throws SQLException;

	void updateJob(JobMngtVO job) throws SQLException;

	//대기 업무 조회
	List<JobMngtVO> selectSearchJobWaitList(AllWorkCriteria cri, int rcver_empno) throws SQLException;
	int selectSearchJobWaitListCount(AllWorkCriteria cri, int rcver_empno) throws SQLException;
	
	
	//받은 업무 조회
	List<JobMngtVO> selectSearchJobRecList(AllWorkCriteria cri, int rcver_empno) throws SQLException;
	int selectSearchJobRecListCount(AllWorkCriteria cri, int rcver_empno) throws SQLException;
	
	//지시업무조회
	List<JobMngtVO> selectSearchJobSendList(AllWorkCriteria cri, int drctr_empno) throws SQLException;
	int selectSearchJobSendListCount(AllWorkCriteria cri, int drctr_empno) throws SQLException;
	
	//완료
	List<JobMngtVO> selectSearchJobCompletionList(AllWorkCriteria cri, int rcver_empno, int drctr_empno) throws SQLException;
	int selectSearchJobCompletionListCount(AllWorkCriteria cri, int rcver_empno, int drctr_empno) throws SQLException;
	
}
