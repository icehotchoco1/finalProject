package kr.or.gw.dao;

import java.sql.SQLException;

import kr.or.gw.dto.EccstEnvrnSetupVO;

public interface EscSetupDAO {
	EccstEnvrnSetupVO selectEscSetupByEmpno(int empno) throws SQLException;
	
	void insertEscSetup(EccstEnvrnSetupVO setVO)throws SQLException;
	
	void updateEscSetup(EccstEnvrnSetupVO setVO)throws SQLException;
}
