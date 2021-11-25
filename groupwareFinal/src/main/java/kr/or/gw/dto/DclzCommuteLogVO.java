package kr.or.gw.dto;

import java.util.Date;

/**
 * @author 장하늘
 * 시차출퇴근제로그 VO
 */

public class DclzCommuteLogVO {

	private String cmte_code; //시차출퇴근제코드
	private int empno; //사번
	private Date bgnde; //시작일
	private Date endde; //종료일
	
	public String getCmte_code() {
		return cmte_code;
	}
	public void setCmte_code(String cmte_code) {
		this.cmte_code = cmte_code;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public Date getBgnde() {
		return bgnde;
	}
	public void setBgnde(Date bgnde) {
		this.bgnde = bgnde;
	}
	public Date getEndde() {
		return endde;
	}
	public void setEndde(Date endde) {
		this.endde = endde;
	}
	
}
