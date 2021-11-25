package kr.or.gw.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import kr.or.gw.dto.BbsNtbdVO;
import kr.or.gw.dto.DclzMngtVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public class MypageDAOImpl implements MypageDAO {
	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public String selectCodeDcbyCodeNo(String code_no) throws SQLException {
		String code_dc = session.selectOne("Mypage-Mapper.selectCodeDcbyCodeNo", code_no);
		return code_dc;
	}

	@Override
	public DclzMngtVO selectCheckInOutTime(int empno) throws SQLException {
		DclzMngtVO dclzMngt = session.selectOne("Mypage-Mapper.selectCheckInOutTime", empno);

		return dclzMngt;
	}

	@Override
	public void modifyEmp(OrgnztEmpMngtVO emp) throws SQLException {
		session.update("Mypage-Mapper.modifyEmp", emp);
	}

	@Override
	public OrgnztEmpMngtVO selectEmp(int empno) throws SQLException {
		OrgnztEmpMngtVO emp = session.selectOne("Mypage-Mapper.selectEmp", empno);
		return emp;
	}

	@Override
	public void pwModify(OrgnztEmpMngtVO emp) throws SQLException {
		session.update("Mypage-Mapper.pwModify", emp);
	}

	@Override
	public int selectDclzMngtLateCount(int empno) throws SQLException {
		int dclzLateCnt = session.selectOne("Mypage-Mapper.selectDclzMngtLateCount", empno);
		return dclzLateCnt;
	}

	@Override
	public int selectDclzMngtAbsentCount(int empno) throws SQLException {
		int dclzAbsentCnt = session.selectOne("Mypage-Mapper.selectDclzMngtAbsentCount", empno);
		return dclzAbsentCnt;
	}

	@Override
	public int selectDclzMngtEarlieCkOutCount(int empno) throws SQLException {
		int dclzECkOutCnt = session.selectOne("Mypage-Mapper.selectDclzMngtEarlieCkOutCount", empno);
		return dclzECkOutCnt;
	}

	@Override
	public int selectDclzMngtMissingCount(int empno) throws SQLException {
		int dclzMissingCnt = session.selectOne("Mypage-Mapper.selectDclzMngtMissingCount", empno);
		return dclzMissingCnt;
	}

	@Override
	public String selectDclzMngtWorkingHrs(int empno) throws SQLException {
		String hrsString = session.selectOne("Mypage-Mapper.selectDclzMngtWorkingHrs", empno);
		return hrsString;
	}

	@Override
	public int selectDclzMngtWorkingDayCount(int empno) throws SQLException {
		int workingDay = session.selectOne("Mypage-Mapper.selectDclzMngtWorkingDayCount", empno);
		return workingDay;
	}

	@Override
	public int selectWorkingDayCnt() throws SQLException {
		int workingDay = session.selectOne("Mypage-Mapper.selectWorkingDayCnt");
		return workingDay;
	}

	@Override
	public int selectTotVacCnt(int empno) throws SQLException {
		int totVacCnt = session.selectOne("Mypage-Mapper.selectTotVacCnt", empno);
		return totVacCnt;
	}

	@Override
	public int selectTotUsedVacDays(int empno) throws SQLException {
		Integer totUsedVacDays = session.selectOne("Mypage-Mapper.selectTotUsedVacDays", empno);
		if (totUsedVacDays == null) {
			totUsedVacDays = 0;
		}
		return totUsedVacDays;
	}

	@Override
	public int selectUsedHalfDayoffDays(int empno) throws SQLException {
		Integer totUsedHalfDayOffDays = session.selectOne("Mypage-Mapper.selectUsedHalfDayoffDays", empno);
		if (totUsedHalfDayOffDays == null) {
			totUsedHalfDayOffDays = 0;
		}
		return totUsedHalfDayOffDays;
	}

	@Override
	public int selectUsedSickDayoffDays(int empno) throws SQLException {
		Integer totUsedSickDayOff = session.selectOne("Mypage-Mapper.selectUsedSickDayoffDays", empno);
		if (totUsedSickDayOff == null) {
			totUsedSickDayOff = 0;
		}
		return totUsedSickDayOff;
	}

	@Override
	public int selectUsedDayoffDays(int empno) throws SQLException {
		Integer totUsedDayOff = session.selectOne("Mypage-Mapper.selectUsedDayoffDays", empno);
		if (totUsedDayOff == null) {
			totUsedDayOff = 0;
		}
		return totUsedDayOff;
	}

}
