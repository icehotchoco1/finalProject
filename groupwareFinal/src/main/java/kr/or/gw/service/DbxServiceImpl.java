package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.PageMaker;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dao.AtchDAO;
import kr.or.gw.dao.DbxDAO;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.DbxVO;

public class DbxServiceImpl implements DbxService{
	
	
	private DbxDAO dbxDAO;
	public void setDbxDAO(DbxDAO dbxDAO) {
		this.dbxDAO = dbxDAO;
	}

	private AtchDAO atchDAO;
	public void setAtchDAO(AtchDAO atchDAO) {
		this.atchDAO = atchDAO;
	}
	
	@Override
	public Map<String, Object> getDbxIndiList(SearchCriteria cri, int empno) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		List<DbxVO> dbxList = dbxDAO.selectDbxIndiList(cri, empno);
		
		if(dbxList != null) {
			for(DbxVO alljob : dbxList) {
				addAtchList(alljob);
			}
		}
		
		
		// 전체 news 개수
		int totalCount = dbxDAO.selectDbxCriteriaTotalCount(cri, empno);
		
		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("dbxList", dbxList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public DbxVO getDbx(String dbx_no) throws SQLException {
		DbxVO dbx = dbxDAO.selectDbxByDbx_no(dbx_no);
		addAtchList(dbx);
		return dbx;
	}

	@Override
	public void regist(DbxVO dbx) throws SQLException {
		String dbx_no = dbxDAO.selectDbxSeqNext();
		dbx.setDbx_no(dbx_no);
		
		int index = 0;
		if(dbx.getAtchList() != null) {
			for(AtchMnflVO atch : dbx.getAtchList()) {
				atch.setBbsctt_no(dbx_no);
				atch.setAtch_order(index);
				atchDAO.insertAtch(atch);
				index++;
			}
		}
		
		dbxDAO.insertDbx(dbx);
	}

	@Override
	public void modify(DbxVO dbx) throws SQLException {
		int index = 0;
		if(dbx.getAtchList() != null) {
			for(AtchMnflVO atch : dbx.getAtchList()) {
				atch.setBbsctt_no(dbx.getDbx_no());
				atch.setAtch_order(index);
				atchDAO.insertAtch(atch);
				index++;
			}
		}
		dbxDAO.updateDbx(dbx);
	}

	@Override
	public void remove(String dbx_no) throws SQLException {
		dbxDAO.deleteDbx(dbx_no);
	}
	
	//첨부파일
	@Override
	public AtchMnflVO getAttachByFileNo(String file_no) throws SQLException {
		AtchMnflVO atch = atchDAO.selectAtchByFileNo(file_no);
		return atch;
	}
	
	@Override
	public void removeAttachByFileNo(String file_no) throws SQLException {
		atchDAO.deleteAtch(file_no);
	}
	private void addAtchList(DbxVO dbx) throws SQLException{
		if(dbx == null) {
			return;
		}
		String dbx_no = dbx.getDbx_no();
		List<AtchMnflVO> atchList = atchDAO.selectAtchByBbscttNo(dbx_no);
		
		dbx.setAtchList(atchList);
	}
}
