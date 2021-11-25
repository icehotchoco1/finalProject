package kr.or.gw.service;

import java.sql.SQLException;

import kr.or.gw.dao.ApprovalSettingDAO;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public class ApprovalSettingServiceImpl implements ApprovalSettingService{
	
	
	private ApprovalSettingDAO approvalSettingDAO;
	
	public void setApprovalSettingDAO(ApprovalSettingDAO approvalSettingDAO) {
		this.approvalSettingDAO = approvalSettingDAO;
	}

	@Override
	public void modify(OrgnztEmpMngtVO emp) throws SQLException {
		approvalSettingDAO.updateApprovalPass(emp);		
	}

	




}
