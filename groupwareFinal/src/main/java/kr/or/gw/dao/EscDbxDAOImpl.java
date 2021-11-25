package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.EscDbxCriteria;
import kr.or.gw.dto.EccstDbxVO;
import kr.or.gw.dto.EccstSanctnMngtVO;

public class EscDbxDAOImpl implements EscDbxDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	//수신 참조함
	@Override
	public List<EccstSanctnMngtVO> selectRdRcvList(EscDbxCriteria cri, int rec_empno) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		Map<String,Object> param = new HashMap<String, Object>();
		
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("ipcrcode", cri.getIpcrcode());
		param.put("formnm", cri.getFormnm());
		param.put("rec_empno", rec_empno);
		
		List<EccstSanctnMngtVO> rdrcvList=
				session.selectList("EscDbx-Mapper.selectRdRcvList",param,rowBounds);
		
		return rdrcvList;
	}
	
	@Override
	public int selectRdRcvListCount(EscDbxCriteria cri, int rec_empno) throws SQLException {
		Map<String,Object> param = new HashMap<String, Object>();
		
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("ipcrcode", cri.getIpcrcode());
		param.put("formnm", cri.getFormnm());
		param.put("rec_empno", rec_empno);
		
		int count=session.selectOne("EscDbx-Mapper.selectRdRcvListCount",param);
		return count;
	}
	
	//발신 참조함
	@Override
	public List<EccstSanctnMngtVO> selectRdSendList(EscDbxCriteria cri, int empno) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		Map<String,Object> param = new HashMap<String, Object>();
		
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("ipcrcode", cri.getIpcrcode());
		param.put("formnm", cri.getFormnm());
		param.put("empno", empno);
		
		
		List<EccstSanctnMngtVO> rdsendList=
				session.selectList("EscDbx-Mapper.selectRdSendList",param,rowBounds);
		
		return rdsendList;
	}
	
	@Override
	public int selectRdSendListCount(EscDbxCriteria cri, int empno) throws SQLException {
		Map<String,Object> param = new HashMap<String, Object>();
		
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("ipcrcode", cri.getIpcrcode());
		param.put("formnm", cri.getFormnm());
		param.put("empno", empno);
		
		int count=session.selectOne("EscDbx-Mapper.selectRdSendListCount",param);
		return count;
	}

	@Override
	public int selectSeqNextVal() throws SQLException {
		int seq = session.selectOne("EscDbx-Mapper.selectSeqNextVal");
		return seq;
	}

	@Override
	public void insertDbx(EccstDbxVO escDbxVO) throws SQLException {
		session.update("EscDbx-Mapper.insertDbx",escDbxVO);
	}

	@Override
	public List<EccstDbxVO> selecRefferers(String Sacntn_no) throws SQLException {
		List<EccstDbxVO> refList = session.selectList("EscDbx-Mapper.selecRefferers",Sacntn_no);
		return refList;
	}

	@Override
	public void deleteDbx(String sanctn_no) throws SQLException {
		session.update("EscDbx-Mapper.deleteDbx",sanctn_no);
	}
	
}
