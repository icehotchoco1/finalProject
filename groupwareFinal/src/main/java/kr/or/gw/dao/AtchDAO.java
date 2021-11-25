package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dto.AtchMnflVO;

public interface AtchDAO {
		
	public List<AtchMnflVO> selectAtchByBbscttNo (String bbsctt_no) throws SQLException;
	
	public AtchMnflVO selectAtchByFileNo(String file_no) throws SQLException;
	
	public void insertAtch(AtchMnflVO atch) throws SQLException;
	
	public void deleteAtch(String file_no) throws SQLException;
	
	public void deleteAllAttach(String bbsctt_no) throws SQLException;
	
}