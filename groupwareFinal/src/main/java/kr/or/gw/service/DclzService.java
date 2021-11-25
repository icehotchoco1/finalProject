package kr.or.gw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.DclzMngtVO;

public interface DclzService {
	
	List<DclzMngtVO> getDclzList(int empno) throws SQLException;
	
	List<DclzMngtVO> getDclzCount(int empno) throws SQLException;
	
	Map<String, Object> DclzLists(Map<String,String> paramMap) throws SQLException;
	
	List<DclzMngtVO> getDclzDayCount(int empno) throws SQLException;
	
	List<DclzMngtVO> getDclzTotalTime(int empno) throws SQLException;
	
	List<DclzMngtVO> getDclzChart(int empno) throws SQLException;
	
	List<DclzMngtVO> getDclzTop(int empno) throws SQLException;
	
	Map<String, Object> getMonth() throws SQLException;

	Map<String, Object> getDeptInfo() throws SQLException;

	Map<String, Object> getOneCha() throws SQLException;
	Map<String, Object> getTwoCha() throws SQLException;
	Map<String, Object> getThreeCha() throws SQLException;
	Map<String, Object> getFourCha() throws SQLException;
	Map<String, Object> getFiveCha() throws SQLException;

	List<DclzMngtVO> getDclzFrontBack(int empno)  throws SQLException;
	
	//근태이상자
	Map<String, Object> getLateList(SearchCriteria cri, int empno) throws SQLException;
	
	void updateDclzMngtbyEmpno(DclzMngtVO dclz)throws SQLException;

	
}
