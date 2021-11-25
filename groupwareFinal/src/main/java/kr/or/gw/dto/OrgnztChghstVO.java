package kr.or.gw.dto;

import java.util.Date;

/**
 * @author 장하늘
 * 직급이력VO
 */

public class OrgnztChghstVO {
	
	private String clsf_hist_sn; //직급이력일련번호
	private int empno; //사번
	private String change_clsf; //변경직급
	private Date change_de; //변경일자
	
	public String getClsf_hist_sn() {
		return clsf_hist_sn;
	}
	public void setClsf_hist_sn(String clsf_hist_sn) {
		this.clsf_hist_sn = clsf_hist_sn;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getChange_clsf() {
		return change_clsf;
	}
	public void setChange_clsf(String change_clsf) {
		this.change_clsf = change_clsf;
	}
	public Date getChange_de() {
		return change_de;
	}
	public void setChange_de(Date change_de) {
		this.change_de = change_de;
	}
	
	

}
