package kr.or.gw.service;

import java.sql.SQLException;

import kr.or.gw.dto.EccstEnvrnSetupVO;

public interface EscSetupService {
	EccstEnvrnSetupVO selectEscSetupByEmpno(int empno) throws SQLException;
	
	void insertEscSetup(EccstEnvrnSetupVO setVO)throws SQLException;
	
	void updateEscSetup(EccstEnvrnSetupVO setVO)throws SQLException;
}
