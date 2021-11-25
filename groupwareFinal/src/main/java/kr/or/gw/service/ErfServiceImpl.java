package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.dao.ErfDAO;
import kr.or.gw.dto.EccstRegstrFormVO;

public class ErfServiceImpl implements ErfService {

	private ErfDAO erfDAO;
	public void setErfDAO(ErfDAO erfDAO) {
		this.erfDAO = erfDAO;
	}
	
	@Override
	public Map<String, Object> getErfList() throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<EccstRegstrFormVO> erfList = erfDAO.selectErf();
		
		dataMap.put("erfList", erfList);
		
		return dataMap;
	}

	@Override
	public EccstRegstrFormVO getErf(String form_no) throws SQLException {
		
		EccstRegstrFormVO erf = erfDAO.selectErfByErfno(form_no);
		
		return erf;
	}

	@Override
	public void regist(EccstRegstrFormVO erf) throws SQLException {
		String form_no = erfDAO.selectErfSeqNext();
		
		erf.setForm_no(form_no);
		
		erfDAO.insertErf(erf);
	}

}
