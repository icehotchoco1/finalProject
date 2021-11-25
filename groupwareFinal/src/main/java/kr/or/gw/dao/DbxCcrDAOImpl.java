package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.gw.dto.DbxCocnrVO;

public class DbxCcrDAOImpl implements DbxCcrDAO {

	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<DbxCocnrVO> selectDbxCcrList() throws SQLException {
		List<DbxCocnrVO> dbxCcrList =
				session.selectList("DbxCcr-Mapper.selectDbxCcrList");
		
		return dbxCcrList;
	}

	@Override
	public DbxCocnrVO selectDbxCcrByNo(String cocnr_no) throws SQLException {
		DbxCocnrVO dbxCcr =
				session.selectOne("DbxCcr-Mapper.selectDbxCcrByNo", cocnr_no);
		
		return dbxCcr;
	}

	@Override
	public void insertDbxCcr(DbxCocnrVO dbxCcr) throws SQLException {
		session.update("DbxCcr-Mapper.insertDbxCcr", dbxCcr);
	}

	@Override
	public String selectDbxCcrSeqNext() throws SQLException {
		String seq_num =
				"cono" + session.selectOne("DbxCcr-Mapper.selectDbxCcrSeqNext");
		return seq_num;
	}


}
