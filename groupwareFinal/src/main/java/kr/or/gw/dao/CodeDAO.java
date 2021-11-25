package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dto.CodeVO;

public interface CodeDAO {
	public List<CodeVO> selectCodeByCodeCl (String code_cl) throws SQLException;
	
	public String selectCodeNoByDc (String code_dc) throws SQLException;
}
