package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.BbsCmpnyDsptchVO;

public interface NewsService {
	
	// 목록조회	
	Map<String,Object> getNewsList(SearchCriteria cri)throws SQLException;
	
	// 상세보기
	BbsCmpnyDsptchVO getNews(String bbsctt_no)throws SQLException;	
	BbsCmpnyDsptchVO getNewsForModify(String bbsctt_no)throws SQLException;
		
	// 등록
	void regist(BbsCmpnyDsptchVO news)throws SQLException;
		
	// 수정
	void modify(BbsCmpnyDsptchVO news)throws SQLException;
	
	// 삭제
	void remove(String bbsctt_no)throws SQLException;
	
	//첨부파일 추가
	AtchMnflVO getAttachByFileNo(String file_no)throws SQLException;
	
	void removeAttachByFileNo(String file_no)throws  SQLException;
}
