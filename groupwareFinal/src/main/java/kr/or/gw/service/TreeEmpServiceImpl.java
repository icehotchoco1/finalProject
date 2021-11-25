package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.TreeEmpCriteria;
import kr.or.gw.command.TreeEmpPageMaker;
import kr.or.gw.dao.TreeEmpDAO;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public class TreeEmpServiceImpl implements TreeEmpService{
	
	private TreeEmpDAO treeEmpDAO;
	public void setTreeEmpDAO(TreeEmpDAO treeEmpDAO) {
		this.treeEmpDAO = treeEmpDAO;
	}
	
	@Override
	public OrgnztEmpMngtVO getEmp(int empno) throws SQLException {
		OrgnztEmpMngtVO emp = treeEmpDAO.selectEmpByEmpno(empno);
		return emp;
	}

	@Override
	public Map<String, Object> getEmpList(TreeEmpCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		TreeEmpPageMaker pageMaker = new TreeEmpPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(treeEmpDAO.selectSearchEmpListCount(cri));
		
		List<OrgnztEmpMngtVO> empList = treeEmpDAO.selectSearchEmpList(cri);
		
		dataMap.put("empList", empList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	

	@Override
	public void regist(OrgnztEmpMngtVO emp) throws SQLException {
		treeEmpDAO.insertEmp(emp);
	}

	@Override
	public void modify(OrgnztEmpMngtVO emp) throws SQLException {
		treeEmpDAO.updateEmp(emp);
	}

	@Override
	public void remove(int empno) throws SQLException {
		treeEmpDAO.deleteEmp(empno);
	}

	@Override
	public void disabled(int empno) throws SQLException {
		treeEmpDAO.disabledEmp(empno);
	}

	@Override
	public void enabled(int empno) throws SQLException {
		treeEmpDAO.enabledEmp(empno);
	}

	@Override
	public List<OrgnztEmpMngtVO> getEmpListnopg(TreeEmpCriteria cri) throws SQLException {
		
		List<OrgnztEmpMngtVO> empList = treeEmpDAO.selectSearchEmpList(cri);
		
		return empList;
	}


}
