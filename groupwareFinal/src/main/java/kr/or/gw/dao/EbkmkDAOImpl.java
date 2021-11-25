package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.gw.dto.EccstBkmkSanctnLnDtlsVO;
import kr.or.gw.dto.EccstBkmkSanctnLnVO;

public class EbkmkDAOImpl implements EbkmkDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<EccstBkmkSanctnLnVO> selectBkmkList(int rgstr_empno) throws SQLException {
		List<EccstBkmkSanctnLnVO> bkmkList = session.selectList("EccstLNBkmk-Mapper.selectBkmkList",rgstr_empno);
		return bkmkList;
	}
	@Override
	public List<EccstBkmkSanctnLnDtlsVO> selectBkmkListDetail(String bkmk_no) throws SQLException {
		List<EccstBkmkSanctnLnDtlsVO> bkmkDtlsList = session.selectList("EccstLNBkmk-Mapper.selectBkmkListDetail",bkmk_no);
		return bkmkDtlsList;
	}
	@Override
	public void deleteBkmk(String bkmk_no) throws SQLException {
		session.update("EccstLNBkmk-Mapper.deleteBkmk",bkmk_no);
	}
	@Override
	public void deleteBkmkDtls(String bkmk_no) throws SQLException {
		session.update("EccstLNBkmk-Mapper.deleteBkmkDtls",bkmk_no);
		
	}
	@Override
	public void insertBkmk(EccstBkmkSanctnLnVO ebkmkVO) throws SQLException {
		session.update("EccstLNBkmk-Mapper.insertBkmk",ebkmkVO);
		
	}
	@Override
	public void insertBkmkDtls(EccstBkmkSanctnLnDtlsVO dbkmkdtlsVO) throws SQLException {
		session.update("EccstLNBkmk-Mapper.insertBkmkDtls",dbkmkdtlsVO);
		
	}

	@Override
	public int getbkmkSeq() throws SQLException {
		return session.selectOne("EccstLNBkmk-Mapper.getbkmkSeq");
		
	}

}
