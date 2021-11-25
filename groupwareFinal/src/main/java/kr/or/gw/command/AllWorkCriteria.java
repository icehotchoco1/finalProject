package kr.or.gw.command;

public class AllWorkCriteria extends Criteria{
	private String searchType=""; // 검색구분
	private String keyword=""; //검색어
	private String imcode=""; // 중요도코드
	
	public String getImcode() {
		return imcode;
	}
	public void setImcode(String imcode) {
		this.imcode = imcode;
	}
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
	
}
