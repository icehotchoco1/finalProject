package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dto.NtcnVO;

public interface NtcnDAO {
	
	// 알림 갯수 조회
	public int countNtcnList(int empno) throws SQLException;
	
	// 알림 리스트 조회
	public List<NtcnVO> allNtcnList(int empno) throws SQLException;
	
	// 알림 확인 체크
	public void chkNtcn(String ntcnNo) throws SQLException;
	
	// 알림 삭제
	public void deleteNtcn(String ntcnNo) throws SQLException;
	public void deleteNtcnRcver(String ntcnNo) throws SQLException;
	
}
