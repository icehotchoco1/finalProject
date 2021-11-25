package kr.or.gw.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import kr.or.gw.dto.OrgnztEmpMngtVO;

public class ApprovalSettingDAOImpl implements ApprovalSettingDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public void updateApprovalPass(OrgnztEmpMngtVO emp) throws SQLException {
		session.update("ApprovalSetting-Mapper.updatePassword", emp);
		
	}
	


	

}
