package kr.or.gw.dto;

/**
 * @author 장하늘
 *결재양식함 VO
 */

public class EccstRegstrFormVO {
	
	private String form_no; //양식번호
	private String form_nm; //양식이름
	private String form_cn; //양식내용
	private String form_style; //양식스타일
	private String fileatc_at; //파일첨부여부
	private String scrty_grad; //보안등급
	private String prsrv_pd; //보존기간
	
	public String getScrty_grad() {
		return scrty_grad;
	}
	public void setScrty_grad(String scrty_grad) {
		this.scrty_grad = scrty_grad;
	}
	public String getPrsrv_pd() {
		return prsrv_pd;
	}
	public void setPrsrv_pd(String prsrv_pd) {
		this.prsrv_pd = prsrv_pd;
	}
	public String getForm_style() {
		return form_style;
	}
	public void setForm_style(String form_style) {
		this.form_style = form_style;
	}
	private String se; //구분
	
	public String getForm_no() {
		return form_no;
	}
	public void setForm_no(String form_no) {
		this.form_no = form_no;
	}
	public String getForm_nm() {
		return form_nm;
	}
	public void setForm_nm(String form_nm) {
		this.form_nm = form_nm;
	}
	public String getForm_cn() {
		return form_cn;
	}
	public void setForm_cn(String form_cn) {
		this.form_cn = form_cn;
	}
	public String getSe() {
		return se;
	}
	public void setSe(String se) {
		this.se = se;
	}
	public String getFileatc_at() {
		return fileatc_at;
	}
	public void setFileatc_at(String fileatc_at) {
		this.fileatc_at = fileatc_at;
	}

	
}
