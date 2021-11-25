package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.gw.dto.EccstSanctnerVO;

public class ScnerDAOImpl implements ScnerDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public int selectSeqNextVal() throws SQLException {
		int seq= session.selectOne("scner-Mapper.selectSeqNextVal");
		return seq;
	}

	@Override
	public void insertSanctners(EccstSanctnerVO scnerVO) throws SQLException {
		session.update("scner-Mapper.insertSanctners",scnerVO);
	}

	@Override
	public List<EccstSanctnerVO> selectSanctners(String sanctn_no) throws SQLException {
		List<EccstSanctnerVO> scnerList = session.selectList("scner-Mapper.selectSanctners",sanctn_no);
		return scnerList;
	}

	@Override
	public void updateSanctner(EccstSanctnerVO scnerVO) throws SQLException {
		session.update("scner-Mapper.updateSanctner",scnerVO);
	}

	@Override
	public void deleteSanctners(String sanctn_no) throws SQLException {
		session.update("scner-Mapper.deleteSanctners",sanctn_no);
	}

	@Override
	public int selectMaxLineNo(String sanctn_no) throws SQLException {
		int max = session.selectOne("scner-Mapper.selectMaxLineNo",sanctn_no);
		return max;
	}

	@Override
	public void updateAllConfirmAt(EccstSanctnerVO scnerVO) throws SQLException {
		session.update("scner-Mapper.updateAllConfirmAt",scnerVO);
	}

	@Override
	public void updateNextSanctner(EccstSanctnerVO scnerVO) throws SQLException {
		session.update("scner-Mapper.updateNextSanctner",scnerVO);
	}

	@Override
	public int selectLineNobySanctnNo(EccstSanctnerVO scnerVO) throws SQLException {
		int lnno = session.selectOne("scner-Mapper.selectLineNobySanctnNo",scnerVO);
		return lnno;
	}

}
