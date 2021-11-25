package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.PageMaker;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.command.basicCriteria;
import kr.or.gw.command.basicPageMaker;
import kr.or.gw.dao.AtchDAO;
import kr.or.gw.dao.NoticeDAO;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.BbsNtbdVO;

public class NoticeServiceImpl implements NoticeService {

	private NoticeDAO noticeDAO;
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	
	private AtchDAO atchDAO;
	public void setAtchDAO(AtchDAO atchDAO) {
		this.atchDAO = atchDAO;
	}
	
	@Override
	public Map<String, Object> getNoticeList(basicCriteria cri) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져온다.
		List<BbsNtbdVO> noticeList = noticeDAO.selectSearchNoticeList(cri);
		
		if (noticeList != null) {
			for (BbsNtbdVO notice : noticeList) {
				addAtchList(notice);
			}
		}
		
		// 총 리스트 개수
		int totalCount = noticeDAO.selectSearchNoticeListCount(cri);
		
		// pageMaker 생성
		basicPageMaker pageMaker = new basicPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("noticeList", noticeList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public BbsNtbdVO getNotice(String bbsctt_no) throws SQLException {
		BbsNtbdVO notice = noticeDAO.selectNoticeByNno(bbsctt_no);
		// 해당 글번호의 게시글 조회수를 증가시킨다.
		noticeDAO.increaseViewCnt(bbsctt_no);
		addAtchList(notice);
		
		return notice;
	}

	@Override
	public BbsNtbdVO getNoticeForModify(String bbsctt_no) throws SQLException {
		BbsNtbdVO notice = noticeDAO.selectNoticeByNno(bbsctt_no);
		addAtchList(notice);
		return notice;
	}

	@Override
	public void regist(BbsNtbdVO notice) throws SQLException {
		String bbsctt_no = noticeDAO.selectNoticeSequenceNextValue();
		notice.setBbsctt_no(bbsctt_no);
		noticeDAO.insertNotice(notice);
		
		int index = 0;
		if (notice.getAtchList() != null) {
			for (AtchMnflVO atch : notice.getAtchList()) {
				atch.setBbsctt_no(bbsctt_no);
				atch.setAtch_order(index);
				atchDAO.insertAtch(atch);
				index++;
			}
		}
	}

	@Override
	public void modify(BbsNtbdVO notice) throws SQLException {
		noticeDAO.updateNotice(notice);
		
		int index = 1+notice.getAtchList().size();
		if (notice.getAtchList() != null) {
			for (AtchMnflVO atch : notice.getAtchList()) {
				atch.setBbsctt_no(notice.getBbsctt_no());
				atch.setAtch_order(index);
				atchDAO.insertAtch(atch);
				index++;
			}
		}
	}

	@Override
	public void remove(String bbsctt_no) throws SQLException {
		noticeDAO.deleteNotice(bbsctt_no);
		atchDAO.deleteAllAttach(bbsctt_no);
	}
	
	@Override
	public AtchMnflVO getAttachByFileNo(String file_no) throws SQLException {
		
		AtchMnflVO atch = atchDAO.selectAtchByFileNo(file_no);
		
		return atch;
	}
	
	@Override
	public void removeAttachByFileNo(String file_no) throws SQLException {
		atchDAO.deleteAtch(file_no);
	}
	
	private void addAtchList(BbsNtbdVO notice) throws SQLException {
		if (notice == null) {
			return;
		}
		
		String bbsctt_no = notice.getBbsctt_no();
		List<AtchMnflVO> atchList = atchDAO.selectAtchByBbscttNo(bbsctt_no);
		
		notice.setAtchList(atchList);
	}

}
