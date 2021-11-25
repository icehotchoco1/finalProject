package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dto.DclzVacCodeVO;

public interface DclzVacCodeDAO {
		//휴가리스트
		List<DclzVacCodeVO> selectVacCodeList() throws SQLException;
		
		//휴가코드
		DclzVacCodeVO selectVacCode(String vcatn_no) throws SQLException;
		void insertVacCode(DclzVacCodeVO vacCode) throws SQLException;
		
		String selectVacCodeSeqNextValue() throws SQLException;

		String selectCodeNmByCode(String vcatn_code) throws SQLException;
		
}
