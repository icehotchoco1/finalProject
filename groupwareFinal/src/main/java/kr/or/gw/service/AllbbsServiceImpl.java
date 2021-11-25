package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.AllbbsCriteria;
import kr.or.gw.command.AllbbsPageMaker;
import kr.or.gw.dao.AllbbsDAO;
import kr.or.gw.dao.AtchDAO;
import kr.or.gw.dto.AllbbsVO;
import kr.or.gw.dto.AtchMnflVO;

public class AllbbsServiceImpl implements AllbbsService{
	private AllbbsDAO allbbsDAO;
	public void setAllbbsDAO(AllbbsDAO allbbsDAO) {
		this.allbbsDAO = allbbsDAO;
	}

	private AtchDAO atchDAO;
	public void setAtchDAO(AtchDAO atchDAO) {
		this.atchDAO = atchDAO;
	}

	@Override
	public Map<String, Object> getAllBbsList(AllbbsCriteria cri) throws SQLException {
		
		List<AllbbsVO> allBbsList = allbbsDAO.selectSearchAllbbsList(cri);
		
		if(allBbsList != null) {
			for(AllbbsVO allbbs : allBbsList) {
				addAtchList(allbbs);
			}
		}
		
		int  totalCount = allbbsDAO.selectSearchAllbbsListCount(cri);
		
		AllbbsPageMaker pageMaker = new AllbbsPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String,Object>();
		
		dataMap.put("allBbsList", allBbsList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	
	private void addAtchList(AllbbsVO allbbs) throws SQLException{
		if(allbbs == null) {
			return;
		}
		
		String bbsctt_no = allbbs.getBbsctt_no();
		List<AtchMnflVO> atchList = atchDAO.selectAtchByBbscttNo(bbsctt_no);
		
		allbbs.setAtchList(atchList);
	}
}
