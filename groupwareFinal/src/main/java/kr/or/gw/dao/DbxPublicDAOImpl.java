package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.basicCriteria;
import kr.or.gw.dto.DbxCocnrVO;
import kr.or.gw.dto.DbxVO;

public class DbxPublicDAOImpl implements DbxPublicDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<DbxVO> selectDbxAllCriteria(int rcvr_empno) throws SQLException {
		List<DbxVO> dbxAllList=
				session.selectList("DbxPublic-Mapper.selectSearchDbxAllList",rcvr_empno);
		
		return dbxAllList;
	}
	
	@Override
	public int selectDbxAllCriteriaTotalCount(basicCriteria cri) throws SQLException {
		int count=session.selectOne("DbxPublic-Mapper.selectSearchDbxAllListCount",cri);
		return count;
	}
	
	@Override
	public DbxVO selectDbxAllByDbx_no(String dbx_no) throws SQLException {
		DbxVO dbx=
				session.selectOne("DbxPublic-Mapper.selectDbxAllByDbxno",dbx_no);
		return dbx;
	}

	@Override
	public List<DbxCocnrVO> selectDbxCcrRcvrList(String dbx_no) throws SQLException {
		List<DbxCocnrVO> dbxRcvrList=
				session.selectList("DbxPublic-Mapper.selectDbxCcrRcvrList",dbx_no);
		return dbxRcvrList;
	}
	
	
//	@Override
//	public List<DbxVO> selectDbxCriteria(basicCriteria cri,int rcvr_empno) throws SQLException {
//		int offset=cri.getStartRowNum();
//		int limit=cri.getPerPageNum();		
//		RowBounds rowBounds=new RowBounds(offset,limit);		
//		
//		Map<String, Object> param = new HashMap<String, Object>();
//		
//		param.put("keyword", cri.getKeyword());
//		param.put("searchType", cri.getSearchType());
//		param.put("empno", rcvr_empno);
//		
//		List<DbxVO> dbxList=
//				session.selectList("DbxPublic-Mapper.selectSearchDbxList",param,rowBounds);
//		
//		return dbxList;
//	}
	
	@Override
	public List<DbxVO> selectDbx(basicCriteria cri,int empno) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("empno", empno);
		
		List<DbxVO> dbxList=
				session.selectList("DbxPublic-Mapper.selectDbxList",param,rowBounds);
		
		return dbxList;
	}
	

	@Override
	public int selectDbxCriteriaTotalCount(basicCriteria cri,int rcvr_empno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("empno", rcvr_empno);
		
		int count=session.selectOne("DbxPublic-Mapper.selectDbxListCount",param);
		return count;
	}

	@Override
	public DbxVO selectDbxByDbx_no(String dbx_no) throws SQLException {
		DbxVO dbx=
				session.selectOne("DbxPublic-Mapper.selectDbxByDbxno",dbx_no);
		return dbx;
	}

	@Override
	public void insertDbx(DbxVO dbx) throws SQLException {
		session.update("DbxPublic-Mapper.insertDbx",dbx);
		
	}

	@Override
	public void updateDbx(DbxVO dbx) throws SQLException {
		session.update("DbxPublic-Mapper.updateDbx",dbx);
	}

	@Override
	public void updateDbxSeModify(String dbx_no) throws SQLException {
		session.update("DbxPublic-Mapper.updateDbxSeModify",dbx_no);
	}
	
	
	@Override
	public void deleteDbx(String dbx_no) throws SQLException {

		session.update("DbxPublic-Mapper.deleteDbx",dbx_no);
	}
	
	@Override
	public void deleteDbxCcr(String dbx_no) throws SQLException {
		
		session.update("DbxPublic-Mapper.deleteDbxCcr",dbx_no);
	}

	@Override
	public String selectDbxSeqNext() throws SQLException {
		String seq_num=
				"dbno"+session.selectOne("DbxPublic-Mapper.selectDbxSeqNext");
		return seq_num;
	}

	@Override
	public String maxDbxNoNext() throws SQLException {
		String nextNum =
				"dbno" + session.selectOne("DbxPublic-Mapper.maxDbxNo");
		return nextNum;
	}





}
