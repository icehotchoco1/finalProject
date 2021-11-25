package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.basicCriteria;
import kr.or.gw.command.basicPageMaker;
import kr.or.gw.dao.SchDAO;
import kr.or.gw.dto.SchdulMngtVO;

public class SchServiceImpl implements SchService {

	private SchDAO schDAO;

	public void setSchDAO(SchDAO schDAO) {
		this.schDAO = schDAO;
	}

	@Override
	public Map<String, Object> schList(int empno) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<SchdulMngtVO> schList = schDAO.selectSearchSchList(empno);

		dataMap.put("schList", schList);

		return dataMap;
	}

	@Override
	public SchdulMngtVO getSchedule(String schdul_no) throws SQLException {

		SchdulMngtVO sch = schDAO.selectSchBySchdul_no(schdul_no);

		return sch;
	}

	@Override
	public void regist(SchdulMngtVO sch) throws SQLException {
		String schdul_no = schDAO.selectSchmSeqNext();
		sch.setSchdul_no(schdul_no);
		schDAO.insertSch(sch);

	}

	@Override
	public void modify(SchdulMngtVO sch) throws SQLException {
		schDAO.updateSch(sch);

	}

	@Override
	public void remove(String schdul_no) throws SQLException {
		schDAO.deleteSch(schdul_no);

	}

	@Override
	public Map<String, Object> schCompanyList(int empno) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<SchdulMngtVO> schList = schDAO.selectCompanySchList(empno);

		dataMap.put("schList", schList);

		return dataMap;
	}
	
	@Override
	public void modifyByDrag(SchdulMngtVO sch) throws SQLException {
		schDAO.updateScheduleByDrag(sch);
		
	}

	@Override
	public Map<String, Object> schDdayList(basicCriteria cri) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<SchdulMngtVO> schDdayList = schDAO.selectDday(cri);
		// 총 리스트 개수
		int totalCount = schDAO.selectDdayCount(cri);
		
		// pageMaker 생성
		basicPageMaker pageMaker = new basicPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("schDdayList", schDdayList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

}
