package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.tempstorageCriteria;
import kr.or.gw.dto.EccstSanctnMngtVO;

public class EscMngtDAOImpl implements EscMngtDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}

	@Override
	public List<EccstSanctnMngtVO> selectSearchEscMngtList(tempstorageCriteria cri, int empno) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("keyword", cri.getKeyword());
		param.put("erfType", cri.getErfType());
		param.put("searchType", cri.getSearchType());
		param.put("empno", empno);
		
		List<EccstSanctnMngtVO> escMngtList = session.selectList("EscMngt-Mapper.selectSearchEscMngtList", param, rowBounds);
		
		return escMngtList;
	}

	@Override
	public int selectSearchEscMngtListCount(tempstorageCriteria cri, int empno) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("keyword", cri.getKeyword());
		param.put("erfType", cri.getErfType());
		param.put("searchType", cri.getSearchType());
		param.put("empno", empno);
		
		int count = session.selectOne("EscMngt-Mapper.selectSearchEscMngtListCount", param);
		return count;
	}

	@Override
	public EccstSanctnMngtVO selectEscMngtByNo(String sanctn_no) throws SQLException {
		EccstSanctnMngtVO escMngt = session.selectOne("EscMngt-Mapper.selectEscMngtByNo", sanctn_no);
		return escMngt;
	}

	@Override
	public void updateEscMngt(EccstSanctnMngtVO EscMngt) throws SQLException {
		session.update("EscMngt-Mapper.updateEscMngt", EscMngt);
	}

	@Override
	public void deleteEscMngt(String sanctn_no) throws SQLException {
		session.update("EscMngt-Mapper.deleteEscMngt", sanctn_no);
	}

	@Override
	public EccstSanctnMngtVO selectEscMngtPlusErf(String sanctn_no) throws SQLException {
		
		EccstSanctnMngtVO escMngt = session.selectOne("EscMngt-Mapper.selectEscMngtPlusErf", sanctn_no);
		return escMngt;
	}

	@Override
	public List<EccstSanctnMngtVO> selectEscMngtList() throws SQLException {
		List<EccstSanctnMngtVO> escMngtList = session.selectList("EscMngt-Mapper.selectEscMngtList");
		return escMngtList;
	}
	
	@Override
	public EccstSanctnMngtVO selectEscMngtVacByNo(String sanctn_no) throws SQLException {
		EccstSanctnMngtVO escMngt = session.selectOne("EscMngt-Mapper.selectEscMngtVacByNo", sanctn_no);
		return escMngt;
	}

}
