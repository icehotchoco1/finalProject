package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.DbxVO;

public interface DbxDAO {
	
	List<DbxVO> selectDbxIndiList(SearchCriteria cri, int empno) throws SQLException;

	int selectDbxCriteriaTotalCount(SearchCriteria cri, int empno) throws SQLException;

	DbxVO selectDbxByDbx_no(String dbx_no) throws SQLException;

	void insertDbx(DbxVO dbx) throws SQLException;

	void updateDbx(DbxVO dbx) throws SQLException;

	void deleteDbx(String dbx_no) throws SQLException;

	// news_seq.nextval 가져오기
	String selectDbxSeqNext() throws SQLException;
}
