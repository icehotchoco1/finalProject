package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.dao.DclzComDAO;
import kr.or.gw.dto.DclzComVO;
import kr.or.gw.dto.DclzMngtVO;

public class DclzComServiceImpl implements DclzComService {

	private DclzComDAO dclzComDAO;
	
	public void setDclzComDAO(DclzComDAO dclzComDAO) {
		this.dclzComDAO = dclzComDAO;
	}
	
	@Override
	public Map<String, Object> getTardy() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<DclzComVO> tardy = dclzComDAO.selectTardy();
		dataMap.put("tardy", tardy);
		return dataMap;
	}

	@Override
	public Map<String, Object> getEarlyLeave() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<DclzComVO> earlyLeave = dclzComDAO.selectEarlyLeave();
		dataMap.put("earlyLeave", earlyLeave);
		return dataMap;
	}

	@Override
	public Map<String, Object> getAbsenteeism() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<DclzComVO> absenteeism = dclzComDAO.selectAbsenteeism();
		dataMap.put("absenteeism", absenteeism);
		return dataMap;
	}

	@Override
	public DclzMngtVO getMyCommute(int empno) throws SQLException {
		DclzMngtVO dclzCom = dclzComDAO.selectMyCommute(empno);
		return dclzCom;
	}

}
