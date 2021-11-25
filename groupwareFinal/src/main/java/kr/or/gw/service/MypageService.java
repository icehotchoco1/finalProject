package kr.or.gw.service;

import java.sql.SQLException;

import kr.or.gw.dto.DclzMngtVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public interface MypageService {
//	Map<String, String> selectCodeDcbyCodeNo(String code_cl) throws SQLException;
	String selectCodeDcbyCodeNo(String code_cl) throws SQLException;

	// 출퇴근 시간 조회
	public DclzMngtVO selectCheckInOutTime(int empno) throws SQLException;

	// 회원정보수정
	void modify(OrgnztEmpMngtVO emp) throws SQLException;

	// 회원 정보 조회
	public OrgnztEmpMngtVO selectEmp(int empno) throws SQLException;

	// 비밀번호 수정
	void pwModify(OrgnztEmpMngtVO emp) throws SQLException;

	// 지각 count 조회
	public int selectDclzMngtLateCount(int empno) throws SQLException;

	// 결근 count 조회
	public int selectDclzMngtAbsentCount(int empno) throws SQLException;

	// 조퇴 count 조회
	public int selectDclzMngtEarlieCkOutCount(int empno) throws SQLException;

	// 퇴근미체크 count 조회
	public int selectDclzMngtMissingCount(int empno) throws SQLException;

	// 정상출근일수 count 조회
	public int selectDclzMngtWorkingDayCount(int empno) throws SQLException;

	// 당 월 근무시간 조회
	public String selectDclzMngtWorkingHrs(int empno) throws SQLException;

	// 이번달 오늘까지 근무 예정 일수
	public int selectWorkingDayCnt() throws SQLException;

	// 연차별 총 발생휴가 갯수
	public int selectTotVacCnt(int empno) throws SQLException;

	// 올해 총 사용 휴가 일수
	public int selectTotUsedVacDays(int empno) throws SQLException;

	// 올해 총 사용 반차 일수
	public int selectUsedHalfDayoffDays(int empno) throws SQLException;

	// 올해 총 사용 병가 일수
	public int selectUsedSickDayoffDays(int empno) throws SQLException;

	// 올해 총 사용 연차 일수
	public int selectUsedDayoffDays(int empno) throws SQLException;
}
