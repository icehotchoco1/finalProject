package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.dao.DbxCcrDAO;
import kr.or.gw.dto.DbxCocnrVO;

public class DbxCcrServiceImpl implements DbxCcrService {

	private DbxCcrDAO dbxCcrDAO;
	public void setDbxCcrDAO(DbxCcrDAO dbxCcrDAO) {
		this.dbxCcrDAO = dbxCcrDAO;
	}

	@Override
	public Map<String, Object> getDbxCcrList() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<DbxCocnrVO> dbxCcrList = dbxCcrDAO.selectDbxCcrList();
		
		dataMap.put("dbxCcrList", dbxCcrList);
		
		return dataMap;
	}

	@Override
	public DbxCocnrVO getDbxCcr(String cocnr_no) throws SQLException {
		DbxCocnrVO dbxCcr = dbxCcrDAO.selectDbxCcrByNo(cocnr_no);
		return dbxCcr;
	}

	@Override
	public void share(DbxCocnrVO dbxCcr) throws SQLException {
		String cocnr_no = dbxCcrDAO.selectDbxCcrSeqNext();
		
		dbxCcr.setCocnr_no(cocnr_no);
		
		dbxCcrDAO.insertDbxCcr(dbxCcr);
	}

}
