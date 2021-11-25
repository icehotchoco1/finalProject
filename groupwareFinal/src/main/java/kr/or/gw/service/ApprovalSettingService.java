package kr.or.gw.service;

import java.sql.SQLException;

import kr.or.gw.dto.OrgnztEmpMngtVO;

public interface ApprovalSettingService {

	
	void modify(OrgnztEmpMngtVO emp) throws SQLException;

}
