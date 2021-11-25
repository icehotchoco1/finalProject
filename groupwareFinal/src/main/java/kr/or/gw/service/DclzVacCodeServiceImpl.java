package kr.or.gw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dao.DclzVacCodeDAO;
import kr.or.gw.dto.DclzVacCodeVO;

public class DclzVacCodeServiceImpl implements DclzVacCodeService{
	
	private DclzVacCodeDAO dclzVacCodeDAO;
	public void setDclzVacCodeDAO(DclzVacCodeDAO dclzVacCodeDAO) {
		this.dclzVacCodeDAO = dclzVacCodeDAO;
	}
	

	@Override
	public List<DclzVacCodeVO> getVacCodeList() throws SQLException {
		List<DclzVacCodeVO> vacList = dclzVacCodeDAO.selectVacCodeList();
		
		return vacList;
	}

}
