package kr.or.gw.service;

import java.sql.SQLException;

import kr.or.gw.dao.EmpSignDAO;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public class EmpSignServiceImpl implements EmpSignService{
	
	private EmpSignDAO EmpSignDAO;
	public void setEmpSignDAO(EmpSignDAO EmpSignDAO) {
		this.EmpSignDAO = EmpSignDAO;
	}
	
	@Override
	public void modify(OrgnztEmpMngtVO emp) throws SQLException {
		EmpSignDAO.updateSignEmp(emp);
	}

	@Override
	public OrgnztEmpMngtVO getEmp(int empno) throws SQLException {
		OrgnztEmpMngtVO emp = EmpSignDAO.selectEmpByEmpno(empno);
		return emp;
	}

	@Override
	public void regist(OrgnztEmpMngtVO emp) throws SQLException {
		EmpSignDAO.registSignEmp(emp);
	}

	@Override
	public String getSign(int empno) throws SQLException {
		String sign = EmpSignDAO.selectSignEmp(empno);
		return sign;
	}
}
