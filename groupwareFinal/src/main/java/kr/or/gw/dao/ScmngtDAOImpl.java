package kr.or.gw.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import kr.or.gw.dto.EccstSanctnMngtVO;

public class ScmngtDAOImpl implements ScmngtDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	
	@Override
	public int selectSeqNextVal() throws SQLException {
		int seq = session.selectOne("scmngt-Mapper.selectSeqNextVal");
		return seq;
	}

	@Override
	public void FirstRegist(EccstSanctnMngtVO scMngtVO) throws SQLException {
		session.update("scmngt-Mapper.FirstRegist",scMngtVO);
	}

	@Override
	public void updateEccst(EccstSanctnMngtVO scMngtVO) throws SQLException {
		session.update("scmngt-Mapper.updateEccst",scMngtVO);
	}

	@Override
	public void returnEccst(EccstSanctnMngtVO scMngtVO) throws SQLException {
		session.update("scmngt-Mapper.returnEccst",scMngtVO);
	}

	@Override
	public void updateEccstStatus(EccstSanctnMngtVO scMngtVO) throws SQLException {
		session.update("scmngt-Mapper.updateEccstStatus",scMngtVO);
	}

	@Override
	public void deleteEccst(String sanctn_no) throws SQLException {
		session.update("scmngt-Mapper.deleteEccst",sanctn_no);

	}

	@Override
	public EccstSanctnMngtVO selectEccstDetail(String sanctn_no) throws SQLException {
		EccstSanctnMngtVO scmngtVO = session.selectOne("scmngt-Mapper.selectEccstDetail",sanctn_no);
		return scmngtVO;
	}

}
