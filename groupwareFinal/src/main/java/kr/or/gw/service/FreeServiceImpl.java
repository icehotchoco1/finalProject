package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.PageMaker;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dao.AtchDAO;
import kr.or.gw.dao.FreeDAO;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.BbsFreebdVO;

public class FreeServiceImpl implements FreeService{
	
	private FreeDAO freeDAO;
	public void setFreeDAO(FreeDAO freeDAO) {
		this.freeDAO = freeDAO;
	}
	
	private AtchDAO atchDAO;
	public void setAtchDAO(AtchDAO atchDAO) {
		this.atchDAO = atchDAO;
	}
	
	@Override
	public Map<String, Object> getFreeList(SearchCriteria cri) throws SQLException {
		List<BbsFreebdVO> freeList = freeDAO.selectSearchFreeList(cri);
		
		if(freeList != null) {
			for(BbsFreebdVO free : freeList) {
					addAtchList(free);
			}
		}
		int totalCount = freeDAO.selectSearchFreeListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String,Object>();
		
		dataMap.put("freeList", freeList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	@Override
	public BbsFreebdVO getFree(String bbsctt_no) throws SQLException {
		BbsFreebdVO free = freeDAO.selectFreeByBbscttNo(bbsctt_no);
		freeDAO.increaseViewCnt(bbsctt_no);
		addAtchList(free);
		
		return free;
	}
	@Override
	public BbsFreebdVO getFreeForModify(String bbsctt_no) throws SQLException {
		BbsFreebdVO free = freeDAO.selectFreeByBbscttNo(bbsctt_no);
		addAtchList(free);
		return free;
	}
	@Override
	public void regist(BbsFreebdVO free) throws SQLException {
		String bbsctt_no = freeDAO.selectBoardSeqNext();
		free.setBbsctt_no(bbsctt_no);
		freeDAO.insertFree(free);
		
		int index = 0;
		if(free.getAtchList() != null) {
			for(AtchMnflVO atch : free.getAtchList()) {
				atch.setBbsctt_no(bbsctt_no);
				atch.setAtch_order(index);
				atchDAO.insertAtch(atch);
				index++;
			}
		}
	}
	@Override
	public void modify(BbsFreebdVO free) throws SQLException {
		freeDAO.updateFree(free);
		
//		atchDAO.deleteAllAttach(Free.getBbsctt_no());
		
		int index = 1+free.getAtchList().size();
		if(free.getAtchList() != null) {
			for(AtchMnflVO atch : free.getAtchList()) {
				atch.setBbsctt_no(free.getBbsctt_no());
				atch.setAtch_order(index);
				atchDAO.insertAtch(atch);
				index++;
			}
		}
		
	}
	@Override
	public void remove(String bbsctt_no) throws SQLException {
		freeDAO.deleteFree(bbsctt_no);
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
	
	private void addAtchList(BbsFreebdVO free) throws SQLException{
		if(free == null) {
			return;
		}
		String bbsctt_no = free.getBbsctt_no();
		System.out.println(bbsctt_no+"나오냐");
		List<AtchMnflVO> atchList = atchDAO.selectAtchByBbscttNo(bbsctt_no);
		free.setAtchList(atchList);
	}
}
