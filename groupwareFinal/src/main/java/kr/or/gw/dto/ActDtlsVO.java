package kr.or.gw.dto;

import java.util.Date;

/**
 * @author 장하늘
 * 활동내역 VO
 */

public class ActDtlsVO {
	
	private String act_dtls_no; //활동내역번호
	private int empno; //사번
	private Date act_de; //활동일자
	private String act_cn; //활동내용
	
	public String getAct_dtls_no() {
		return act_dtls_no;
	}
	public void setAct_dtls_no(String act_dtls_no) {
		this.act_dtls_no = act_dtls_no;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public Date getAct_de() {
		return act_de;
	}
	public void setAct_de(Date act_de) {
		this.act_de = act_de;
	}
	public String getAct_cn() {
		return act_cn;
	}
	public void setAct_cn(String act_cn) {
		this.act_cn = act_cn;
	}
	

	
	

}
