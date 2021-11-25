package kr.or.gw.dto;


/**
 * @author 장하늘
 *휴가 VO
 */

public class DclzVcatnVO {
	
	private String vcatn_no; //휴가번호
	private int vcatn_code; //휴가코드
	private int empno; //사번
	private int tot_vcatn_daycnt; //총휴가일수
	private int use_vcatn_daycnt; //사용휴가일수
	
	public String getVcatn_no() {
		return vcatn_no;
	}
	public void setVcatn_no(String vcatn_no) {
		this.vcatn_no = vcatn_no;
	}
	public int getVcatn_code() {
		return vcatn_code;
	}
	public void setVcatn_code(int vcatn_code) {
		this.vcatn_code = vcatn_code;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getTot_vcatn_daycnt() {
		return tot_vcatn_daycnt;
	}
	public void setTot_vcatn_daycnt(int tot_vcatn_daycnt) {
		this.tot_vcatn_daycnt = tot_vcatn_daycnt;
	}
	public int getUse_vcatn_daycnt() {
		return use_vcatn_daycnt;
	}
	public void setUse_vcatn_daycnt(int use_vcatn_daycnt) {
		this.use_vcatn_daycnt = use_vcatn_daycnt;
	}

	
}
