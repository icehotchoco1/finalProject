package kr.or.gw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dto.DclzVacCodeVO;

public interface DclzVacCodeService {
	
	List<DclzVacCodeVO> getVacCodeList() throws SQLException;
	
}
