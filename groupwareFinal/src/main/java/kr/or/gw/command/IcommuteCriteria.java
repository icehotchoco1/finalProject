package kr.or.gw.command;

public class IcommuteCriteria extends Criteria{
	private String searchType=""; // 검색구분
	private String keyword=""; //검색어
	private String startDate=""; //시작날짜
	private String eneDate=""; //종료날짜




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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEneDate() {
		return eneDate;
	}
	public void setEneDate(String eneDate) {
		this.eneDate = eneDate;
	}
	
}
