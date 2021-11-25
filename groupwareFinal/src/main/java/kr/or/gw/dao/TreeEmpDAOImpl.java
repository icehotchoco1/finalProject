package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.TreeEmpCriteria;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public class TreeEmpDAOImpl implements TreeEmpDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public OrgnztEmpMngtVO selectEmpByEmpno(int empno) throws SQLException {
		OrgnztEmpMngtVO emp = session.selectOne("EmpTree-Mapper.selectEmpByEmpno",empno);
		return emp;
	}

	@Override
	public List<OrgnztEmpMngtVO> selectSearchEmpList(TreeEmpCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<OrgnztEmpMngtVO> empList = session.selectList("EmpTree-Mapper.selectSearchEmpList",cri,rowBounds);
		return empList;
	}

	@Override
	public int selectSearchEmpListCount(TreeEmpCriteria cri) throws SQLException {
		int count = 0;
		count = session.selectOne("EmpTree-Mapper.selectSearchEmpListCount",cri);
		return count;
	}

	@Override
	public void insertEmp(OrgnztEmpMngtVO emp) throws SQLException {
		session.update("EmpTree-Mapper.insertEmp",emp);
	}

	@Override
	public void updateEmp(OrgnztEmpMngtVO emp) throws SQLException {
		session.update("EmpTree-Mapper.updateEmp",emp);
	}

	@Override
	public void deleteEmp(int empno) throws SQLException {
		session.update("EmpTree-Mapper.deleteEmp",empno);
	}

	@Override
	public void disabledEmp(int empno) throws SQLException {
		session.update("EmpTree-Mapper.disabledEmp",empno);
		
	}

	@Override
	public void enabledEmp(int empno) throws SQLException {
		session.update("EmpTree-Mapper.enabledEmp",empno);
		
	}

}
