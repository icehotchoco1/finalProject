package kr.or.gw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.EscDbxCriteria;
import kr.or.gw.dto.EccstDbxVO;
import kr.or.gw.dto.EccstSanctnMngtVO;

public interface EscDbxService {
	
	// 수신 참조 조회	
	Map<String,Object> getRdRcvList(EscDbxCriteria cri, int rec_empno)throws SQLException;
	
	// 발신 참조 조회
	Map<String,Object> getRdSendList(EscDbxCriteria cri, int empno)throws SQLException;
	
	//상세 조회
	public EccstSanctnMngtVO getEscSanctn(String sanctn_no) throws SQLException;
	
	
	//결재용
	
	int selectSeqNextVal()throws SQLException;
	
	void insertDbx(EccstDbxVO escDbxVO)throws SQLException;
	
	List<EccstDbxVO> getRefferList(String sanctn_no)throws SQLException;
	
	void deleteDbx(String sanctn_no)throws SQLException;
}
