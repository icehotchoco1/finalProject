package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.basicCriteria;
import kr.or.gw.dto.SchdulMngtVO;

public interface SchService {

	
	// 리스트보기
	Map<String, Object> schList(int empno) throws SQLException;
	
	// 리스트보기
	Map<String, Object> schCompanyList(int empno) throws SQLException;
	

	//상세보기
	SchdulMngtVO getSchedule (String schdul_no) throws SQLException;
	
	// 등록
	void regist(SchdulMngtVO sch) throws SQLException;
	
	// 수정
	void modify(SchdulMngtVO sch) throws SQLException;
	
	// 삭제
	void remove(String schdul_no) throws SQLException;
	

	void modifyByDrag(SchdulMngtVO sch) throws SQLException;

	// d-day
	Map<String, Object> schDdayList(basicCriteria cri) throws SQLException;
}
