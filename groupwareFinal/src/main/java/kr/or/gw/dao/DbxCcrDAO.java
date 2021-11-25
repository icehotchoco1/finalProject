package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dto.DbxCocnrVO;

public interface DbxCcrDAO {
	
	List<DbxCocnrVO> selectDbxCcrList() throws SQLException;

	DbxCocnrVO selectDbxCcrByNo(String cocnr_no) throws SQLException;
	
	void insertDbxCcr(DbxCocnrVO dbxCcr) throws SQLException;

	// dbxCcr_seq.nextval 가져오기
	String selectDbxCcrSeqNext() throws SQLException;
}
