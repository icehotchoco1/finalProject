package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.TreeEmpCriteria;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public interface EmpSignDAO {
	
	OrgnztEmpMngtVO selectEmpByEmpno(int empno)throws SQLException;
	
	public void updateSignEmp(OrgnztEmpMngtVO emp) throws SQLException;

	public void registSignEmp(OrgnztEmpMngtVO emp) throws SQLException;
	
	String selectSignEmp(int empno) throws SQLException;

}
