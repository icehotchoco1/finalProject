package kr.or.gw.dto;

import java.util.Date;
import java.util.List;

/**
 * @author 장하늘
 *업무댓글 VO
 */

public class JobAnswerVO {
	
	private String answer_no; //댓글번호
	private String job_no; //업무번호
	private int empno; //사번
	private String acn; //내용
	private Date regist_de; //등록일자
	private String empnm;
	
	
	public String getEmpnm() {
		return empnm;
	}
	public void setEmpnm(String empnm) {
		this.empnm = empnm;
	}
	public String getAnswer_no() {
		return answer_no;
	}
	public void setAnswer_no(String answer_no) {
		this.answer_no = answer_no;
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
	public Date getRegist_de() {
		return regist_de;
	}
	public void setRegist_de(Date regist_de) {
		this.regist_de = regist_de;
	}
	
	

}
