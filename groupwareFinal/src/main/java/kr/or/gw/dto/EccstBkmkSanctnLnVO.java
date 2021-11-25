package kr.or.gw.dto;


/**
 * @author 장하늘
 * 즐겨찾기결재선 VO
 */

public class EccstBkmkSanctnLnVO {
	
	private String bkmk_no; //즐겨찾기번호
	private int rgstr_empno; // 등록자사번
	private String form_no;
	private String bkmk_sj;//즐겨찾기제목
	private String bkmk_info;//즐겨찾기설명
	public String getBkmk_no() {
		return bkmk_no;
	}
	public void setBkmk_no(String bkmk_no) {
		this.bkmk_no = bkmk_no;
	}
	public int getRgstr_empno() {
		return rgstr_empno;
	}
	public void setRgstr_empno(int rgstr_empno) {
		this.rgstr_empno = rgstr_empno;
	}
	public String getForm_no() {
		return form_no;
	}
	public void setForm_no(String form_no) {
		this.form_no = form_no;
	}
	public String getBkmk_sj() {
		return bkmk_sj;
	}
	public void setBkmk_sj(String bkmk_sj) {
		this.bkmk_sj = bkmk_sj;
	}
	public String getBkmk_info() {
		return bkmk_info;
	}
	public void setBkmk_info(String bkmk_info) {
		this.bkmk_info = bkmk_info;
	}
	
	
	
}
