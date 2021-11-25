package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.TreeEmpCriteria;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public interface TreeEmpDAO {
	
	OrgnztEmpMngtVO selectEmpByEmpno(int empno)throws SQLException;
	
	List<OrgnztEmpMngtVO> selectSearchEmpList(TreeEmpCriteria cri)throws SQLException;
	
	int selectSearchEmpListCount (TreeEmpCriteria cri) throws SQLException;
	
	public void insertEmp(OrgnztEmpMngtVO emp) throws SQLException; 
	
	public void updateEmp(OrgnztEmpMngtVO emp) throws SQLException;
	
	void deleteEmp(int empno) throws SQLException;
	
	void disabledEmp(int empno) throws SQLException;
	
	void enabledEmp (int empno) throws SQLException;
}
