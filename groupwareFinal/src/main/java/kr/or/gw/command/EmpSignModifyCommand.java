package kr.or.gw.command;

import kr.or.gw.dto.OrgnztEmpMngtVO;

public class EmpSignModifyCommand {
	private int empno;
	private String sanctn_sign; //결재서명
	
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	
	public String getSanctn_sign() {
		return sanctn_sign;
	}
	public void setSanctn_sign(String sanctn_sign) {
		this.sanctn_sign = sanctn_sign;
	}
	public OrgnztEmpMngtVO toEmpVO() {
		OrgnztEmpMngtVO emp = new OrgnztEmpMngtVO();
		emp.setEmpno(this.empno);
		
		return emp;
	}
}
