package kr.or.gw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.TreeEmpCriteria;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public interface TreeEmpService {
	
	OrgnztEmpMngtVO getEmp(int empno) throws SQLException;
	
	Map<String, Object> getEmpList(TreeEmpCriteria cri)throws SQLException;
	
	List<OrgnztEmpMngtVO> getEmpListnopg(TreeEmpCriteria cri)throws SQLException;
	
	public void regist(OrgnztEmpMngtVO emp) throws SQLException;
	
	void modify(OrgnztEmpMngtVO emp) throws SQLException;
	
	void remove(int empno) throws SQLException;
	
	void disabled(int empno) throws SQLException;
	
	void enabled(int empno)throws SQLException;

}
