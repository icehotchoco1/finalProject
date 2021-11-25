package kr.or.gw.dto;

/**
 * @author 장하늘
 * 일정즐겨찾기 VO
 */

public class SchdulBkmkVO {
	
	private String fx_no; //일정번호
	private int empno; //사번
	
	public String getFx_no() {
		return fx_no;
	}
	public void setFx_no(String fx_no) {
		this.fx_no = fx_no;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}

	
}
