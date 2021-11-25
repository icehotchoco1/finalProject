package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dto.DclzComVO;
import kr.or.gw.dto.DclzMngtVO;


public interface DclzComDAO {

	// 지각
	List<DclzComVO> selectTardy() throws SQLException;
	
	// 조퇴
	List<DclzComVO> selectEarlyLeave() throws SQLException;
	
	// 결근
	List<DclzComVO> selectAbsenteeism() throws SQLException;
	
	// 출근시간
	DclzMngtVO selectMyCommute(int empno) throws SQLException;
}
