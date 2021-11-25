package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.PageMaker;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dao.AtchDAO;
import kr.or.gw.dao.NewsDAO;
import kr.or.gw.dto.AtchMnflVO;
import kr.or.gw.dto.BbsCmpnyDsptchVO;

public class NewsServiceImpl implements NewsService{
	
	
	private NewsDAO newsDAO;
	public void setNewsDAO(NewsDAO newsDAO) {
		this.newsDAO = newsDAO;
	}
	private AtchDAO atchDAO;
	public void setAtchDAO(AtchDAO atchDAO) {
		this.atchDAO = atchDAO;
	}

	@Override
	public BbsCmpnyDsptchVO getNewsForModify(String bbsctt_no) throws SQLException {
		BbsCmpnyDsptchVO news = newsDAO.selectNewsByBbscttno(bbsctt_no);
		addAtchList(news);
		return news;
	}

	@Override
	public BbsCmpnyDsptchVO getNews(String bbsctt_no) throws SQLException {
		BbsCmpnyDsptchVO news = newsDAO.selectNewsByBbscttno(bbsctt_no);
		newsDAO.increaseViewCnt(bbsctt_no);
		addAtchList(news);
		return news;
	}

	@Override
	public void regist(BbsCmpnyDsptchVO news) throws SQLException {
		String bbsctt_no = newsDAO.selectNewsSeqNext();
		news.setBbsctt_no(bbsctt_no);
		newsDAO.insertNews(news);
		
		int index = 0;
		if(news.getAtchList() != null) {
			for(AtchMnflVO atch : news.getAtchList()) {
				atch.setBbsctt_no(bbsctt_no);
				atch.setAtch_order(index);
				atchDAO.insertAtch(atch);
				index++;
			}
		}
	}

	@Override
	public void modify(BbsCmpnyDsptchVO news) throws SQLException {

		newsDAO.updateNews(news);
		
		int index = 1+news.getAtchList().size();
		if(news.getAtchList() != null) {
			for(AtchMnflVO atch : news.getAtchList()) {
				atch.setBbsctt_no(news.getBbsctt_no());
				atch.setAtch_order(index);
				atchDAO.insertAtch(atch);
				index++;
			}
		}
	}

	@Override
	public void remove(String bbsctt_no) throws SQLException {
		atchDAO.deleteAllAttach(bbsctt_no);
		newsDAO.deleteNews(bbsctt_no);
	}

	@Override
	public Map<String, Object> getNewsList(SearchCriteria cri) throws SQLException {

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		List<BbsCmpnyDsptchVO> newsList = newsDAO.selectNewsCriteria(cri);

		if(newsList != null) {
			for(BbsCmpnyDsptchVO news : newsList) {
				addAtchList(news);
			}
		}
		
		// 전체 news 개수
		int totalCount = newsDAO.selectNewsCriteriaTotalCount(cri);
		Map<String, Object> dataMap = new HashMap<String, Object>();

		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("newsList", newsList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
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
	private void addAtchList(BbsCmpnyDsptchVO news) throws SQLException{
		if(news == null) {
			return;
		}
		
		String bbsctt_no = news.getBbsctt_no();
		List<AtchMnflVO> atchList = atchDAO.selectAtchByBbscttNo(bbsctt_no);
		
		news.setAtchList(atchList);
	}
}
