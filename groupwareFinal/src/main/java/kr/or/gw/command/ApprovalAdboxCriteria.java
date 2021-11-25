package kr.or.gw.command;

public class ApprovalAdboxCriteria extends Criteria{
	private String searchType=""; // 검색구분
	private String keyword=""; //검색어
	private String ipcrcode=""; // 중요도코드
	private String formnm=""; // 양식별




	public String getIpcrcode() {
		return ipcrcode;
	}
	public void setIpcrcode(String ipcrcode) {
		this.ipcrcode = ipcrcode;
	}
	public String getFormnm() {
		return formnm;
	}
	public void setFormnm(String formnm) {
		this.formnm = formnm;
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
