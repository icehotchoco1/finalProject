package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.dto.DbxCocnrVO;

public interface DbxCcrService {
	
	// 리스트 조회
	Map<String,Object> getDbxCcrList()throws SQLException;
	
	// 상세보기
	DbxCocnrVO getDbxCcr(String cocnr_no)throws SQLException;	
	
	
	// 공유
	void share(DbxCocnrVO dbxCcr) throws SQLException;
}
