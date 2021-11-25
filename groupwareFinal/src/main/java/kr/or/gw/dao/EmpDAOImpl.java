package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.Criteria;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public class EmpDAOImpl implements EmpDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public OrgnztEmpMngtVO selectEmpByEmpno(int empno) throws SQLException {
		OrgnztEmpMngtVO emp=session.selectOne("Emp-Mapper.selectEmpByEmpno",empno);			
		return emp;
	}

	@Override
	public List<OrgnztEmpMngtVO> selectEmpList() throws SQLException {
		List<OrgnztEmpMngtVO> empList = session.selectList("Emp-Mapper.selectEmpList");
		return empList;
	}

	@Override
	public List<OrgnztEmpMngtVO> selectEmpList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<OrgnztEmpMngtVO> empList = session.selectList("Emp-Mapper.selectEmpList",null,rowBounds);
		return empList;
		
	}

	@Override
	public List<OrgnztEmpMngtVO> selectEmpList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<OrgnztEmpMngtVO> empList = session.selectList("Emp-Mapper.selectSearchEmpList",cri,rowBounds);
		return empList;
	}

	@Override
	public int selectEmpListCount(SearchCriteria cri) throws SQLException {
		int count=0;		
		count=session.selectOne("Emp-Mapper.selectSearchEmpListCount",cri);
		return count;
	}

	@Override
	public void insertEmp(OrgnztEmpMngtVO emp) throws SQLException {
		session.update("Emp-Mapper.insertEmp",emp);
		
	}

	@Override
	public void updateEmp(OrgnztEmpMngtVO emp) throws SQLException {
		session.update("Emp-Mapper.updateEmp",emp);

	}

	@Override
	public void deleteEmp(int empno) throws SQLException {
		session.update("Emp-Mapper.deleteEmp",empno);

	}

	@Override
	public void disabledEmp(int empno) throws SQLException {
		session.update("Emp-Mapper.disabledEmp",empno);

	}

	@Override
	public void enabledEmp(int empno) throws SQLException {
		session.update("Emp-Mapper.enabledEmp",empno);

	}

	@Override
	public void modifyPw(OrgnztEmpMngtVO emp) throws SQLException {
		session.update("Emp-Mapper.modifyPw",emp);
	}

	@Override
	public void modifyPwMain(OrgnztEmpMngtVO emp) throws SQLException {
		session.update("Emp-Mapper.modifyPwMain",emp);
		
	}

	@Override
	public List<OrgnztEmpMngtVO> getDeptPeople(String dept_code) throws SQLException {
		List<OrgnztEmpMngtVO> deptPeopleList = session.selectList("Emp-Mapper.getDeptPeople",dept_code);
		return deptPeopleList;
	}
	
	
}










