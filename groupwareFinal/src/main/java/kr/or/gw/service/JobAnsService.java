package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.JobAnswerVO;

public interface JobAnsService {

	//리스트보기
	Map<String,Object> getAnsList(String ano,SearchCriteria cri)throws SQLException;	
	
	//리스트 개수
	int getAnsListCount(String ano)throws SQLException;
	
	//등록
	void registAns(JobAnswerVO ans)throws SQLException;
		
	//수정
	void modifyAns(JobAnswerVO ans)throws SQLException;
	
	//삭제
	void removeAns(String ano)throws SQLException;
}
