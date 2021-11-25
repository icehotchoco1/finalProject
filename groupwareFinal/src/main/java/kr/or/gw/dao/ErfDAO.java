package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dto.EccstRegstrFormVO;

public interface ErfDAO {
	
	List<EccstRegstrFormVO> selectErf() throws SQLException;

	EccstRegstrFormVO selectErfByErfno(String form_no) throws SQLException;

	void insertErf(EccstRegstrFormVO erf) throws SQLException;

	// news_seq.nextval 가져오기
	String selectErfSeqNext() throws SQLException;
}
