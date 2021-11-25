package kr.or.gw.dto;


/**
 * @author 장하늘
 * 휴가코드VO
 */

public class DclzVacCodeVO {
	
	private String vcatn_code; //휴가코드
	private String vcatn_nm; //휴가명
	private float vcatn_daycnt; //휴가일수
	
	public String getVcatn_code() {
		return vcatn_code;
	}
	public void setVcatn_code(String vcatn_code) {
		this.vcatn_code = vcatn_code;
	}
	public String getVcatn_nm() {
		return vcatn_nm;
	}
	public void setVcatn_nm(String vcatn_nm) {
		this.vcatn_nm = vcatn_nm;
	}
	public float getVcatn_daycnt() {
		return vcatn_daycnt;
	}
	public void setVcatn_daycnt(float vcatn_daycnt) {
		this.vcatn_daycnt = vcatn_daycnt;
	}

}
