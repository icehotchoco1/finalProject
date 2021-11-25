package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.DbxVO;

public class DbxDAOImpl implements DbxDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<DbxVO> selectDbxIndiList(SearchCriteria cri, int empno) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("empno", empno);
		
		List<DbxVO> dbxList=
				session.selectList("Dbx-Mapper.selectSearchDbxIndiList",param,rowBounds);
		
		return dbxList;
	}
	
	@Override
	public int selectDbxCriteriaTotalCount(SearchCriteria cri, int empno) throws SQLException {
		
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("empno", empno);
		
		int count=session.selectOne("Dbx-Mapper.selectSearchDbxIndiListCount",param);
		return count;
	}
	
	@Override
	public DbxVO selectDbxByDbx_no(String dbx_no) throws SQLException {
		DbxVO dbx=
				session.selectOne("Dbx-Mapper.selectDbxByDbxno",dbx_no);
		return dbx;
	}

	@Override
	public void insertDbx(DbxVO dbx) throws SQLException {
		session.update("Dbx-Mapper.insertDbx",dbx);
	}

	@Override
	public void updateDbx(DbxVO dbx) throws SQLException {
		session.update("Dbx-Mapper.updateDbx",dbx);
	}

	@Override
	public void deleteDbx(String dbx_no) throws SQLException {
		session.update("Dbx-Mapper.deleteDbx",dbx_no);
	}

	@Override
	public String selectDbxSeqNext() throws SQLException {
		String seq_num=
				"dbno"+session.selectOne("Dbx-Mapper.selectDbxSeqNext");
		return seq_num;
	}
}
