package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.command.basicCriteria;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.BbsMngtbdVO;

public interface MngtService {
	
	// 목록조회	
	Map<String,Object> getMngtList(basicCriteria cri)throws SQLException;
	
	// 상세보기
	BbsMngtbdVO getMngt(String bbsctt_no)throws SQLException;	
	BbsMngtbdVO getMngtForModify(String bbsctt_no)throws SQLException;
		
	// 등록
	void regist(BbsMngtbdVO mngt)throws SQLException;
		
	// 수정
	void modify(BbsMngtbdVO mngt)throws SQLException;
	
	// 삭제
	void remove(String bbsctt_no)throws SQLException;
	
	AtchMnflVO getAttachByFileNo(String file_no)throws SQLException;
	
	void removeAttachByFileNo(String file_no)throws  SQLException;
}
