package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.command.AllbbsCriteria;

public interface AllbbsService {
	public Map<String, Object> getAllBbsList(AllbbsCriteria cri) throws SQLException;
}
