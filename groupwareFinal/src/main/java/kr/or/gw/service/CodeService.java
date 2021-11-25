package kr.or.gw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dto.CodeVO;

public interface CodeService {
	List<CodeVO> getCodeList(String code_cl) throws SQLException;
	String selectCodeNoByDc(String code_dc) throws SQLException;
}
