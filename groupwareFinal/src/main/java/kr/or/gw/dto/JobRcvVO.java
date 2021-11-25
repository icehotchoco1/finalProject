package kr.or.gw.dto;

public class JobRcvVO {
	
	private String job_index; //수신자번호
	private String job_no; //업무번호
	private int rcver_empno; //수신자사번
	private String rcver_nm; //수신자이름
	private int rcver_progrs; //수신자진행도
	private int rcver_order; //수신자진행도
	
	
	public int getRcver_order() {
		return rcver_order;
	}
	public void setRcver_order(int rcver_order) {
		this.rcver_order = rcver_order;
	}
	public String getRcver_nm() {
		return rcver_nm;
	}
	public void setRcver_nm(String rcver_nm) {
		this.rcver_nm = rcver_nm;
	}
	public String getJob_index() {
		return job_index;
	}
	public void setJob_index(String job_index) {
		this.job_index = job_index;
	}
	public String getJob_no() {
		return job_no;
	}
	public void setJob_no(String job_no) {
		this.job_no = job_no;
	}
	public int getRcver_empno() {
		return rcver_empno;
	}
	public void setRcver_empno(int rcver_empno) {
		this.rcver_empno = rcver_empno;
	}
	public int getRcver_progrs() {
		return rcver_progrs;
	}
	public void setRcver_progrs(int rcver_progrs) {
		this.rcver_progrs = rcver_progrs;
	}
	
}
