package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.ApprovalAdboxCriteria;
import kr.or.gw.dto.EccstSanctnMngtVO;

public class ApprovalAdboxDAOImpl implements ApprovalAdboxDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<EccstSanctnMngtVO> eccRequestList(ApprovalAdboxCriteria cri, int empno) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("ipcrcode", cri.getIpcrcode());
		param.put("formnm", cri.getFormnm());
		param.put("empno", empno);

		List<EccstSanctnMngtVO> eccRequestList = session.selectList("ApprovalAdbox-Mapper.eccRequestList", param,
				rowBounds);
		return eccRequestList;
	}

	@Override
	public int selecteccRequestListCount(ApprovalAdboxCriteria cri, int empno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();

		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("ipcrcode", cri.getIpcrcode());
		param.put("formnm", cri.getFormnm());
		param.put("empno", empno);

		int count = session.selectOne("ApprovalAdbox-Mapper.selecteccRequestListCount", param);

		return count;
	}

	@Override
	public List<EccstSanctnMngtVO> eccRejectList(ApprovalAdboxCriteria cri, int empno) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("ipcrcode", cri.getIpcrcode());
		param.put("formnm", cri.getFormnm());
		param.put("empno", empno);

		List<EccstSanctnMngtVO> eccRejectList = session.selectList("ApprovalAdbox-Mapper.eccRejectList", param,
				rowBounds);
		return eccRejectList;
	}

	@Override
	public List<EccstSanctnMngtVO> eccCompletionList(ApprovalAdboxCriteria cri, int empno) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("ipcrcode", cri.getIpcrcode());
		param.put("formnm", cri.getFormnm());
		param.put("empno", empno);

		List<EccstSanctnMngtVO> eccCompletionList = session.selectList("ApprovalAdbox-Mapper.eccCompletionList", param,
				rowBounds);
		return eccCompletionList;
	}

	@Override
	public List<EccstSanctnMngtVO> eccWaitList(ApprovalAdboxCriteria cri, int empno) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> param = new HashMap<String, Object>();

		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("ipcrcode", cri.getIpcrcode());
		param.put("formnm", cri.getFormnm());
		param.put("empno", empno);

		List<EccstSanctnMngtVO> eccWaitList = session.selectList("ApprovalAdbox-Mapper.eccWaitList", param, rowBounds);
		return eccWaitList;
	}

	@Override
	public int selecteccRejectListCount(ApprovalAdboxCriteria cri, int empno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();

		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("ipcrcode", cri.getIpcrcode());
		param.put("formnm", cri.getFormnm());
		param.put("empno", empno);

		int count = session.selectOne("ApprovalAdbox-Mapper.selecteccRejectListCount", param);

		return count;
	}

	@Override
	public int selecteccCompletionListCount(ApprovalAdboxCriteria cri, int empno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();

		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("ipcrcode", cri.getIpcrcode());
		param.put("formnm", cri.getFormnm());
		param.put("empno", empno);

		int count = session.selectOne("ApprovalAdbox-Mapper.selecteccCompletionListCount", param);

		return count;
	}

	@Override
	public int selecteccWaitListCount(ApprovalAdboxCriteria cri, int empno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();

		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("ipcrcode", cri.getIpcrcode());
		param.put("formnm", cri.getFormnm());
		param.put("empno", empno);

		int count = session.selectOne("ApprovalAdbox-Mapper.selecteccWaitListCount", param);

		return count;
	}

}
