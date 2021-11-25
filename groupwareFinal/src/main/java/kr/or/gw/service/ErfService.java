package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.dto.EccstRegstrFormVO;

public interface ErfService {

	// 리스트 조회
	Map<String, Object> getErfList() throws SQLException;
	
	// 상세보기
	EccstRegstrFormVO getErf(String form_no) throws SQLException;
	
	// 등록
	void regist(EccstRegstrFormVO erf) throws SQLException;
}
