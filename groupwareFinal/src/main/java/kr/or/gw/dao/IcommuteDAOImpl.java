package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.gw.dto.DclzComVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public class IcommuteDAOImpl implements IcommuteDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<OrgnztEmpMngtVO> selectIcommuteList(Map<String, String> paramMap) throws SQLException {

		List<OrgnztEmpMngtVO> icomlist = session.selectList("Icommute-Mapper.selectIcommuteList", paramMap);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + icomlist.size());
		return icomlist;
	}

	@Override
	public List<OrgnztEmpMngtVO> selectEmpInfo(int empno) throws SQLException {
		List<OrgnztEmpMngtVO> empList = session.selectList("Icommute-Mapper.selectIcommuteEmpList",empno);
		return empList;
	}

}