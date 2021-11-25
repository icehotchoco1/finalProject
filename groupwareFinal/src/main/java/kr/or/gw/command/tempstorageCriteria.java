package kr.or.gw.command;

public class tempstorageCriteria extends Criteria {

	private String searchType=""; // 검색구분
	private String erfType=""; // 양식명 구분
	private String keyword=""; // 검색어
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getErfType() {
		return erfType;
	}
	public void setErfType(String erfType) {
		this.erfType = erfType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	

	
	
}
