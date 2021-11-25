package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.BbsCtsnnbdVO;

public interface CtsnService {
	
	Map<String, Object> getCtsnList(SearchCriteria cri) throws SQLException;
	
	BbsCtsnnbdVO getCtsn(String bbsctt_no) throws SQLException;
	
	BbsCtsnnbdVO getCtsnForModify(String bbsctt_no) throws SQLException;
	
	void regist(BbsCtsnnbdVO ctsn) throws SQLException;
	
	void modify(BbsCtsnnbdVO ctsn) throws SQLException;
	
	void remove(String bbsctt_no) throws SQLException;
	
	AtchMnflVO getAttachByFileNo(String file_no)throws SQLException;
	
	void removeAttachByFileNo(String file_no)throws  SQLException;
}
