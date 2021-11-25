package kr.or.gw.command;

public class VacCriteria extends Criteria {

	private String searchType=""; // 검색구분
	private String keyword=""; //검색어
	private String vcatn_code="";//휴가코드
	
	public String getVcatn_code() {
		return vcatn_code;
	}
	public void setVcatn_code(String vcatn_code) {
		this.vcatn_code = vcatn_code;
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
