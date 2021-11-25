package kr.or.gw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dao.NtcnDAO;
import kr.or.gw.dto.JobMngtVO;
import kr.or.gw.dto.NtcnVO;

public class NtcnServiceImpl implements NtcnService {

	private NtcnDAO ntcnDAO;

	public void setNtcnDAO(NtcnDAO ntcnDAO) {
		this.ntcnDAO = ntcnDAO;
	}

	@Override
	public int countNtcnList(int empno) throws SQLException {
		int ntcnCnt = ntcnDAO.countNtcnList(empno);
		return ntcnCnt;
	}

	@Override
	public List<NtcnVO> allNtcnList(int empno) throws SQLException {
		List<NtcnVO> ntcnList = ntcnDAO.allNtcnList(empno);
		return ntcnList;
	}

	@Override
	public void chkNtcn(String ntcnNo) throws SQLException {
		ntcnDAO.chkNtcn(ntcnNo);
	}

	@Override
	public void deleteNtcn(String ntcnNo) throws SQLException {
		ntcnDAO.deleteNtcnRcver(ntcnNo);
		ntcnDAO.deleteNtcn(ntcnNo);
	}
}
