package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.VacCriteria;
import kr.or.gw.dto.DclzVacVO;

public class DclzVacDAOImpl implements DclzVacDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<DclzVacVO> selectVacList(VacCriteria cri, int empno) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String,Object> param = new HashMap<String, Object>();
		
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("empno",empno);
		
		List<DclzVacVO> vacList = session.selectList("DclzVac-Mapper.selectVacList", param, rowBounds);
		return vacList;
	}
	@Override
	public int selectVacListCount(VacCriteria cri, int empno) throws SQLException {
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("empno",empno);
		
		int count = session.selectOne("DclzVac-Mapper.selectVacListCount", param);
		return count;
	}
	@Override
	public DclzVacVO selectVac(String vcatn_no) throws SQLException {
		DclzVacVO vac = session.selectOne("DclzVac-Mapper.selectVac", vcatn_no);
		return vac;
	}
	@Override
	public void insertVac(DclzVacVO vac) throws SQLException {
		session.update("DclzVac-Mapper.insertVac", vac);
	}
	@Override
	public void updateVac(DclzVacVO vac) throws SQLException {
		session.update("DclzVac-Mapper.updateVac", vac);
	}
	@Override
	public String selectVacSeqNextValue() throws SQLException {
		String seqNum = "dvac"+session.selectOne("DclzVac-Mapper.selectVacSeqNextValue");
		return seqNum;
	}

	@Override
	public List<DclzVacVO> selectDeptVacList(VacCriteria cri, int empno) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String,Object> param = new HashMap<String, Object>();
		
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("empno",empno);
		
		List<DclzVacVO> deptVacList = session.selectList("DclzVac-Mapper.selectDeptVacList", param, rowBounds);
		return deptVacList;
	}

	@Override
	public int selectDeptVacListCount(VacCriteria cri, int empno) throws SQLException {
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("empno",empno);
		
		int count = session.selectOne("DclzVac-Mapper.selectDeptVacListCount", param);
		return count;
	}

	@Override
	public Float selectsumUseVac(int empno) throws SQLException {
		Float f = session.selectOne("DclzVac-Mapper.selectsumUseVac",empno);
		return f;
	}
	

}
