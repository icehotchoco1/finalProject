package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.BbsFreebdVO;

public interface FreeService {

	Map<String, Object> getFreeList(SearchCriteria cri) throws SQLException;

	BbsFreebdVO getFree(String bbsctt_no) throws SQLException;

	BbsFreebdVO getFreeForModify(String bbsctt_no) throws SQLException;

	void regist(BbsFreebdVO free) throws SQLException;

	void modify(BbsFreebdVO free) throws SQLException;

	void remove(String bbsctt_no) throws SQLException;

	AtchMnflVO getAttachByFileNo(String file_no) throws SQLException;

	void removeAttachByFileNo(String file_no) throws SQLException;
}
