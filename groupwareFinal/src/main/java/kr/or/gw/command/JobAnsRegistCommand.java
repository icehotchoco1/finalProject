package kr.or.gw.command;

import java.util.Date;

import kr.or.gw.dto.JobAnswerVO;

public class JobAnsRegistCommand {
	private String job_no;
	private int empno;
	private String acn;
	private String empnm;
	
	public String getEmpnm() {
		return empnm;
	}
	public void setEmpnm(String empnm) {
		this.empnm = empnm;
	}
	public String getJob_no() {
		return job_no;
	}
	public void setJob_no(String job_no) {
		this.job_no = job_no;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getAcn() {
		return acn;
	}
	public void setAcn(String acn) {
		this.acn = acn;
	}

	public JobAnswerVO toJobAnswerVO() {
		JobAnswerVO ans = new JobAnswerVO();
		ans.setJob_no(job_no);
		ans.setEmpno(empno);
		ans.setAcn(acn);
		ans.setRegist_de(new Date());
		ans.setEmpnm(empnm);
		
		return ans;
	}
	
}
