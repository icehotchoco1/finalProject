package kr.or.gw.command;

import kr.or.gw.dto.OrgnztEmpMngtVO;

public class PwChangeMainCommand{
	
	private int empno;
	private String password;

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "EmpPwChangeCommand [empno=" + empno + ", password=" + password + "]";
	}

	public OrgnztEmpMngtVO toOrgnztEmpMngtVO() {
		OrgnztEmpMngtVO emp = new OrgnztEmpMngtVO();
		emp.setEmpno(this.empno);
		emp.setPassword(this.password);
		
		return emp;
	}

	
	
}