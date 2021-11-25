package kr.or.gw.dto;


/**
 * @author 장하늘
 * 결재환경설정VO
 */

public class EccstEnvrnSetupVO {
	
	private int empno; //사번
	private int drsc_setup; //부재중설정
	private int replc_sanctner_empno; //대결자사번
	
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getDrsc_setup() {
		return drsc_setup;
	}
	public void setDrsc_setup(int drsc_setup) {
		this.drsc_setup = drsc_setup;
	}
	public int getReplc_sanctner_empno() {
		return replc_sanctner_empno;
	}
	public void setReplc_sanctner_empno(int replc_sanctner_empno) {
		this.replc_sanctner_empno = replc_sanctner_empno;
	}
	
	
	

}
