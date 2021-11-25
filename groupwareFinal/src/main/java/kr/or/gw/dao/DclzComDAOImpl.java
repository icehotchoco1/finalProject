package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.gw.dto.DclzComVO;
import kr.or.gw.dto.DclzMngtVO;

public class DclzComDAOImpl implements DclzComDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<DclzComVO> selectTardy() throws SQLException {
		List<DclzComVO> dclzComList = session.selectList("DclzCom-Mapper.selectTardy");
		return dclzComList;
	}

	@Override
	public List<DclzComVO> selectEarlyLeave() throws SQLException {
		List<DclzComVO> dclzComList = session.selectList("DclzCom-Mapper.selectEarlyLeave");
		return dclzComList;
	}

	@Override
	public List<DclzComVO> selectAbsenteeism() throws SQLException {
		List<DclzComVO> dclzComList = session.selectList("DclzCom-Mapper.selectAbsenteeism");
		return dclzComList;
	}

	@Override
	public DclzMngtVO selectMyCommute(int empno) throws SQLException {
		DclzMngtVO dclzCom = session.selectOne("DclzCom-Mapper.selectMyCommute", empno);
		return dclzCom;
	}

}
