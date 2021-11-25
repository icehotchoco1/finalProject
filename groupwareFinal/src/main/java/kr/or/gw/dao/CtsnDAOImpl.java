package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.BbsCtsnnbdVO;

public class CtsnDAOImpl implements CtsnDAO{
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	@Override
	public List<BbsCtsnnbdVO> selectSearchCtsnList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<BbsCtsnnbdVO> ctsnList= session.selectList("Ctsn-Mapper.selectSearchCtsnList",cri,rowBounds);
		
		
		return ctsnList;
	}
	@Override
	public int selectSearchCtsnListCount(SearchCriteria cri) throws SQLException {
		
		int count = session.selectOne("Ctsn-Mapper.selectSearchCtsnListCount",cri);
		return count;
	}
	@Override
	public BbsCtsnnbdVO selectCtsnByBbscttNo(String bbsctt_no) throws SQLException {
		BbsCtsnnbdVO ctsn = session.selectOne("Ctsn-Mapper.selectCtsnByBbscttNo",bbsctt_no);
		return ctsn;
	}
	@Override
	public void insertCtsn(BbsCtsnnbdVO ctsn) throws SQLException {
		session.update("Ctsn-Mapper.insertCtsn",ctsn);
	}
	@Override
	public void updateCtsn(BbsCtsnnbdVO ctsn) throws SQLException {
		session.update("Ctsn-Mapper.updateCtsn",ctsn);
	}
	@Override
	public void deleteCtsn(String bbsctt_no) throws SQLException {
		session.update("Ctsn-Mapper.deleteCtsn",bbsctt_no);
	}
	@Override
	public void increaseViewCnt(String bbsctt_no) throws SQLException {
		session.update("Ctsn-Mapper.increaseViewCnt",bbsctt_no);
	}
	@Override
	public String selectBoardSeqNext() throws SQLException {
		String seq_str = "ctsn"+session.selectOne("Ctsn-Mapper.selectCtsnSeqNext");
		return seq_str;
	}
}
