package kr.or.gw.dto;

/**
 * @author 장하늘
 *시차출퇴근제코드에 대한 VO
 */

public class DclzCommuteVO {
	
	private String cmte_code; //시차출퇴근제코드
	private int bgntime; //시작시간
	private int endtime; //종료시간
	
	public String getCmte_code() {
		return cmte_code;
	}
	public void setCmte_code(String cmte_code) {
		this.cmte_code = cmte_code;
	}
	public int getBgntime() {
		return bgntime;
	}
	public void setBgntime(int bgntime) {
		this.bgntime = bgntime;
	}
	public int getEndtime() {
		return endtime;
	}
	public void setEndtime(int endtime) {
		this.endtime = endtime;
	}


	
	
}
