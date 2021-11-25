package kr.or.gw.dao;

import java.sql.SQLException;

import kr.or.gw.dto.OrgnztEmpMngtVO;


public interface ApprovalSettingDAO {
	
	 void updateApprovalPass(OrgnztEmpMngtVO emp) throws SQLException;

}
