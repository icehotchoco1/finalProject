package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dto.EccstBkmkSanctnLnDtlsVO;
import kr.or.gw.dto.EccstBkmkSanctnLnVO;

public interface EbkmkDAO {
	
	List<EccstBkmkSanctnLnVO> selectBkmkList(int rgstr_empno)throws SQLException;
	
	List<EccstBkmkSanctnLnDtlsVO> selectBkmkListDetail(String bkmk_no)throws SQLException;
	
	void deleteBkmk(String bkmk_no)throws SQLException;
	
	void deleteBkmkDtls(String bkmk_no) throws SQLException;
	
	void insertBkmk(EccstBkmkSanctnLnVO ebkmkVO) throws SQLException;

	void insertBkmkDtls(EccstBkmkSanctnLnDtlsVO dbkmkdtlsVO) throws SQLException;
	
	int getbkmkSeq() throws SQLException;
}
