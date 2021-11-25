package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.BbsCtsnnbdVO;
import kr.or.gw.dto.BbsFreebdVO;

public interface FreeDAO {
	
	List<BbsFreebdVO> selectSearchFreeList(SearchCriteria cri) throws SQLException;
	
	int selectSearchFreeListCount(SearchCriteria cri) throws SQLException;
	
	BbsFreebdVO selectFreeByBbscttNo (String bbsctt_no) throws SQLException;
	
	void insertFree (BbsFreebdVO ctsn) throws SQLException;
	
	void updateFree (BbsFreebdVO ctsn) throws SQLException;
	
	void deleteFree (String bbsctt_no) throws SQLException;
	
	void increaseViewCnt (String bbsctt_no) throws SQLException;
	
	String selectBoardSeqNext() throws SQLException;
}
