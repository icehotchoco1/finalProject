package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.basicCriteria;
import kr.or.gw.dto.SchdulMngtVO;

public interface SchDAO {
	
	List<SchdulMngtVO> selectSearchSchList(int empno) throws SQLException;
	
	List<SchdulMngtVO> selectCompanySchList(int empno) throws SQLException;

	//int selectSearchSchListCount(SearchCriteria cri) throws SQLException;

	SchdulMngtVO selectSchBySchdul_no(String schdul_no) throws SQLException;
	
	//SchdulMngtVO selectSchByNno(String schdul_no) throws SQLException;

	void insertSch(SchdulMngtVO sch) throws SQLException;

	void updateSch(SchdulMngtVO sch) throws SQLException;

	void deleteSch(String schdul_no) throws SQLException;

	
	// seq.nextval 가져오기
	String selectSchmSeqNext() throws SQLException;

	// d-day
	List<SchdulMngtVO> selectDday(basicCriteria cri) throws SQLException;
	int selectDdayCount(basicCriteria cri) throws SQLException;
	
	void updateScheduleByDrag(SchdulMngtVO sch)  throws SQLException;

}
