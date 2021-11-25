package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.DclzComVO;
import kr.or.gw.dto.DclzMngtVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public class DclzDAOImpl implements DclzDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	@Override
	public List<DclzMngtVO> selectListDclz(int empno) throws SQLException {
		List<DclzMngtVO> dclzList = session.selectList("Dclz-Mapper.selectListDclz",empno);
		return dclzList;
	}
	@Override
	public List<DclzMngtVO> selectDclzCount(int empno) throws SQLException {
		List<DclzMngtVO> dclzList = session.selectList("Dclz-Mapper.selectDclzCount",empno);
		return dclzList;
	}
	@Override
	public List<OrgnztEmpMngtVO> selectDclzList(Map<String, String> paramMap) throws SQLException {
		List<OrgnztEmpMngtVO> dclzLists = session.selectList("Dclz-Mapper.selectDclzList",paramMap);
		return dclzLists;
	}
	@Override
	public List<DclzMngtVO> selectDclzDayCount(int empno) throws SQLException {
		List<DclzMngtVO> dclzList = session.selectList("Dclz-Mapper.selectDclzDayCount",empno);
		return dclzList;
	}
	@Override
	public List<DclzMngtVO> selectDclzTotalTime(int empno) throws SQLException {
		List<DclzMngtVO> dclzList = session.selectList("Dclz-Mapper.selectDclzTotalTime",empno);
		return dclzList;
	}
	@Override
	public List<DclzMngtVO> selectChart(int empno) throws SQLException {
		List<DclzMngtVO> dclzList = session.selectList("Dclz-Mapper.selectChart",empno);
		return dclzList;
	}
	@Override
	public List<DclzMngtVO> selectMonth() throws SQLException {
		List<DclzMngtVO> dclzList = session.selectList("DclzCom-Mapper.selectMonth");
		return dclzList;
	}
	@Override
	public List<DclzComVO> selectDeptInfo() throws SQLException {
		List<DclzComVO> dclzComList = session.selectList("DclzCom-Mapper.selectDeptInfo");
		return dclzComList;
	}
	@Override
	public List<DclzComVO> selectOneCha() throws SQLException {
		List<DclzComVO> dclzComList = session.selectList("DclzCom-Mapper.selectOneCha");
		return dclzComList;
	}
	@Override
	public List<DclzComVO> selectTwoCha() throws SQLException {
		List<DclzComVO> dclzComList = session.selectList("DclzCom-Mapper.selectTwoCha");
		return dclzComList;
	}
	@Override
	public List<DclzComVO> selectThreeCha() throws SQLException {
		List<DclzComVO> dclzComList = session.selectList("DclzCom-Mapper.selectThreeCha");
		return dclzComList;
	}
	@Override
	public List<DclzComVO> selectFourCha() throws SQLException {
		List<DclzComVO> dclzComList = session.selectList("DclzCom-Mapper.selectFourCha");
		return dclzComList;
	}
	@Override
	public List<DclzComVO> selectFiveCha() throws SQLException {
		List<DclzComVO> dclzComList = session.selectList("DclzCom-Mapper.selectFiveCha");
		return dclzComList;
	}
	@Override
	public List<DclzMngtVO> selectFrontBack(int empno) throws SQLException {
		List<DclzMngtVO> dclzList = session.selectList("Dclz-Mapper.selectbackfront",empno);
		return dclzList;
	}
	@Override
	public List<DclzMngtVO> selectTopcommute(int empno) throws SQLException {
		List<DclzMngtVO> dclzList = session.selectList("Dclz-Mapper.selecttopcommute",empno);
		return dclzList;
	}
	
	@Override
	public List<DclzMngtVO> getLateList(SearchCriteria cri, int empno) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String,Object> param = new HashMap<String, Object>();
		
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("empno",empno);
		
		List<DclzMngtVO> dclzLateList = session.selectList("Dclz-Mapper.getLateList", param, rowBounds);
		return dclzLateList;
	}
	@Override
	public int getLateListCount(SearchCriteria cri, int empno) throws SQLException {
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("empno",empno);
		
		int count = session.selectOne("Dclz-Mapper.getLateListCount", param);
		return count;
	}
	@Override
	public void updateDclzMngtbyEmpno(DclzMngtVO dclz) throws SQLException {
		session.update("Dclz-Mapper.updateDclzMngtbyEmpno",dclz);
	}


}
