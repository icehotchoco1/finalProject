package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.BbsCtsnnbdVO;
import kr.or.gw.dto.BbsFreebdVO;

public class FreeDAOImpl implements FreeDAO{
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	@Override
	public List<BbsFreebdVO> selectSearchFreeList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<BbsFreebdVO> freeList= session.selectList("Free-Mapper.selectSearchFreeList",cri,rowBounds);
		
		
		return freeList;
	}
	@Override
	public int selectSearchFreeListCount(SearchCriteria cri) throws SQLException {
		
		int count = session.selectOne("Free-Mapper.selectSearchFreeListCount",cri);
		return count;
	}
	@Override
	public BbsFreebdVO selectFreeByBbscttNo(String bbsctt_no) throws SQLException {
		BbsFreebdVO free = session.selectOne("Free-Mapper.selectFreeByBbscttNo",bbsctt_no);
		return free;
	}
	@Override
	public void insertFree(BbsFreebdVO free) throws SQLException {
		session.update("Free-Mapper.insertFree",free);
	}
	@Override
	public void updateFree(BbsFreebdVO free) throws SQLException {
		session.update("Free-Mapper.updateFree",free);
	}
	@Override
	public void deleteFree(String bbsctt_no) throws SQLException {
		session.update("Free-Mapper.deleteFree",bbsctt_no);
	}
	@Override
	public void increaseViewCnt(String bbsctt_no) throws SQLException {
		session.update("Free-Mapper.increaseViewCnt",bbsctt_no);
	}
	@Override
	public String selectBoardSeqNext() throws SQLException {
		String seq_str = "free"+session.selectOne("Free-Mapper.selectFreeSeqNext");
		return seq_str;
	}
}
