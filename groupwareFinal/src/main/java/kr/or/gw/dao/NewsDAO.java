package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.BbsCmpnyDsptchVO;

public interface NewsDAO {
	
	List<BbsCmpnyDsptchVO> selectNewsCriteria(SearchCriteria cri) throws SQLException;

	int selectNewsCriteriaTotalCount(SearchCriteria cri) throws SQLException;

	BbsCmpnyDsptchVO selectNewsByBbscttno(String bbsctt_no) throws SQLException;

	void insertNews(BbsCmpnyDsptchVO news) throws SQLException;

	void updateNews(BbsCmpnyDsptchVO news) throws SQLException;

	void deleteNews(String bbsctt_no) throws SQLException;

	// viewcnt 증가
	void increaseViewCnt(String bbsctt_no) throws SQLException;

	// news_seq.nextval 가져오기
	String selectNewsSeqNext() throws SQLException;
}
