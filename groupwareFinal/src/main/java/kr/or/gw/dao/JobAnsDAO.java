package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.JobAnswerVO;

public interface JobAnsDAO {

	void insertAns(JobAnswerVO ans)throws SQLException;
	void updateAns(JobAnswerVO ans)throws SQLException;
	void deleteAns(String ano)throws SQLException;
	void deleteAllAns(String jno) throws SQLException;
	
	String selectAnsSeqNextValue()throws SQLException;
	List<JobAnswerVO> selectAnsListPage(String ano,SearchCriteria cri)throws SQLException;
	int countAns(String job_no) throws SQLException;
	
	
}
