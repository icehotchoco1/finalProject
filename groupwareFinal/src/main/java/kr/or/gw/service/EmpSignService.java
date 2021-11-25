package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.command.TreeEmpCriteria;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public interface EmpSignService {
	
	OrgnztEmpMngtVO getEmp(int empno) throws SQLException;
	
	void modify(OrgnztEmpMngtVO emp) throws SQLException;

	void regist(OrgnztEmpMngtVO emp) throws SQLException; 
	
	String getSign(int empno) throws SQLException;

	
}
