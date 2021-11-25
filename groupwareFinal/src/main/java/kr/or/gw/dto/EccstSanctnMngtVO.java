package kr.or.gw.dto;

import java.util.Date;
import java.util.List;


/**
 * @author 장하늘
 * 결재 VO
 */

public class EccstSanctnMngtVO {

	private String sanctn_no; //결재번호
	private String form_no; //양식번호
	private int empno; //사번
	private String sj; //제목
	private String cn; //내용
	private String scrty_grad; //보안등급
	private String prsrv_pd; //보존기간
	private Date rgsde; //등록일
	private Date sanctn_tmlmt; //결재기한
	private String ipcr_code; //중요도코드
	private String sttus_code; //상태코드
	private Date bgnde; //시작일
	private Date endde; //종료일
	private String return_reason; // 반려사유
	private String nm; // 이름
	
	private String form_nm; //양식이름
	
	private List<AtchMnflVO> atchList;

	
	public List<AtchMnflVO> getAtchList() {
		return atchList;
	}
	public void setAtchList(List<AtchMnflVO> atchList) {
		this.atchList = atchList;
	}
	public String getForm_nm() {
		return form_nm;
	}
	public void setForm_nm(String form_nm) {
		this.form_nm = form_nm;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	// erfVO 추가
	private EccstRegstrFormVO erf;
	
	public EccstRegstrFormVO getErf() {
		return erf;
	}
	public void setErf(EccstRegstrFormVO erf) {
		this.erf = erf;
	}
	public String getReturn_reason() {
		return return_reason;
	}
	public void setReturn_reason(String return_reason) {
		this.return_reason = return_reason;
	}
	public String getSanctn_no() {
		return sanctn_no;
	}
	public void setSanctn_no(String sanctn_no) {
		this.sanctn_no = sanctn_no;
	}
	public String getForm_no() {
		return form_no;
	}
	public void setForm_no(String form_no) {
		this.form_no = form_no;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getSj() {
		return sj;
	}
	public void setSj(String sj) {
		this.sj = sj;
	}
	public String getCn() {
		return cn;
	}
	public void setCn(String cn) {
		this.cn = cn;
	}
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
	public Date getRgsde() {
		return rgsde;
	}
	public void setRgsde(Date rgsde) {
		this.rgsde = rgsde;
	}
	public Date getSanctn_tmlmt() {
		return sanctn_tmlmt;
	}
	public void setSanctn_tmlmt(Date sanctn_tmlmt) {
		this.sanctn_tmlmt = sanctn_tmlmt;
	}
	public String getIpcr_code() {
		return ipcr_code;
	}
	public void setIpcr_code(String ipcr_code) {
		this.ipcr_code = ipcr_code;
	}
	public String getSttus_code() {
		return sttus_code;
	}
	public void setSttus_code(String sttus_code) {
		this.sttus_code = sttus_code;
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
