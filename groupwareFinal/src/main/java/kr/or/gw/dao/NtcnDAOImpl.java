package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.gw.dto.NtcnVO;

public class NtcnDAOImpl implements NtcnDAO {
	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int countNtcnList(int empno) throws SQLException {
		int ntcnCnt = session.selectOne("Ntcn-Mapper.countNtcnList", empno);
		return ntcnCnt;
	}

	@Override
	public List<NtcnVO> allNtcnList(int empno) throws SQLException {
		List<NtcnVO> ntcnList = session.selectList("Ntcn-Mapper.allNtcnList", empno);
		return ntcnList;
	}

	@Override
	public void chkNtcn(String ntcnNo) throws SQLException {
		session.selectList("Ntcn-Mapper.chkNtcn", ntcnNo);
	}

	@Override
	public void deleteNtcn(String ntcnNo) throws SQLException {
		session.selectList("Ntcn-Mapper.deleteNtcn", ntcnNo);
	}

	@Override
	public void deleteNtcnRcver(String ntcnNo) throws SQLException {
		session.selectList("Ntcn-Mapper.deleteNtcnRcver", ntcnNo);
		
	}
}
