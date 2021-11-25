package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.basicCriteria;
import kr.or.gw.dto.BbsMngtbdVO;

public interface MngtDAO {

	List<BbsMngtbdVO> selectMngtCriteria(basicCriteria cri) throws SQLException;

	int selectMngtCriteriaTotalCount(basicCriteria cri) throws SQLException;

	BbsMngtbdVO selectMngtByBbscttNo(String bbsctt_no) throws SQLException;

	void insertMngt(BbsMngtbdVO mngt) throws SQLException;

	void updateMngt(BbsMngtbdVO mngt) throws SQLException;

	void deleteMngt(String bbsctt_no) throws SQLException;

	// viewcnt 증가
	void increaseViewCnt(String bbsctt_no) throws SQLException;

	// mngt_seq.nextval 가져오기
	String selectMngtSeqNext() throws SQLException;
}
