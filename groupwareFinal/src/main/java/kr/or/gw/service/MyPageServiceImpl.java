package kr.or.gw.service;

import java.sql.SQLException;

import kr.or.gw.dao.MypageDAO;
import kr.or.gw.dto.DclzMngtVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public class MyPageServiceImpl implements MypageService {

	private MypageDAO mypageDAO;

	public void setMypageDAO(MypageDAO mypageDAO) {
		this.mypageDAO = mypageDAO;
	}

	/*
	 * @Override public String selectCodeDcbyCodeNo(String code_no) throws
	 * SQLException { String code_dc = mypageDAO.selectCodeDcbyCodeNo(code_no);
	 * return code_dc; }
	 */

	/*
	 * @Override public Map<String, String> selectCodeDcbyCodeNo(String code_no)
	 * throws SQLException { Map<String, String> dataMap = new HashMap<String,
	 * String>();
	 * 
	 * String codeDc = mypageDAO.selectCodeDcbyCodeNo(code_no);
	 * System.out.println(codeDc);
	 * 
	 * dataMap.put("codeDc", codeDc);
	 * 
	 * return dataMap; }
	 */

	@Override
	public String selectCodeDcbyCodeNo(String code_no) throws SQLException {

		String codeDc = mypageDAO.selectCodeDcbyCodeNo(code_no);
//		System.out.println(codeDc);

		return codeDc;
	}

	// 출퇴근 시간 조회
	public DclzMngtVO selectCheckInOutTime(int empno) throws SQLException {

		DclzMngtVO dclzMngt = mypageDAO.selectCheckInOutTime(empno);

		return dclzMngt;
	}

	// 회원 정보 수정
	@Override
	public void modify(OrgnztEmpMngtVO emp) throws SQLException {
		mypageDAO.modifyEmp(emp);
	}

	// 회원 정보 조회
	@Override
	public OrgnztEmpMngtVO selectEmp(int empno) throws SQLException {
		OrgnztEmpMngtVO emp = mypageDAO.selectEmp(empno);
		return emp;
	}
	
	// 비밀번호 수정
	@Override
	public void pwModify(OrgnztEmpMngtVO emp) throws SQLException{
		mypageDAO.pwModify(emp);
	}

	// 지각 조회
	@Override
	public int selectDclzMngtLateCount(int empno) throws SQLException {
		int dclzLateCnt = mypageDAO.selectDclzMngtLateCount(empno);
		return dclzLateCnt;
	}

	@Override
	public int selectDclzMngtAbsentCount(int empno) throws SQLException {
		int dclzAbsentCnt = mypageDAO.selectDclzMngtAbsentCount(empno);
		return dclzAbsentCnt;
	}

	@Override
	public int selectDclzMngtEarlieCkOutCount(int empno) throws SQLException {
		int dclzECkOutCnt = mypageDAO.selectDclzMngtEarlieCkOutCount(empno);
		return dclzECkOutCnt;
	}

	@Override
	public int selectDclzMngtMissingCount(int empno) throws SQLException {
		int dclzMissingCnt = mypageDAO.selectDclzMngtMissingCount(empno);
		return dclzMissingCnt;
	}

	@Override
	public int selectDclzMngtWorkingDayCount(int empno) throws SQLException {
		int workingdayCnt = mypageDAO.selectDclzMngtWorkingDayCount(empno);
		return workingdayCnt;
	}

	@Override
	public String selectDclzMngtWorkingHrs(int empno) throws SQLException {
		String workingHrsStr = mypageDAO.selectDclzMngtWorkingHrs(empno);
		return workingHrsStr;
	}

	@Override
	public int selectWorkingDayCnt() throws SQLException {
		int workingdayCnt = mypageDAO.selectWorkingDayCnt();
		return workingdayCnt;
	}

	@Override
	public int selectTotVacCnt(int empno) throws SQLException {
		int totVacCnt = mypageDAO.selectTotVacCnt(empno);
		return totVacCnt;
	}

	@Override
	public int selectTotUsedVacDays(int empno) throws SQLException {
		int totUsedVacDays = mypageDAO.selectTotUsedVacDays(empno);
		return totUsedVacDays;
	}

	@Override
	public int selectUsedHalfDayoffDays(int empno) throws SQLException {
		int totUsedHalfDayOffDays = mypageDAO.selectUsedHalfDayoffDays(empno);
		return totUsedHalfDayOffDays;
	}

	@Override
	public int selectUsedSickDayoffDays(int empno) throws SQLException {
		int totUsedSickDayOff = mypageDAO.selectUsedSickDayoffDays(empno);
		return totUsedSickDayOff;
	}

	@Override
	public int selectUsedDayoffDays(int empno) throws SQLException {
		int totUsedDayOff = mypageDAO.selectUsedDayoffDays(empno);
		return totUsedDayOff;
	}
}
