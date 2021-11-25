package kr.or.gw.command;

import java.util.Date;

import kr.or.gw.dto.DbxVO;

public class DbxPublicRegistCommand {

	private String sj;
	private String cn;
	private int empno;
	private String emp_nm;
	
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
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}
	
	public DbxVO toDbsVO() {
		DbxVO dbx = new DbxVO();
		dbx.setSj(this.sj);
		dbx.setCn(this.cn);
		dbx.setEmpno(this.empno);
		dbx.setEmp_nm(this.emp_nm);
		dbx.setRgsde(new Date());
		
		return dbx;
	}
}
