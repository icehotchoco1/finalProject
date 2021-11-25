package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.PageMaker;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.tempstorageCriteria;
import kr.or.gw.command.tempstoragePageMaker;
import kr.or.gw.dao.EscMngtDAO;
import kr.or.gw.dto.EccstSanctnMngtVO;

public class EscMngtServiceImpl implements EscMngtService {
	
	private EscMngtDAO escMngtDAO;
	public void setEscMngtDAO(EscMngtDAO escMngtDAO) {
		this.escMngtDAO = escMngtDAO;
	}
	
	
	@Override
	public Map<String, Object> getEscMngtList(tempstorageCriteria cri, int empno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<EccstSanctnMngtVO> escMngtList = escMngtDAO.selectSearchEscMngtList(cri, empno);
		
		int totalCount = escMngtDAO.selectSearchEscMngtListCount(cri, empno);
		
		tempstoragePageMaker pageMaker = new tempstoragePageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("escMngtList", escMngtList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public EccstSanctnMngtVO getEscMngt(String sanctn_no) throws SQLException {
		EccstSanctnMngtVO escMngt = escMngtDAO.selectEscMngtByNo(sanctn_no);
		return escMngt;
	}

	@Override
	public void modify(EccstSanctnMngtVO escMngt) throws SQLException {
		escMngtDAO.updateEscMngt(escMngt);
	}

	@Override
	public void remove(String sanctn_no) throws SQLException {
		escMngtDAO.deleteEscMngt(sanctn_no);
	}


	@Override
	public EccstSanctnMngtVO getEscMngtPlusErf(String sanctn_no) throws SQLException {
		EccstSanctnMngtVO escMngt = escMngtDAO.selectEscMngtPlusErf(sanctn_no);
		return escMngt;
	}


	@Override
	public Map<String, Object> getEscMngtList2() throws SQLException {
		List<EccstSanctnMngtVO> escMngtList = escMngtDAO.selectEscMngtList();
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("escMngtList", escMngtList);
		
		return dataMap;
	}



}
