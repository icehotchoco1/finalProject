package kr.or.gw.dao;

import java.sql.SQLException;

import kr.or.gw.dto.EccstSanctnMngtVO;

public interface ScmngtDAO {
	int selectSeqNextVal() throws SQLException;
	
	void FirstRegist(EccstSanctnMngtVO scMngtVO)throws SQLException;
	
	void updateEccst(EccstSanctnMngtVO scMngtVO)throws SQLException;
	
	void returnEccst(EccstSanctnMngtVO scMngtVO)throws SQLException;
	
	void updateEccstStatus(EccstSanctnMngtVO scMngtVO)throws SQLException;
	
	void deleteEccst(String sanctn_no)throws SQLException;
	
	EccstSanctnMngtVO selectEccstDetail(String sanctn_no)throws SQLException;
}