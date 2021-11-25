package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.basicCriteria;
import kr.or.gw.dto.BbsNtbdVO;

public class NoticeDAOImpl implements NoticeDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public List<BbsNtbdVO> selectSearchNoticeList(basicCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<BbsNtbdVO> noticeList =
				session.selectList("Notice-Mapper.selectSearchNoticeList", cri, rowBounds);
		
		return noticeList;
	}

	@Override
	public int selectSearchNoticeListCount(basicCriteria cri) throws SQLException {
		
		int count = session.selectOne("Notice-Mapper.selectSearchNoticeListCount", cri);
		
		return count;
	}

	@Override
	public BbsNtbdVO selectNoticeByNno(String bbsctt_no) throws SQLException {
		
		BbsNtbdVO notice = session.selectOne("Notice-Mapper.selectNoticeByNno", bbsctt_no);
		
		return notice;
	}

	@Override
	public void insertNotice(BbsNtbdVO notice) throws SQLException {
		session.update("Notice-Mapper.insertNotice", notice);
	}

	@Override
	public void updateNotice(BbsNtbdVO notice) throws SQLException {
		session.update("Notice-Mapper.updateNotice", notice);
	}

	@Override
	public void deleteNotice(String bbsctt_no) throws SQLException {
		session.update("Notice-Mapper.deleteNotice", bbsctt_no);
	}

	@Override
	public void increaseViewCnt(String bbsctt_no) throws SQLException {
		session.update("Notice-Mapper.increaseViewCnt", bbsctt_no);
	}

	@Override
	public String  selectNoticeSequenceNextValue() throws SQLException {
		
		String  seqNum = "ntbd" + 
				session.selectOne("Notice-Mapper.selectNoticeSequenceNextValue");
		
		return seqNum;
	}

}
