package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.PageMaker;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dao.DclzDAO;
import kr.or.gw.dao.EmpDAO;
import kr.or.gw.dto.DclzComVO;
import kr.or.gw.dto.DclzMngtVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public class DclzServiceImpl implements DclzService{
	private DclzDAO dclzDAO;
	
	public void setDclzDAO(DclzDAO dclzDAO) {
		this.dclzDAO = dclzDAO;
	}
	private EmpDAO empDAO;
	public void setEmpDAO(EmpDAO empDAO) {
		this.empDAO = empDAO;
	}
	
	@Override
	public List<DclzMngtVO> getDclzList(int empno) throws SQLException {
		List<DclzMngtVO> dclzList = dclzDAO.selectListDclz(empno);
		return dclzList;
	}

	@Override
	public List<DclzMngtVO> getDclzCount(int empno) throws SQLException {
		List<DclzMngtVO> dclzCount = dclzDAO.selectDclzCount(empno);
		return dclzCount;
	}

	@Override
	public Map<String, Object> DclzLists(Map<String, String> paramMap) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<OrgnztEmpMngtVO> dclzLists = dclzDAO.selectDclzList(paramMap);
		
		dataMap.put("dclzLists", dclzLists);
		
		return dataMap;
	}

	@Override
	public List<DclzMngtVO> getDclzDayCount(int empno) throws SQLException {
		List<DclzMngtVO> dclztotalcount = dclzDAO.selectDclzDayCount(empno);
		return dclztotalcount;
	}

	@Override
	public List<DclzMngtVO> getDclzTotalTime(int empno) throws SQLException {
		List<DclzMngtVO> dclzdaycount = dclzDAO.selectDclzTotalTime(empno);
		return dclzdaycount;
	}

	@Override
	public List<DclzMngtVO> getDclzChart(int empno) throws SQLException {
		List<DclzMngtVO> dclzchart = dclzDAO.selectChart(empno);
		return dclzchart;
	}

	@Override
	public Map<String, Object> getMonth() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<DclzMngtVO> dclzMonth = dclzDAO.selectMonth();

		dataMap.put("dclzMonth", dclzMonth);
		return dataMap;
	}

	@Override
	public Map<String, Object> getDeptInfo() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<DclzComVO> deptInfo = dclzDAO.selectDeptInfo();
		dataMap.put("deptInfo", deptInfo);
		return dataMap;
	}

	@Override
	public Map<String, Object> getOneCha() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<DclzComVO> oneCha = dclzDAO.selectOneCha();
		dataMap.put("oneCha", oneCha);
		return dataMap;
	}

	@Override
	public Map<String, Object> getTwoCha() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<DclzComVO> twoCha = dclzDAO.selectTwoCha();
		dataMap.put("twoCha", twoCha);
		return dataMap;
	}

	@Override
	public Map<String, Object> getThreeCha() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<DclzComVO> threeCha = dclzDAO.selectThreeCha();
		dataMap.put("threeCha", threeCha);
		return dataMap;
	}

	@Override
	public Map<String, Object> getFourCha() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<DclzComVO> fourCha = dclzDAO.selectFourCha();
		dataMap.put("fourCha", fourCha);
		return dataMap;
	}

	@Override
	public Map<String, Object> getFiveCha() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<DclzComVO> fiveCha = dclzDAO.selectFiveCha();
		dataMap.put("fiveCha", fiveCha);
		return dataMap;
	}

	@Override
	public List<DclzMngtVO> getDclzFrontBack(int empno) throws SQLException {
		List<DclzMngtVO> dclzbackfront = dclzDAO.selectFrontBack(empno);
		return dclzbackfront;
	}

	@Override
	public List<DclzMngtVO> getDclzTop(int empno) throws SQLException {
		List<DclzMngtVO> dclztop = dclzDAO.selectTopcommute(empno);
		return dclztop;
	}

	@Override
	public Map<String, Object> getLateList(SearchCriteria cri, int empno) throws SQLException {
		List<DclzMngtVO> deptLateList = dclzDAO.getLateList(cri, empno);
		int totalCount = dclzDAO.getLateListCount(cri, empno);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		for (DclzMngtVO dclzVO : deptLateList) {
			int deptEmpno = dclzVO.getEmpno();
			OrgnztEmpMngtVO vo = empDAO.selectEmpByEmpno(deptEmpno);
			dclzVO.setEmpVO(vo);
		}
		
		PageMaker pageMaker2 = new PageMaker();
		pageMaker2.setCri(cri);
		pageMaker2.setTotalCount(totalCount);
		
		dataMap.put("deptLateList", deptLateList);
		dataMap.put("pageMaker",pageMaker2);
		
		return dataMap;
	}

	@Override
	public void updateDclzMngtbyEmpno(DclzMngtVO dclz) throws SQLException {
		dclzDAO.updateDclzMngtbyEmpno(dclz);
	}
	
	
}
