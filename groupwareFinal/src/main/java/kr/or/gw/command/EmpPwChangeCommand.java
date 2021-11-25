package kr.or.gw.command;

import kr.or.gw.dto.OrgnztEmpMngtVO;

public class EmpPwChangeCommand{
	
	private int empno;
	private String password;
	private String clsf_code;

	public String getClsf_code() {
		return clsf_code;
	}

	public void setClsf_code(String clsf_code) {
		this.clsf_code = clsf_code;
	}

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