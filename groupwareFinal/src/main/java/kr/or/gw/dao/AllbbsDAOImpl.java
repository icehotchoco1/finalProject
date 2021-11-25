package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.AllbbsCriteria;
import kr.or.gw.dto.AllbbsVO;

public class AllbbsDAOImpl implements AllbbsDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}

	@Override
	public List<AllbbsVO> selectSearchAllbbsList(AllbbsCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<AllbbsVO> allBbsList = session.selectList("Allbbs-Mapper.selectSearchAllbbsList",cri,rowBounds);
		
		return allBbsList;
	}

	@Override
	public int selectSearchAllbbsListCount(AllbbsCriteria cri) throws SQLException {
		int count =  session.selectOne("Allbbs-Mapper.selectSearchAllbbsListCount",cri);
		return count;
	}

}
