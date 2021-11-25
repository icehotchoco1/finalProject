package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.basicCriteria;
import kr.or.gw.command.basicPageMaker;
import kr.or.gw.dao.AtchDAO;
import kr.or.gw.dao.DbxPublicDAO;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.DbxCocnrVO;
import kr.or.gw.dto.DbxVO;

public class DbxPublicServiceImpl implements DbxPublicService {


	private DbxPublicDAO dbxPublicDAO;
	public void setDbxPublicDAO(DbxPublicDAO dbxPublicDAO) {
		this.dbxPublicDAO = dbxPublicDAO;
		
	}
	private AtchDAO atchDAO;
	public void setAtchDAO(AtchDAO atchDAO) {
		this.atchDAO = atchDAO;
	}
	
	// 전체문서 조회
	@Override
	public Map<String, Object> getDbxAllList(int rcvr_empno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		List<DbxVO> dbxAllList = dbxPublicDAO.selectDbxAllCriteria(rcvr_empno);

		dataMap.put("dbxAllList", dbxAllList);

		return dataMap;
	}

	@Override
	public DbxVO getDbxAll(String dbx_no) throws SQLException {
		DbxVO dbx = dbxPublicDAO.selectDbxAllByDbx_no(dbx_no);
		return dbx;
	}
	
	
	
	// 공유문서 조회

	@Override
	public Map<String, Object> getDbxList(basicCriteria cri, int empno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<DbxVO> dbxList = dbxPublicDAO.selectDbx(cri, empno);
		
		// 전체 news 개수
		int totalCount = dbxPublicDAO.selectDbxCriteriaTotalCount(cri, empno);

		if(dbxList != null) {
			for(DbxVO alljob : dbxList) {
				addAtchList(alljob);
			}
		}
		// PageMaker 생성.
		basicPageMaker pageMaker = new basicPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("dbxPublicList", dbxList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public DbxVO getDbxForModify(String dbx_no) throws SQLException {
		DbxVO dbx = dbxPublicDAO.selectDbxByDbx_no(dbx_no);
		addAtchList(dbx);
		return dbx;
	}

	@Override
	public DbxVO getDbx(String dbx_no) throws SQLException {
		DbxVO dbx = dbxPublicDAO.selectDbxByDbx_no(dbx_no);
		addAtchList(dbx);
		return dbx;
	}

	@Override
	public Map<String, Object> getDbxRcvrList(String dbx_no) throws SQLException {
		Map<String, Object> dataMap3 = new HashMap<String, Object>();
		
		List<DbxCocnrVO> dbxRcvrList = dbxPublicDAO.selectDbxCcrRcvrList(dbx_no);
		
		dataMap3.put("dbxRcvrList", dbxRcvrList);
		return dataMap3;
	}


	@Override
	public void regist(DbxVO dbx) throws SQLException {
		
		String dbx_no = dbxPublicDAO.selectDbxSeqNext();
		
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

		dbxPublicDAO.insertDbx(dbx);
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
		dbxPublicDAO.updateDbx(dbx);
	}

	@Override
	public void modifySe(String dbx_no) throws SQLException {
		dbxPublicDAO.updateDbxSeModify(dbx_no);
	}


	@Override
	public void remove(String dbx_no) throws SQLException {

		dbxPublicDAO.deleteDbx(dbx_no);
	}
	
	@Override
	public void removeShare(String dbx_no) throws SQLException {
		dbxPublicDAO.deleteDbxCcr(dbx_no);
	}

	@Override
	public String dbxNext() throws SQLException {

		String dbxNext = dbxPublicDAO.maxDbxNoNext();
		return dbxNext;
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
