package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.tempstorageCriteria;
import kr.or.gw.dto.EccstSanctnMngtVO;

public interface EscMngtDAO {
	
	List<EccstSanctnMngtVO> selectSearchEscMngtList(tempstorageCriteria cri, int empno) throws SQLException;
	List<EccstSanctnMngtVO> selectEscMngtList() throws SQLException;
	
	int selectSearchEscMngtListCount(tempstorageCriteria cri,  int empno) throws SQLException;
	
	EccstSanctnMngtVO selectEscMngtByNo(String sanctn_no) throws SQLException;
	EccstSanctnMngtVO selectEscMngtPlusErf(String sanctn_no) throws SQLException;
	
	void updateEscMngt(EccstSanctnMngtVO EscMngt) throws SQLException;
	
	void deleteEscMngt(String sanctn_no) throws SQLException;
	
	EccstSanctnMngtVO selectEscMngtVacByNo(String sanctn_no) throws SQLException;
	
}
