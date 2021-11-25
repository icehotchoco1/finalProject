package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.basicCriteria;
import kr.or.gw.dto.SchdulMngtVO;

public class SchDAOImpl implements SchDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public List<SchdulMngtVO> selectSearchSchList(int empno) throws SQLException {
		
		
		List<SchdulMngtVO> schList =
				session.selectList("SchMngt-Mapper.schmList", empno);
		
		return schList;
	}

/*	@Override
	public int selectSearchSchListCount(SearchCriteria cri) throws SQLException {
		
		int count = session.selectOne("SchMngt-Mapper.selectSearchSchListCount", cri);
		
		return count;
	}*/
	@Override
	public void updateScheduleByDrag(SchdulMngtVO sch) throws SQLException {
		session.update("SchMngt-Mapper.updateScheduleByDrag",sch);
		
	}

	@Override
	public SchdulMngtVO selectSchBySchdul_no(String schdul_no) throws SQLException {
		
		SchdulMngtVO sch = session.selectOne("SchMngt-Mapper.selectSchBySchdul_no", schdul_no);
		
		return sch;
	}

	@Override
	public void insertSch(SchdulMngtVO sch) throws SQLException {
		session.update("SchMngt-Mapper.insertSch", sch);
	}

	@Override
	public void updateSch(SchdulMngtVO sch) throws SQLException {
		session.update("SchMngt-Mapper.updateSch", sch);
	}

	@Override
	public void deleteSch(String schdul_no) throws SQLException {
		session.update("SchMngt-Mapper.deleteSch", schdul_no);
	}



	@Override
	public String selectSchmSeqNext() throws SQLException {
		
		String seqNum =
				"schd"+session.selectOne("SchMngt-Mapper.selectSchmSeqNext");
		
		return seqNum;
	}


	@Override
	public List<SchdulMngtVO> selectCompanySchList(int empno) throws SQLException {
		List<SchdulMngtVO> schList =
				session.selectList("SchMngt-Mapper.selectCompany", empno);
		return schList;
	
	}


	@Override
	public List<SchdulMngtVO> selectDday(basicCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<SchdulMngtVO> schList =
				session.selectList("SchMngt-Mapper.selectDday", cri, rowBounds);
		return schList;
	}


	@Override
	public int selectDdayCount(basicCriteria cri) throws SQLException {
		
		int count = session.selectOne("SchMngt-Mapper.selectDdayCount", cri);
		return count;
	}

}
