package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.PageMaker;
import kr.or.gw.command.basicCriteria;
import kr.or.gw.command.basicPageMaker;
import kr.or.gw.dao.AtchDAO;
import kr.or.gw.dao.MngtDAO;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.BbsMngtbdVO;

public class MngtServiceImpl implements MngtService {

	private MngtDAO mngtDAO;

	public void setMngtDAO(MngtDAO mngtDAO) {
		this.mngtDAO = mngtDAO;
	}
	// BbsMngtbdVO
	// mngt
	// Mngt

	private AtchDAO atchDAO;
	public void setAtchDAO(AtchDAO atchDAO) {
		this.atchDAO = atchDAO;
	}
	
	@Override
	public Map<String, Object> getMngtList(basicCriteria cri) throws SQLException {
		List<BbsMngtbdVO> mngtList = mngtDAO.selectMngtCriteria(cri);
		
		if(mngtList != null) {
			for(BbsMngtbdVO mngt : mngtList) {
					addAtchList(mngt);
			}
		}
		
		int totalCount = mngtDAO.selectMngtCriteriaTotalCount(cri);
		
		basicPageMaker pageMaker = new basicPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String,Object>();
		
		dataMap.put("mngtList", mngtList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public BbsMngtbdVO getMngt(String bbsctt_no) throws SQLException {
		BbsMngtbdVO mngt = mngtDAO.selectMngtByBbscttNo(bbsctt_no);
		mngtDAO.increaseViewCnt(bbsctt_no);
		addAtchList(mngt);
		
		return mngt;
	}
	
	@Override
	public BbsMngtbdVO getMngtForModify(String bbsctt_no) throws SQLException {
		BbsMngtbdVO mngt = mngtDAO.selectMngtByBbscttNo(bbsctt_no);
		addAtchList(mngt);
		return mngt;
	}
	
	@Override
	public void regist(BbsMngtbdVO mngt) throws SQLException {
		String bbsctt_no = mngtDAO.selectMngtSeqNext();
		mngt.setBbsctt_no(bbsctt_no);
		mngtDAO.insertMngt(mngt);
		
		int index = 0;
		if(mngt.getAtchList() != null) {
			for(AtchMnflVO atch : mngt.getAtchList()) {
				atch.setBbsctt_no(bbsctt_no);
				atch.setAtch_order(index);
				atchDAO.insertAtch(atch);
				index++;
			}
		}
		
	}
	@Override
	public void modify(BbsMngtbdVO mngt) throws SQLException {
		mngtDAO.updateMngt(mngt);
		
		int index = 1+mngt.getAtchList().size();
		if(mngt.getAtchList() != null) {
			for(AtchMnflVO atch : mngt.getAtchList()) {
				atch.setBbsctt_no(mngt.getBbsctt_no());
				atch.setAtch_order(index);
				atchDAO.insertAtch(atch);
				index++;
			}
		}
		
	}
	@Override
	public void remove(String bbsctt_no) throws SQLException {
		mngtDAO.deleteMngt(bbsctt_no);
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
	
	private void addAtchList(BbsMngtbdVO mngt) throws SQLException{
		if(mngt == null) {
			return;
		}
		
		String bbsctt_no = mngt.getBbsctt_no();
		List<AtchMnflVO> atchList = atchDAO.selectAtchByBbscttNo(bbsctt_no);
		
		mngt.setAtchList(atchList);
	}
}
