package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.gw.dto.EccstRegstrFormVO;

public class ErfDAOImpl implements ErfDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<EccstRegstrFormVO> selectErf() throws SQLException {
		
		List<EccstRegstrFormVO> erfList =
				session.selectList("Erf-Mapper.selectErfList");
		return erfList;
	}

	@Override
	public EccstRegstrFormVO selectErfByErfno(String form_no) throws SQLException {
		EccstRegstrFormVO erf = session.selectOne("Erf-Mapper.selectErfByErfno", form_no);
		return erf;
	}

	@Override
	public void insertErf(EccstRegstrFormVO erf) throws SQLException {
		session.update("Erf-Mapper.insertErf", erf);
	}

	@Override
	public String selectErfSeqNext() throws SQLException {
		String seq_num = session.selectOne("Erf-Mapper.selectErfSeqNext");
		return seq_num;
	}

}
