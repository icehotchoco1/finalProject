package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.dao.IcommuteDAO;
import kr.or.gw.dto.DclzComVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public class IcommuteServiceImpl implements IcommuteService {

	private IcommuteDAO icommuteDAO;

	public void setIcommuteDAO(IcommuteDAO icommuteDAO) {
		this.icommuteDAO = icommuteDAO;
	}

	@Override
	public Map<String, Object> icommuteList(Map<String, String> paramMap) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<OrgnztEmpMngtVO> icomlist = icommuteDAO.selectIcommuteList(paramMap);

		dataMap.put("icomlist", icomlist);

		return dataMap;
	}

	
	@Override
	public Map<String, Object> getEmpInfo(int empno) throws SQLException {
		
		Map<String, Object> daMap = new HashMap<String, Object>();
		List<OrgnztEmpMngtVO> empList = icommuteDAO.selectEmpInfo(empno);
		
		daMap.put("empList", empList);
		return daMap;
	}

}
