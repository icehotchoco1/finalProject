package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.basicCriteria;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.DbxVO;

public interface DbxPublicService {
	
	// 전체문서 목록조회	
	Map<String,Object> getDbxAllList(int rcvr_empno)throws SQLException;
	
	// 전체문서 상세보기
	DbxVO getDbxAll(String dbx_no)throws SQLException;	

	
	// 공유문서 목록조회	
//	Map<String,Object> getDbxList(basicCriteria cri,int rcvr_empno)throws SQLException;
	Map<String,Object> getDbxList(basicCriteria cri, int empno)throws SQLException;
	
	// 상세보기
	DbxVO getDbx(String dbx_no)throws SQLException;	
	DbxVO getDbxForModify(String dbx_no)throws SQLException;
	Map<String, Object> getDbxRcvrList(String dbx_no) throws SQLException;
		
	// 등록
	void regist(DbxVO dbx)throws SQLException;
		
	// 글 수정
	void modify(DbxVO dbx)throws SQLException;

	// 구분코드 수정
	void modifySe(String dbx_no)throws SQLException;
	
	// 삭제
	void remove(String dbx_no)throws SQLException;
	void removeShare(String dbx_no)throws SQLException;
	
	String dbxNext() throws SQLException;
	
	AtchMnflVO getAttachByFileNo(String file_no)throws SQLException;
	void removeAttachByFileNo(String file_no)throws  SQLException;
}
