package kr.or.gw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dao.CodeDAO;
import kr.or.gw.dto.CodeVO;

public class CodeServiceImpl implements CodeService{

	private CodeDAO codeDAO;
	public void setCodeDAO(CodeDAO codeDAO) {
		this.codeDAO = codeDAO;
	}
	
	@Override
	public List<CodeVO> getCodeList(String code_cl) throws SQLException {
		
		List<CodeVO> codeList =  codeDAO.selectCodeByCodeCl(code_cl);
		
		return codeList;
	}

	@Override
	public String selectCodeNoByDc(String code_dc) throws SQLException {
		String codeNo = codeDAO.selectCodeNoByDc(code_dc);
		return codeNo;
	}
	
}
