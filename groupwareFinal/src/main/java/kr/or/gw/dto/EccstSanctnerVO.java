package kr.or.gw.dto;


/**
 * @author 장하늘
 * 결재권자VO
 */

public class EccstSanctnerVO {
	
	private String sanctner_no; //결재번호
	private String sanctn_no; //결재번호
	private String sanctner_nm;//결재자이름
	private int sanctner_empno; //결재자사번
	private int ln_no;//결재라인순서
	private String sanctn_sttus; //결재여부
	private String lst_confirm_at;//최종결재권자승인여부
	private String sanctn_date; //등록일
	private int replace_empno; //대결자사번
	private String resanc_at;//대결자승인여부
	
	public String getResanc_at() {
		return resanc_at;
	}
	public void setResanc_at(String resanc_at) {
		this.resanc_at = resanc_at;
	}
	public int getReplace_empno() {
		return replace_empno;
	}
	public void setReplace_empno(int replace_empno) {
		this.replace_empno = replace_empno;
	}
	public String getSanctner_no() {
		return sanctner_no;
	}
	public void setSanctner_no(String sanctner_no) {
		this.sanctner_no = sanctner_no;
	}
	public String getSanctn_no() {
		return sanctn_no;
	}
	public void setSanctn_no(String sanctn_no) {
		this.sanctn_no = sanctn_no;
	}
	public String getSanctner_nm() {
		return sanctner_nm;
	}
	public void setSanctner_nm(String sanctner_nm) {
		this.sanctner_nm = sanctner_nm;
	}
	public int getSanctner_empno() {
		return sanctner_empno;
	}
	public void setSanctner_empno(int sanctner_empno) {
		this.sanctner_empno = sanctner_empno;
	}
	
	public int getLn_no() {
		return ln_no;
	}
	public void setLn_no(int ln_no) {
		this.ln_no = ln_no;
	}
	public String getSanctn_sttus() {
		return sanctn_sttus;
	}
	public void setSanctn_sttus(String sanctn_sttus) {
		this.sanctn_sttus = sanctn_sttus;
	}
	public String getLst_confirm_at() {
		return lst_confirm_at;
	}
	public void setLst_confirm_at(String lst_confirm_at) {
		this.lst_confirm_at = lst_confirm_at;
	}
	public String getSanctn_date() {
		return sanctn_date;
	}
	public void setSanctn_date(String sanctn_date) {
		this.sanctn_date = sanctn_date;
	}

	
	
	
	
	

}
