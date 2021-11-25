package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.command.AllWorkCriteria;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.JobMngtVO;

public interface JobService {

	//공통
	JobMngtVO getJob(String job_no) throws SQLException;
	void remove(String job_no) throws SQLException;
	
	
	
	Map<String, Object> getJobList(AllWorkCriteria cri) throws SQLException;
	
	void modify(JobMngtVO job) throws SQLException;
	
	//업무 지시하기
	void sendRegist(JobMngtVO job) throws SQLException;
	
	
	//대기 업무 조회
	Map<String, Object> getJobWaitList(AllWorkCriteria cri, int rcver_empno) throws SQLException;
	
	//받은 업무 조회
	Map<String, Object> getJobRecList(AllWorkCriteria cri, int rcver_empno) throws SQLException;

	//지시업무 조회
	Map<String, Object> getJobSendList(AllWorkCriteria cri, int drctr_empno) throws SQLException;
	
	//완료리스트조회
	Map<String, Object> getJobCompletionList(AllWorkCriteria cri, int rcver_empno, int drctr_empno) throws SQLException;
	
	//첨부파일
	AtchMnflVO getAttachByFileNo(String file_no)throws SQLException;
	void removeAttachByFileNo(String file_no)throws  SQLException;
}
