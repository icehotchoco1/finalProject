package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.DclzComVO;
import kr.or.gw.dto.DclzMngtVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;


public interface DclzDAO {
	
	List<DclzMngtVO> selectListDclz(int empno) throws SQLException;

	List<DclzMngtVO> selectDclzCount(int empno) throws SQLException;
	
	List<OrgnztEmpMngtVO> selectDclzList(Map<String,String> paramMap) throws SQLException;
	
	List<DclzMngtVO> selectDclzDayCount(int empno) throws SQLException;
	
	List<DclzMngtVO> selectDclzTotalTime(int empno) throws SQLException;
	
	List<DclzMngtVO> selectChart(int empno) throws SQLException;
	
	List<DclzMngtVO> selectFrontBack(int empno) throws SQLException;

	List<DclzMngtVO> selectTopcommute(int empno) throws SQLException;

//	int selectDbxCriteriaTotalCount(SearchCriteria cri) throws SQLException;

	// 한달 총 근무시간
	List<DclzMngtVO> selectMonth() throws SQLException;
	
	// 이름, 부서명, 직책명
	List<DclzComVO> selectDeptInfo() throws SQLException;

	// 1주차
	List<DclzComVO> selectOneCha() throws SQLException;
	List<DclzComVO> selectTwoCha() throws SQLException;
	List<DclzComVO> selectThreeCha() throws SQLException;
	List<DclzComVO> selectFourCha() throws SQLException;
	List<DclzComVO> selectFiveCha() throws SQLException;
	
	//근태이상자
	List<DclzMngtVO> getLateList(SearchCriteria cri, int empno) throws SQLException;
	int getLateListCount(SearchCriteria cri, int empno) throws SQLException;
	
	void updateDclzMngtbyEmpno(DclzMngtVO dclz)throws SQLException;
	
}
