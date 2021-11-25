package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.command.VacCriteria;
import kr.or.gw.dto.DclzVacVO;

public interface DclzVacService {
	
	DclzVacVO getVac(String vcatn_no) throws SQLException;
	
	Map<String,Object> getVacList(VacCriteria cri, int empno) throws SQLException;
	void modify(DclzVacVO vac) throws SQLException;
	
	Map<String, Object> selectDeptVacList (VacCriteria cri, int empno) throws SQLException;
	
	Float selectsumUseVac(int empno)throws SQLException;

	void insertVac(DclzVacVO vac) throws SQLException;
	String selectVacSeqNextValue() throws SQLException;

}
