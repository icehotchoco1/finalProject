package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.ApprovalAdBoxPageMaker;
import kr.or.gw.command.ApprovalAdboxCriteria;
import kr.or.gw.dao.ApprovalAdboxDAO;
import kr.or.gw.dto.EccstSanctnMngtVO;

public class ApprovalAdboxServiceImpl implements ApprovalAdboxService{
	
	private ApprovalAdboxDAO approvalAdboxDAO;
	public void setApprovalAdboxDAO(ApprovalAdboxDAO approvalAdboxDAO) {
		this.approvalAdboxDAO = approvalAdboxDAO;
	}

	
	@Override
	public Map<String, Object> eccRequestList(ApprovalAdboxCriteria cri,int empno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<EccstSanctnMngtVO> eccRequestList = approvalAdboxDAO.eccRequestList(cri,empno);
		
		int totalCount = approvalAdboxDAO.selecteccRequestListCount(cri, empno);
		
		ApprovalAdBoxPageMaker pageMaker = new ApprovalAdBoxPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("eccRequestList", eccRequestList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> eccRejectList(ApprovalAdboxCriteria cri,int empno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<EccstSanctnMngtVO> eccRejectList = approvalAdboxDAO.eccRejectList(cri,empno);
		
		int totalCount = approvalAdboxDAO.selecteccRejectListCount(cri, empno);
		
		ApprovalAdBoxPageMaker pageMaker = new ApprovalAdBoxPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("eccRejectList", eccRejectList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> eccCompletionList(ApprovalAdboxCriteria cri,int empno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<EccstSanctnMngtVO> eccCompletionList = approvalAdboxDAO.eccCompletionList(cri,empno);
		
		int totalCount = approvalAdboxDAO.selecteccCompletionListCount(cri, empno);
		
		ApprovalAdBoxPageMaker pageMaker = new ApprovalAdBoxPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("eccCompletionList", eccCompletionList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> eccWaitList(ApprovalAdboxCriteria cri,int empno) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<EccstSanctnMngtVO> eccWaitList = approvalAdboxDAO.eccWaitList(cri,empno);
		
		int totalCount = approvalAdboxDAO.selecteccWaitListCount(cri, empno);
		
		ApprovalAdBoxPageMaker pageMaker = new ApprovalAdBoxPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("eccWaitList", eccWaitList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	
	




}
