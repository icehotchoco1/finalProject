package kr.or.gw.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import kr.or.gw.dto.OrgnztEmpMngtVO;

public class EmpSignDAOImpl implements EmpSignDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
		
	}
	
	@Override
	public OrgnztEmpMngtVO selectEmpByEmpno(int empno) throws SQLException {
		OrgnztEmpMngtVO emp = session.selectOne("Emp-Mapper.selectEmpByEmpno",empno);
		return emp;
	}

	@Override
	public void updateSignEmp(OrgnztEmpMngtVO emp) throws SQLException {
		session.update("Emp-Mapper.updateSign",emp);
	}

	@Override
	public void registSignEmp(OrgnztEmpMngtVO emp) throws SQLException {
		session.update("Emp-Mapper.registSign",emp);
		
	}

	@Override
	public String selectSignEmp(int empno) throws SQLException {
		String sign = session.selectOne("Emp-Mapper.selectSign",empno);
		return sign;
	}
}                                                                                                                                              
