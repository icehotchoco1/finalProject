package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.basicCriteria;
import kr.or.gw.dto.BbsNtbdVO;

public interface NoticeDAO {
	
	List<BbsNtbdVO> selectSearchNoticeList(basicCriteria cri) throws SQLException;

	int selectSearchNoticeListCount(basicCriteria cri) throws SQLException;

	BbsNtbdVO selectNoticeByNno(String bbsctt_no) throws SQLException;

	void insertNotice(BbsNtbdVO notice) throws SQLException;

	void updateNotice(BbsNtbdVO notice) throws SQLException;

	void deleteNotice(String bbsctt_no) throws SQLException;

	// 조회수 증가
	void increaseViewCnt(String bbsctt_no) throws SQLException;

	// seq.nextval 가져오기
	String selectNoticeSequenceNextValue() throws SQLException;
}
