package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.gw.dto.AtchMnflVO;

public class AtchDAOImpl implements AtchDAO {
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	@Override
	public List<AtchMnflVO> selectAtchByBbscttNo(String bbsctt_no) throws SQLException {
		List<AtchMnflVO> atchList = session.selectList("Atch-Mapper.selectAtchByBbscttNo",bbsctt_no);
		return atchList;
	}
	@Override
	public AtchMnflVO selectAtchByFileNo(String file_no) throws SQLException {
		AtchMnflVO atch = session.selectOne("Atch-Mapper.selectAtchByFileNo",file_no);
		return atch;
	}
	@Override
	public void insertAtch(AtchMnflVO atch) throws SQLException {
		session.update("Atch-Mapper.insertAtch",atch);		
	}
	@Override
	public void deleteAtch(String file_no) throws SQLException {
		session.update("Atch-Mapper.deleteAtch",file_no);		
	}
	@Override
	public void deleteAllAttach(String bbsctt_no) throws SQLException {
		session.update("Atch-Mapper.deleteAllAtch",bbsctt_no);		
	}
}
