package kr.or.gw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dao.EbkmkDAO;
import kr.or.gw.dto.EccstBkmkSanctnLnDtlsVO;
import kr.or.gw.dto.EccstBkmkSanctnLnVO;

public class EbkmkServiceImpl implements EbkmkService{
	
	private EbkmkDAO ebkmkDAO;
	public void setEbkmkDAO(EbkmkDAO ebkmkDAO) {
		this.ebkmkDAO = ebkmkDAO;
	}
	
	@Override
	public List<EccstBkmkSanctnLnVO> getBkmkList(int rgstr_empno) throws SQLException {
		List<EccstBkmkSanctnLnVO> bkmkList = ebkmkDAO.selectBkmkList(rgstr_empno);
		return bkmkList;
	}
	@Override
	public List<EccstBkmkSanctnLnDtlsVO> getBkmkListDetail(String bkmk_no) throws SQLException {
		List<EccstBkmkSanctnLnDtlsVO> bkmkListDtl= ebkmkDAO.selectBkmkListDetail(bkmk_no);
		return bkmkListDtl;
	}
	@Override
	public void deleteBkmk(String bkmk_no) throws SQLException {
		ebkmkDAO.deleteBkmk(bkmk_no);
	}
	@Override
	public void deleteBkmkDtls(String bkmk_no) throws SQLException {
		ebkmkDAO.deleteBkmkDtls(bkmk_no);
	}
	@Override
	public void insertBkmk(EccstBkmkSanctnLnVO ebkmkVO) throws SQLException {
		ebkmkDAO.insertBkmk(ebkmkVO);
	}
	@Override
	public void insertBkmkDtls(EccstBkmkSanctnLnDtlsVO dbkmkdtlsVO) throws SQLException {
		ebkmkDAO.insertBkmkDtls(dbkmkdtlsVO);
	}

	@Override
	public int getbkmkSeq() throws SQLException {
		return ebkmkDAO.getbkmkSeq();
	}
	
	
}
