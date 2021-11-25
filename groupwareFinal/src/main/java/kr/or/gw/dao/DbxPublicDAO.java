package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.basicCriteria;
import kr.or.gw.dto.DbxCocnrVO;
import kr.or.gw.dto.DbxVO;

public interface DbxPublicDAO {

	// 전체 문서
	List<DbxVO> selectDbxAllCriteria(int rcvr_empno) throws SQLException;

	int selectDbxAllCriteriaTotalCount(basicCriteria cri) throws SQLException;

	DbxVO selectDbxAllByDbx_no(String dbx_no) throws SQLException;
	List<DbxCocnrVO> selectDbxCcrRcvrList(String dbx_no) throws SQLException;

	// 공유 문서만
//	List<DbxVO> selectDbxCriteria(basicCriteria cri,int rcvr_empno) throws SQLException;
	List<DbxVO> selectDbx(basicCriteria cri, int empno) throws SQLException;
	
	int selectDbxCriteriaTotalCount(basicCriteria cri, int empno) throws SQLException;

	DbxVO selectDbxByDbx_no(String dbx_no) throws SQLException;

	void insertDbx(DbxVO dbx) throws SQLException;

	// 글 수정
	void updateDbx(DbxVO dbx) throws SQLException;
	// 구분 코드 수정
	void updateDbxSeModify(String dbx_no) throws SQLException;

	void deleteDbx(String dbx_no) throws SQLException;
	void deleteDbxCcr(String dbx_no) throws SQLException;

	// news_seq.nextval 가져오기
	String selectDbxSeqNext() throws SQLException;
	
	String maxDbxNoNext() throws SQLException;
}
