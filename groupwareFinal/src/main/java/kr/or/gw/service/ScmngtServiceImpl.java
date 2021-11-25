package kr.or.gw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dao.AtchDAO;
import kr.or.gw.dao.ScmngtDAO;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.EccstSanctnMngtVO;

public class ScmngtServiceImpl implements ScmngtService {
	
	private ScmngtDAO scmngtDAO;
	public void setScmngtDAO(ScmngtDAO scmngtDAO) {
		this.scmngtDAO = scmngtDAO;
	}
	
	private AtchDAO atchDAO;
	public void setAtchDAO(AtchDAO atchDAO) {
		this.atchDAO = atchDAO;
	}
	
	@Override
	public int selectSeqNextVal() throws SQLException {
		int seq =  scmngtDAO.selectSeqNextVal();
		return seq;
	}

	@Override
	public void FirstRegist(EccstSanctnMngtVO scMngtVO) throws SQLException {

		scmngtDAO.FirstRegist(scMngtVO);
		
		int index=0;
		if(scMngtVO.getAtchList()!=null) {
			for(AtchMnflVO atch: scMngtVO.getAtchList()) {
				atch.setBbsctt_no(scMngtVO.getSanctn_no());
				atch.setAtch_order(index);
				atchDAO.insertAtch(atch);
				index++;
			}
		}
		
	}

	@Override
	public void updateEccst(EccstSanctnMngtVO scMngtVO) throws SQLException {
		scmngtDAO.updateEccst(scMngtVO);
		
		int index = 1+scMngtVO.getAtchList().size();
		if(scMngtVO.getAtchList() != null) {
			for(AtchMnflVO atch : scMngtVO.getAtchList()) {
				atch.setBbsctt_no(scMngtVO.getSanctn_no());
				atch.setAtch_order(index);
				atchDAO.insertAtch(atch);
				index++;
			}
		}
	}

	@Override
	public void returnEccst(EccstSanctnMngtVO scMngtVO) throws SQLException {
		scmngtDAO.returnEccst(scMngtVO);
	}

	@Override
	public void updateEccstStatus(EccstSanctnMngtVO scMngtVO) throws SQLException {
		scmngtDAO.updateEccstStatus(scMngtVO);
	}

	@Override
	public void deleteEccst(String sanctn_no) throws SQLException {
		scmngtDAO.deleteEccst(sanctn_no);
		atchDAO.deleteAllAttach(sanctn_no);
	}

	@Override
	public EccstSanctnMngtVO selectEccstDetail(String sanctn_no) throws SQLException {
		EccstSanctnMngtVO scmngtVO = scmngtDAO.selectEccstDetail(sanctn_no);
		
		if(scmngtVO !=null) {
			addAtchList(scmngtVO);
		}
		
		return scmngtVO;
	}
	
	private void addAtchList(EccstSanctnMngtVO scMngtVO)throws SQLException{
		if(scMngtVO == null) {
			return;
		}
		
		String sanctn_no = scMngtVO.getSanctn_no();
		List<AtchMnflVO> atchList = atchDAO.selectAtchByBbscttNo(sanctn_no);
		
		scMngtVO.setAtchList(atchList);
	}

	@Override
	public AtchMnflVO getAttachByFileNo(String file_no) throws SQLException {
		AtchMnflVO atch = atchDAO.selectAtchByFileNo(file_no);
		return atch;
	}

	@Override
	public void removeAttachByFileNo(String file_no) throws SQLException {
		atchDAO.deleteAtch(file_no);
		
	}
}
