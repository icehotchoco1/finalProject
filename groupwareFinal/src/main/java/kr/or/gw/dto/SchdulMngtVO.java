package kr.or.gw.dto;

import java.util.Date;

/**
 * @author PC-11
 * 일정관리VO
 */

public class SchdulMngtVO {
	
	private String schdul_no; //일정번호
	private int empno; //사번
	private String nm; //이름
	private String schdul_code; //일정코드
	private String schdul_sj; //일정제목
	private String schdul_cn; //일정내용
	private Date rgsde; //등록일
	private String bgnde; //시작일
	private String endde; //종료일
	private String cnrs_at; //공유여부
	private String bg_color; //배경 색깔
	private String dept_code; //부서코드
	private String dday; // d-day
	
	
	public String getDept_code() {
		return dept_code;
	}
	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}
	public String getBg_color() {
		return bg_color;
	}
	public void setBg_color(String bg_color) {
		this.bg_color = bg_color;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getSchdul_no() {
		return schdul_no;
	}
	public void setSchdul_no(String schdul_no) {
		this.schdul_no = schdul_no;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getSchdul_code() {
		return schdul_code;
	}
	public void setSchdul_code(String schdul_code) {
		this.schdul_code = schdul_code;
	}
	public String getSchdul_sj() {
		return schdul_sj;
	}
	public void setSchdul_sj(String schdul_sj) {
		this.schdul_sj = schdul_sj;
	}
	public String getSchdul_cn() {
		return schdul_cn;
	}
	public void setSchdul_cn(String schdul_cn) {
		this.schdul_cn = schdul_cn;
	}
	public Date getRgsde() {
		return rgsde;
	}
	public void setRgsde(Date rgsde) {
		this.rgsde = rgsde;
	}

	public String getBgnde() {
		return bgnde;
	}
	public void setBgnde(String bgnde) {
		this.bgnde = bgnde;
	}
	public String getEndde() {
		return endde;
	}
	public void setEndde(String endde) {
		this.endde = endde;
	}
	public String getCnrs_at() {
		return cnrs_at;
	}
	public void setCnrs_at(String cnrs_at) {
		this.cnrs_at = cnrs_at;
	}
	public String getDday() {
		return dday;
	}
	public void setDday(String dday) {
		this.dday = dday;
	}
	
	

}
