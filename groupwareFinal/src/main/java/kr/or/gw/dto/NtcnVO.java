package kr.or.gw.dto;

import java.util.Date;

/**
 * @author 장하늘
 * 알림VO
 */

public class NtcnVO {
	
	private String ntcn_no; //알림번호
	private int trnsmiter_empno; //송신자사번
	private String ntcn_cn; //알림내용
	private String url_adres; //url주소
	private String cnfirm_at; //확인여부
	private Date ntcn_de; //알림일자
	
	public String getNtcn_no() {
		return ntcn_no;
	}
	public void setNtcn_no(String ntcn_no) {
		this.ntcn_no = ntcn_no;
	}
	public int getTrnsmiter_empno() {
		return trnsmiter_empno;
	}
	public void setTrnsmiter_empno(int trnsmiter_empno) {
		this.trnsmiter_empno = trnsmiter_empno;
	}
	public String getNtcn_cn() {
		return ntcn_cn;
	}
	public void setNtcn_cn(String ntcn_cn) {
		this.ntcn_cn = ntcn_cn;
	}
	public String getUrl_adres() {
		return url_adres;
	}
	public void setUrl_adres(String url_adres) {
		this.url_adres = url_adres;
	}
	public String getCnfirm_at() {
		return cnfirm_at;
	}
	public void setCnfirm_at(String cnfirm_at) {
		this.cnfirm_at = cnfirm_at;
	}
	public Date getNtcn_de() {
		return ntcn_de;
	}
	public void setNtcn_de(Date ntcn_de) {
		this.ntcn_de = ntcn_de;
	}
	
	

}
