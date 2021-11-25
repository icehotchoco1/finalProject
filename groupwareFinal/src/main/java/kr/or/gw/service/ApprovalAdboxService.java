package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.command.ApprovalAdboxCriteria;

public interface ApprovalAdboxService {

	//기안함
	Map<String, Object> eccRequestList(ApprovalAdboxCriteria cri,int empno) throws SQLException;
	
	//반려함
	Map<String, Object> eccRejectList(ApprovalAdboxCriteria cri,int empno) throws SQLException;
	//완료함
	Map<String, Object> eccCompletionList(ApprovalAdboxCriteria cri,int empno) throws SQLException;
	//대기함
	Map<String, Object> eccWaitList(ApprovalAdboxCriteria cri,int empno) throws SQLException;

}
