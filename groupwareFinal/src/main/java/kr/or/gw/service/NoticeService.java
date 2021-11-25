package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.basicCriteria;
import kr.or.gw.command.basicPageMaker;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.BbsNtbdVO;

public interface NoticeService {

	// 리스트 조회
	Map<String, Object> getNoticeList(basicCriteria cri) throws SQLException;
	
	// 상세보기
	BbsNtbdVO getNotice(String bbsctt_no) throws SQLException;
	
	// 수정화면 상세보기
	BbsNtbdVO getNoticeForModify(String bbsctt_no) throws SQLException;
	
	// 등록
	void regist(BbsNtbdVO notice) throws SQLException;
	
	// 수정
	void modify(BbsNtbdVO notice) throws SQLException;
	
	// 삭제
	void remove(String bbsctt_no) throws SQLException;

	// 파일
	AtchMnflVO getAttachByFileNo(String file_no)throws SQLException;
	
	void removeAttachByFileNo(String file_no)throws  SQLException;
}
