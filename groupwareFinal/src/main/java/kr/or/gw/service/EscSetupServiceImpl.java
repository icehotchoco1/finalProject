package kr.or.gw.service;

import java.sql.SQLException;

import kr.or.gw.dao.EscSetupDAO;
import kr.or.gw.dto.EccstEnvrnSetupVO;

public class EscSetupServiceImpl implements EscSetupService{
	
	EscSetupDAO escSetupDAO;
	public void setEscSetupDAO(EscSetupDAO escSetupDAO) {
		this.escSetupDAO = escSetupDAO;
	}
	
	
	@Override
	public EccstEnvrnSetupVO selectEscSetupByEmpno(int empno) throws SQLException {
		EccstEnvrnSetupVO setVO = escSetupDAO.selectEscSetupByEmpno(empno);
		return setVO;
	}
	@Override
	public void insertEscSetup(EccstEnvrnSetupVO setVO) throws SQLException {
		escSetupDAO.insertEscSetup(setVO);
	}
	@Override
	public void updateEscSetup(EccstEnvrnSetupVO setVO) throws SQLException {
		escSetupDAO.updateEscSetup(setVO);
	}
	

}
