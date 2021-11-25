package kr.or.gw.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import kr.or.gw.dto.EccstEnvrnSetupVO;

public class EscSetupDAOImpl implements EscSetupDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public EccstEnvrnSetupVO selectEscSetupByEmpno(int empno) throws SQLException {
		EccstEnvrnSetupVO setVO = session.selectOne("EscSetup-Mapper.selectEscSetupByEmpno",empno);
		
		return setVO;
	}

	@Override
	public void insertEscSetup(EccstEnvrnSetupVO setVO) throws SQLException {
		session.update("EscSetup-Mapper.insertEscSetup",setVO);
	}

	@Override
	public void updateEscSetup(EccstEnvrnSetupVO setVO) throws SQLException {
		session.update("EscSetup-Mapper.updateEscSetup",setVO);
	}

}
