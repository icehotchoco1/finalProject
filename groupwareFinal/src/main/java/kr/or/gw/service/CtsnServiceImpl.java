package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.PageMaker;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dao.AtchDAO;
import kr.or.gw.dao.CtsnDAO;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.BbsCtsnnbdVO;

public class CtsnServiceImpl implements CtsnService{
	private CtsnDAO ctsnDAO;
	public void setCtsnDAO(CtsnDAO ctsnDAO) {
		this.ctsnDAO = ctsnDAO;
	}
	
	private AtchDAO atchDAO;
	public void setAtchDAO(AtchDAO atchDAO) {
		this.atchDAO = atchDAO;
	}
	
	@Override
	public Map<String, Object> getCtsnList(SearchCriteria cri) throws SQLException {
		List<BbsCtsnnbdVO> ctsnList = ctsnDAO.selectSearchCtsnList(cri);
		
		if(ctsnList != null) {
			for(BbsCtsnnbdVO ctsn : ctsnList) {
					addAtchList(ctsn);
			}
		}
		int totalCount = ctsnDAO.selectSearchCtsnListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String,Object>();
		
		dataMap.put("ctsnList", ctsnList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	@Override
	public BbsCtsnnbdVO getCtsn(String bbsctt_no) throws SQLException {
		BbsCtsnnbdVO ctsn = ctsnDAO.selectCtsnByBbscttNo(bbsctt_no);
		ctsnDAO.increaseViewCnt(bbsctt_no);
		addAtchList(ctsn);
		
		return ctsn;
	}
	@Override
	public BbsCtsnnbdVO getCtsnForModify(String bbsctt_no) throws SQLException {
		BbsCtsnnbdVO ctsn = ctsnDAO.selectCtsnByBbscttNo(bbsctt_no);
		addAtchList(ctsn);
		return ctsn;
	}
	@Override
	public void regist(BbsCtsnnbdVO ctsn) throws SQLException {
		String bbsctt_no = ctsnDAO.selectBoardSeqNext();
		ctsn.setBbsctt_no(bbsctt_no);
		ctsnDAO.insertCtsn(ctsn);
		
		int index = 0;
		if(ctsn.getAtchList() != null) {
			for(AtchMnflVO atch : ctsn.getAtchList()) {
				atch.setBbsctt_no(bbsctt_no);
				atch.setAtch_order(index);
				atchDAO.insertAtch(atch);
				index++;
			}
		}
		
	}
	@Override
	public void modify(BbsCtsnnbdVO ctsn) throws SQLException {
		ctsnDAO.updateCtsn(ctsn);
		
//		atchDAO.deleteAllAttach(ctsn.getBbsctt_no());
		
		int index = 1+ctsn.getAtchList().size();
		if(ctsn.getAtchList() != null) {
			for(AtchMnflVO atch : ctsn.getAtchList()) {
				atch.setBbsctt_no(ctsn.getBbsctt_no());
				atch.setAtch_order(index);
				atchDAO.insertAtch(atch);
				index++;
			}
		}
		
	}
	@Override
	public void remove(String bbsctt_no) throws SQLException {
		ctsnDAO.deleteCtsn(bbsctt_no);
		atchDAO.deleteAllAttach(bbsctt_no);
	}


	@Override
	public AtchMnflVO getAttachByFileNo(String file_no) throws SQLException {
		
		AtchMnflVO atch = atchDAO.selectAtchByFileNo(file_no);
		
		return atch;
	}


	@Override
	public void removeAttachByFileNo(String file_no) throws SQLException {
		atchDAO.deleteAtch(file_no);
		
	}
	
	private void addAtchList(BbsCtsnnbdVO ctsn) throws SQLException{
		if(ctsn == null) {
			return;
		}
		
		String bbsctt_no = ctsn.getBbsctt_no();
		List<AtchMnflVO> atchList = atchDAO.selectAtchByBbscttNo(bbsctt_no);
		
		ctsn.setAtchList(atchList);
	}
}
