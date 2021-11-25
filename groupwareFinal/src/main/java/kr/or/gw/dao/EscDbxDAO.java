package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.EscDbxCriteria;
import kr.or.gw.dto.EccstDbxVO;
import kr.or.gw.dto.EccstSanctnMngtVO;

public interface EscDbxDAO {
	
	List<EccstSanctnMngtVO> selectRdRcvList(EscDbxCriteria cri, int rec_empno) throws SQLException;
	int selectRdRcvListCount(EscDbxCriteria cri, int rec_empno) throws SQLException;

	List<EccstSanctnMngtVO> selectRdSendList(EscDbxCriteria cri, int empno) throws SQLException;
	int selectRdSendListCount(EscDbxCriteria cri, int empno) throws SQLException;
	
	
	//결재용
	int selectSeqNextVal()throws SQLException;
	
	void insertDbx(EccstDbxVO escDbxVO)throws SQLException;
	
	List<EccstDbxVO> selecRefferers(String Sacntn_no)throws SQLException;
	
	void deleteDbx(String sanctn_no)throws SQLException;
}
