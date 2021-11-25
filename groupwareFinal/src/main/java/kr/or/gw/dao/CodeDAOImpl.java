package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.gw.dto.CodeVO;

public class CodeDAOImpl implements CodeDAO{
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	
	@Override
	public List<CodeVO> selectCodeByCodeCl(String code_cl) throws SQLException {
		
		List<CodeVO> selectCodeByCodeCl = session.selectList("Code-Mapper.selectCodeByCodeCl",code_cl);
		
		return selectCodeByCodeCl;
	}


	@Override
	public String selectCodeNoByDc(String code_dc) throws SQLException {
		String codeNo = session.selectOne("Code-Mapper.selectCodeNoByDc", code_dc);
		return codeNo;
	}

}
