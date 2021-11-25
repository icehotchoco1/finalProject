package kr.or.gw.dto;

import java.util.Date;
import java.util.List;

/**
 * @author 장하늘
 * 문서함에 대한 VO
 */

public class DbxVO {

	private String dbx_no; //문서함번호
	private int empno; //사번
	private String dbx_se; //문서함구분
	private String sj; //제목
	private Date rgsde; //등록일
	private String emp_nm; //작성자
	private String cn; //내용
	private List<AtchMnflVO> atchList;
	
	public List<AtchMnflVO> getAtchList() {
		return atchList;
	}
	public void setAtchList(List<AtchMnflVO> atchList) {
		this.atchList = atchList;
	}
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}
	public String getDbx_no() {
		return dbx_no;
	}
	public void setDbx_no(String dbx_no) {
		this.dbx_no = dbx_no;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getDbx_se() {
		return dbx_se;
	}
	public void setDbx_se(String dbx_se) {
		this.dbx_se = dbx_se;
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
	public Date getRgsde() {
		return rgsde;
	}
	public void setRgsde(Date rgsde) {
		this.rgsde = rgsde;
	}
	
	
}
