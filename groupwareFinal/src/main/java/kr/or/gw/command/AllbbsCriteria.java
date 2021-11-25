package kr.or.gw.command;

public class AllbbsCriteria extends Criteria{
	private String searchType=""; // 검색구분
	private String keyword=""; //검색어
	private String bbsType=""; // 게시판구분
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getBbsType() {
		return bbsType;
	}
	public void setBbsType(String bbsType) {
		this.bbsType = bbsType;
	}
	
	
}
