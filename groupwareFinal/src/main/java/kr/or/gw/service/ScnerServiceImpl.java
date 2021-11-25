package kr.or.gw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dao.ScnerDAO;
import kr.or.gw.dto.EccstSanctnerVO;

public class ScnerServiceImpl implements ScnerService {
	
	private ScnerDAO scnerDAO;
	public void setScnerDAO(ScnerDAO scnerDAO) {
		this.scnerDAO = scnerDAO;
	}
	
	@Override
	public int selectSeqNextVal() throws SQLException {
		int seq = scnerDAO.selectSeqNextVal();
		return seq;
	}

	@Override
	public void insertSanctners(EccstSanctnerVO scnerVO) throws SQLException {
		int seq = scnerDAO.selectSeqNextVal();
		String sanctner_no = "sncn"+seq;
		scnerVO.setSanctner_no(sanctner_no);
		
		scnerDAO.insertSanctners(scnerVO);
	}

	@Override
	public List<EccstSanctnerVO> selectSanctners(String sanctn_no) throws SQLException {
		List<EccstSanctnerVO> scnerList = scnerDAO.selectSanctners(sanctn_no);
		return scnerList;
	}

	@Override
	public void updateSanctner(EccstSanctnerVO scnerVO) throws SQLException {
		scnerDAO.updateSanctner(scnerVO);
	}

	@Override
	public void deleteSanctners(String sanctn_no) throws SQLException {
		scnerDAO.deleteSanctners(sanctn_no);
	}

	@Override
	public int selectMaxLineNo(String sanctn_no) throws SQLException {
		int max = scnerDAO.selectMaxLineNo(sanctn_no);
		
		return max;
	}

	@Override
	public void updateAllConfirmAt(EccstSanctnerVO scnerVO) throws SQLException {
		scnerDAO.updateAllConfirmAt(scnerVO);
	}

	@Override
	public void updateNextSanctner(EccstSanctnerVO scnerVO) throws SQLException {
		scnerDAO.updateNextSanctner(scnerVO);
	}

	@Override
	public int selectLineNobySanctnNo(EccstSanctnerVO scnerVO) throws SQLException {
		int lnno = scnerDAO.selectLineNobySanctnNo(scnerVO);
		return lnno;
	}

}
