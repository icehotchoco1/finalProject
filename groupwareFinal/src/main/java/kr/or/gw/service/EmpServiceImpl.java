package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.Criteria;
import kr.or.gw.command.PageMaker;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dao.EmpDAO;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.exception.InvalidPasswordException;
import kr.or.gw.exception.NotFoundIDException;
import kr.or.gw.exception.PasswordChangeException;

public class EmpServiceImpl implements EmpService {

	private EmpDAO empDAO;

	public void setEmpDAO(EmpDAO empDAO) {
		this.empDAO = empDAO;
	}

	@Override
	public void login(int empno, String pwd) throws SQLException, NotFoundIDException, InvalidPasswordException, PasswordChangeException{
		OrgnztEmpMngtVO emp = empDAO.selectEmpByEmpno(empno);
		if (emp == null)
			throw new NotFoundIDException();
		if (!pwd.equals(emp.getPassword()))
			throw new InvalidPasswordException();
		if (pwd.equals(emp.getEmpno()+"!"))
			throw new PasswordChangeException();
			
	}

	@Override
	public OrgnztEmpMngtVO getEmp(int empno) throws SQLException  {

		OrgnztEmpMngtVO emp = empDAO.selectEmpByEmpno(empno);
		return emp;
	}

	@Override
	public List<OrgnztEmpMngtVO> getEmpList() throws SQLException {
		List<OrgnztEmpMngtVO> empList = empDAO.selectEmpList();
		return empList;
	}

	@Override
	public List<OrgnztEmpMngtVO> getEmpList(Criteria cri) throws SQLException {
		List<OrgnztEmpMngtVO> empList = empDAO.selectEmpList(cri);
		return empList;
	}

	@Override
	public Map<String, Object> getEmpList(SearchCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(empDAO.selectEmpListCount(cri));

		List<OrgnztEmpMngtVO> empList = empDAO.selectEmpList(cri);

		dataMap.put("empList", empList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void regist(OrgnztEmpMngtVO emp) throws SQLException {

		empDAO.insertEmp(emp);
	}

	@Override
	public void modify(OrgnztEmpMngtVO emp) throws SQLException {
		empDAO.updateEmp(emp);
	}

	@Override
	public void remove(int empno) throws SQLException {

		empDAO.deleteEmp(empno);

	}

	@Override
	public void disabled(int empno) throws SQLException {

		empDAO.disabledEmp(empno);

	}

	@Override
	public void enabled(int empno) throws SQLException {

		empDAO.enabledEmp(empno);
	}
	
	@Override
	public void modifyPw(OrgnztEmpMngtVO emp) throws SQLException {
		empDAO.modifyPw(emp);
		
	}

	@Override
	public void modifyPwMain(OrgnztEmpMngtVO emp) throws SQLException {
		empDAO.modifyPwMain(emp);
		
	}

	@Override
	public List<OrgnztEmpMngtVO> getDeptPeople(String dept_code) throws SQLException{
		List<OrgnztEmpMngtVO> deptPeopleList = empDAO.getDeptPeople(dept_code);
		return deptPeopleList;
	}
}
