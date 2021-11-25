package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.DbxVO;

public interface DbxService {
	
	// 목록조회	
	Map<String,Object> getDbxIndiList(SearchCriteria cri, int empno)throws SQLException;
	
	// 상세보기
	DbxVO getDbx(String dbx_no)throws SQLException;	
		
	// 등록
	void regist(DbxVO dbx)throws SQLException;
		
	// 수정
	void modify(DbxVO dbx)throws SQLException;
	
	// 삭제
	void remove(String dbx_no)throws SQLException;
	
	//첨부파일
	AtchMnflVO getAttachByFileNo(String file_no)throws SQLException;
	void removeAttachByFileNo(String file_no)throws  SQLException;
}
