package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.AllbbsCriteria;
import kr.or.gw.dto.AllbbsVO;

public interface AllbbsDAO {
	List<AllbbsVO> selectSearchAllbbsList (AllbbsCriteria cri) throws SQLException;
	
	int selectSearchAllbbsListCount(AllbbsCriteria cri) throws SQLException;
}
