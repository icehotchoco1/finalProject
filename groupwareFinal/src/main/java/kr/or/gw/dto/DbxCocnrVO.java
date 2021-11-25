package kr.or.gw.dto;

/**
 * @author 장하늘
 * 공유자에 대한 VO
 */

public class DbxCocnrVO {

	private String cocnr_no; //공유자번호
	private String dbx_no; //문서함번호
	private int cocnr_empno; //공유자사번
	private String cocnr_nm; //공유자이름
	private int rcvr_empno; //수신자사번
	
	
	public String getCocnr_no() {
		return cocnr_no;
	}
	public void setCocnr_no(String cocnr_no) {
		this.cocnr_no = cocnr_no;
	}
	public String getCocnr_nm() {
		return cocnr_nm;
	}
	public void setCocnr_nm(String cocnr_nm) {
		this.cocnr_nm = cocnr_nm;
	}
	public int getRcvr_empno() {
		return rcvr_empno;
	}
	public void setRcvr_empno(int rcvr_empno) {
		this.rcvr_empno = rcvr_empno;
	}
	public String getDbx_no() {
		return dbx_no;
	}
	public void setDbx_no(String dbx_no) {
		this.dbx_no = dbx_no;
	}
	public int getCocnr_empno() {
		return cocnr_empno;
	}
	public void setCocnr_empno(int cocnr_empno) {
		this.cocnr_empno = cocnr_empno;
	}
	
}
