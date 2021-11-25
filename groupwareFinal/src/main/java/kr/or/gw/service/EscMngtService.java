package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.tempstorageCriteria;
import kr.or.gw.dto.EccstSanctnMngtVO;

public interface EscMngtService {

	Map<String, Object> getEscMngtList(tempstorageCriteria cri, int empno) throws SQLException;
	Map<String, Object> getEscMngtList2() throws SQLException;
	
	EccstSanctnMngtVO getEscMngt(String sanctn_no) throws SQLException;
	EccstSanctnMngtVO getEscMngtPlusErf(String sanctn_no) throws SQLException;
	
	void modify(EccstSanctnMngtVO escMngt) throws SQLException;
	
	void remove(String sanctn_no) throws SQLException;
	
	
}
