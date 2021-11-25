package kr.or.gw.dto;

import java.util.Date;
import java.util.List;

/**
 * @author 장하늘
 * 공지사항에 대한 VO
 */


public class BbsNtbdVO {
	
	private String bbsctt_no; //게시글번호
	private String sj; //제목 
	private String cn; //내용
	private Date rgsde; //등록일
	private int empno; //사번
	private int rdcnt; //조회수
	private String emp_nm; //작성자명
	
	private List<AtchMnflVO> atchList;
	
	public List<AtchMnflVO> getAtchList() {
		return atchList;
	}
	public void setAtchList(List<AtchMnflVO> atchList) {
		this.atchList = atchList;
	}
	
	public String getBbsctt_no() {
		return bbsctt_no;
	}
	public void setBbsctt_no(String bbsctt_no) {
		this.bbsctt_no = bbsctt_no;
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
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getRdcnt() {
		return rdcnt;
	}
	public void setRdcnt(int rdcnt) {
		this.rdcnt = rdcnt;
	}
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}

	
}
