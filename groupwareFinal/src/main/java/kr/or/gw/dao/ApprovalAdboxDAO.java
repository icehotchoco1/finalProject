package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.ApprovalAdboxCriteria;
import kr.or.gw.dto.EccstSanctnMngtVO;


public interface ApprovalAdboxDAO {
	
	//기안함
	//List<EccstSanctnMngtVO> eccRequestList(Map<String, Object> dataMap ) throws SQLException;
	List<EccstSanctnMngtVO> eccRequestList(ApprovalAdboxCriteria cri,int empno) throws SQLException;
	int selecteccRequestListCount(ApprovalAdboxCriteria cri,int empno) throws SQLException;
	//결재반려함
	List<EccstSanctnMngtVO> eccRejectList(ApprovalAdboxCriteria cri,int empno) throws SQLException;
	int selecteccRejectListCount(ApprovalAdboxCriteria cri,int empno) throws SQLException;
	//결재완료함
	List<EccstSanctnMngtVO> eccCompletionList(ApprovalAdboxCriteria cri,int empno) throws SQLException;
	int selecteccCompletionListCount(ApprovalAdboxCriteria cri,int empno) throws SQLException;
	//결재대기함
	List<EccstSanctnMngtVO> eccWaitList(ApprovalAdboxCriteria cri,int empno) throws SQLException;
	int selecteccWaitListCount(ApprovalAdboxCriteria cri,int empno) throws SQLException;

}
