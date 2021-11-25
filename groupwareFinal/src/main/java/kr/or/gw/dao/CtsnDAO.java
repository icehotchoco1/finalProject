package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.BbsCtsnnbdVO;

public interface CtsnDAO {
	
	List<BbsCtsnnbdVO> selectSearchCtsnList(SearchCriteria cri) throws SQLException;
	
	int selectSearchCtsnListCount(SearchCriteria cri) throws SQLException;
	
	BbsCtsnnbdVO selectCtsnByBbscttNo (String bbsctt_no) throws SQLException;
	
	void insertCtsn (BbsCtsnnbdVO ctsn) throws SQLException;
	
	void updateCtsn (BbsCtsnnbdVO ctsn) throws SQLException;
	
	void deleteCtsn (String bbsctt_no) throws SQLException;
	
	void increaseViewCnt (String bbsctt_no) throws SQLException;
	
	String selectBoardSeqNext() throws SQLException;
}
