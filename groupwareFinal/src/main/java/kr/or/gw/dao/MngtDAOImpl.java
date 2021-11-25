package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.basicCriteria;
import kr.or.gw.dto.BbsMngtbdVO;

public class MngtDAOImpl implements MngtDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<BbsMngtbdVO> selectMngtCriteria(basicCriteria cri) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		List<BbsMngtbdVO> mngtList=
				session.selectList("Mngt-Mapper.selectSearchMngtList",cri,rowBounds);
		
		return mngtList;
	}
	
	@Override
	public int selectMngtCriteriaTotalCount(basicCriteria cri) throws SQLException {
				
		int count=session.selectOne("Mngt-Mapper.selectSearchMngtListCount",cri);
		return count;
	}
	
	@Override
	public BbsMngtbdVO selectMngtByBbscttNo(String bbsctt_no) throws SQLException {
		BbsMngtbdVO mngt=
				session.selectOne("Mngt-Mapper.selectMngtByBbscttNo",bbsctt_no);
		return mngt;
	}

	@Override
	public void insertMngt(BbsMngtbdVO mngt) throws SQLException {
		session.update("Mngt-Mapper.insertMngt",mngt);
	}

	@Override
	public void updateMngt(BbsMngtbdVO mngt) throws SQLException {
		session.update("Mngt-Mapper.updateMngt",mngt);
	}

	@Override
	public void deleteMngt(String bbsctt_no) throws SQLException {
		session.update("Mngt-Mapper.deleteMngt",bbsctt_no);
	}

	@Override
	public void increaseViewCnt(String bbsctt_no) throws SQLException {
		session.update("Mngt-Mapper.increaseViewCnt",bbsctt_no);
	}

	@Override
	public String selectMngtSeqNext() throws SQLException {
		String seq_str=
				"mngt"+session.selectOne("Mngt-Mapper.selectMngtSeqNext");
		return seq_str;
	}

}
