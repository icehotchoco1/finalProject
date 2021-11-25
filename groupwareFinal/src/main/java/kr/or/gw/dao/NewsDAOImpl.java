package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.BbsCmpnyDsptchVO;

public class NewsDAOImpl implements NewsDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<BbsCmpnyDsptchVO> selectNewsCriteria(SearchCriteria cri) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		List<BbsCmpnyDsptchVO> newsList=
				session.selectList("News-Mapper.selectSearchNewsList",cri,rowBounds);
		
		return newsList;
	}
	
	@Override
	public int selectNewsCriteriaTotalCount(SearchCriteria cri) throws SQLException {
				
		int count=session.selectOne("News-Mapper.selectSearchNewsListCount",cri);
		return count;
	}
	
	@Override
	public BbsCmpnyDsptchVO selectNewsByBbscttno(String bbsctt_no) throws SQLException {
		BbsCmpnyDsptchVO news=
				session.selectOne("News-Mapper.selectNewsByBbscttno",bbsctt_no);
		return news;
	}

	@Override
	public void insertNews(BbsCmpnyDsptchVO news) throws SQLException {
		session.update("News-Mapper.insertNews",news);
	}

	@Override
	public void updateNews(BbsCmpnyDsptchVO news) throws SQLException {
		session.update("News-Mapper.updateNews",news);
	}

	@Override
	public void deleteNews(String bbsctt_no) throws SQLException {
		session.update("News-Mapper.deleteNews",bbsctt_no);
	}

	@Override
	public void increaseViewCnt(String bbsctt_no) throws SQLException {
		session.update("News-Mapper.increaseViewCnt",bbsctt_no);
	}

	@Override
	public String selectNewsSeqNext() throws SQLException {
		String seq_num=
				"bnbd"+session.selectOne("News-Mapper.selectNewsSeqNext");
		return seq_num;
	}
}
