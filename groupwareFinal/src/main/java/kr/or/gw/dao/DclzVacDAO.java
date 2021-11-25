package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.VacCriteria;
import kr.or.gw.dto.DclzVacVO;

public interface DclzVacDAO {
	
	//휴가 조회
	List<DclzVacVO> selectVacList(VacCriteria cri, int empno) throws SQLException;
	int selectVacListCount(VacCriteria cri, int empno)throws SQLException;
	
	//휴가 선택
	DclzVacVO selectVac(String vcatn_no) throws SQLException;
	void insertVac(DclzVacVO vac) throws SQLException;
	void updateVac(DclzVacVO vac) throws SQLException;
	
	String selectVacSeqNextValue() throws SQLException;
	
	List<DclzVacVO> selectDeptVacList(VacCriteria cri, int empno) throws SQLException;
	int selectDeptVacListCount(VacCriteria cri, int empno) throws SQLException;
	
	Float selectsumUseVac(int empno)throws SQLException;
	
}
