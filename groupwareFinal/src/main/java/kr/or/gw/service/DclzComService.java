package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.dto.DclzMngtVO;

public interface DclzComService {
	
	Map<String, Object> getTardy() throws SQLException;
	Map<String, Object> getEarlyLeave() throws SQLException;
	Map<String, Object> getAbsenteeism() throws SQLException;
	
	DclzMngtVO getMyCommute(int empno) throws SQLException;
}
