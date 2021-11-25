package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.EscDbxCriteria;
import kr.or.gw.command.EscDbxpageMaker;
import kr.or.gw.dao.EscDbxDAO;
import kr.or.gw.dao.EscMngtDAO;
import kr.or.gw.dto.EccstDbxVO;
import kr.or.gw.dto.EccstSanctnMngtVO;

public class EscDbxServiceImpl implements EscDbxService{
	
	
	private EscDbxDAO escDbxDAO;
	public void setEscDbxDAO(EscDbxDAO escDbxDAO) {
		this.escDbxDAO = escDbxDAO;
	}
	
	private EscMngtDAO escMngtDAO;
	public void setEscMngtDAO(EscMngtDAO escMngtDAO) {
		this.escMngtDAO = escMngtDAO;
	}
	

	@Override
	public Map<String, Object> getRdRcvList(EscDbxCriteria cri, int rec_empno) throws SQLException {
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		List<EccstSanctnMngtVO> rdRcvList = escDbxDAO.selectRdRcvList(cri, rec_empno);
		
		// 전체 escDbx 개수
		int totalCount = escDbxDAO.selectRdRcvListCount(cri, rec_empno);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		// PageMaker 생성.
		EscDbxpageMaker pageMaker = new EscDbxpageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("rdRcvList", rdRcvList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	@Override
	public Map<String, Object> getRdSendList(EscDbxCriteria cri, int empno) throws SQLException {
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		List<EccstSanctnMngtVO> rdSendList = escDbxDAO.selectRdSendList(cri, empno);
		
		// 전체 escDbx 개수
		int totalCount = escDbxDAO.selectRdSendListCount(cri, empno);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		// PageMaker 생성.
		EscDbxpageMaker pageMaker = new EscDbxpageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("rdSendList", rdSendList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public EccstSanctnMngtVO getEscSanctn(String sanctn_no) throws SQLException {
		EccstSanctnMngtVO escMngt = escMngtDAO.selectEscMngtPlusErf(sanctn_no);
		return escMngt;
	}


	@Override
	public int selectSeqNextVal() throws SQLException {
		int seq = escDbxDAO.selectSeqNextVal();
		return seq;
	}


	@Override
	public void insertDbx(EccstDbxVO escDbxVO) throws SQLException {
		int seq = escDbxDAO.selectSeqNextVal();
		
		escDbxVO.setEccdbx_no(seq+"");
		escDbxDAO.insertDbx(escDbxVO);
	}


	@Override
	public List<EccstDbxVO> getRefferList(String sanctn_no) throws SQLException {
		List<EccstDbxVO> refferList = escDbxDAO.selecRefferers(sanctn_no);
		return refferList;
	}


	@Override
	public void deleteDbx(String sanctn_no) throws SQLException {
		escDbxDAO.deleteDbx(sanctn_no);
	}

}
