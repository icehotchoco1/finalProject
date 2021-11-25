package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dto.EccstSanctnerVO;

public interface ScnerDAO {
	
	int selectSeqNextVal()throws SQLException;
	
	void insertSanctners(EccstSanctnerVO scnerVO)throws SQLException;
	
	List<EccstSanctnerVO> selectSanctners(String sanctn_no)throws SQLException;
	
	void updateSanctner(EccstSanctnerVO scnerVO)throws SQLException;
	
	void deleteSanctners(String sanctn_no)throws SQLException;
	
	int selectMaxLineNo(String sanctn_no)throws SQLException;
	
	void updateAllConfirmAt(EccstSanctnerVO scnerVO)throws SQLException;
	
	void updateNextSanctner(EccstSanctnerVO scnerVO)throws SQLException;
	
	int selectLineNobySanctnNo(EccstSanctnerVO scnerVO)throws SQLException;
}
