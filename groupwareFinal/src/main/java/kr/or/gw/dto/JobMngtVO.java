package kr.or.gw.dto;

import java.util.Date;
import java.util.List;

/**
 * @author 장하늘
 * 업무VO
 */

public class JobMngtVO {
	
	private String job_no; //업무번호
	private int drctr_empno; //지시자사번
	private String sj; //제목
	private String cn; //내용
	private Date regist_de; //등록일자
	private String sttus_code;//상태코드
	private String im_code;//중요도코드
	private Date end_de; //업무 기한
	private String emp_nm; //작성자이름
	private List<AtchMnflVO> atchList;
	private int[] jrempnoList;
	private List<JobRcvVO> jrcvList;
	private int rcver_progrs; //진행상황
	
	
	public int getRcver_progrs() {
		return rcver_progrs;
	}
	public void setRcver_progrs(int rcver_progrs) {
		this.rcver_progrs = rcver_progrs;
	}
	public List<JobRcvVO> getJrcvList() {
		return jrcvList;
	}
	public void setJrcvList(List<JobRcvVO> jrcvList) {
		this.jrcvList = jrcvList;
	}
	public int[] getJrempnoList() {
		return jrempnoList;
	}
	public void setJrempnoList(int[] jrempnoList) {
		this.jrempnoList = jrempnoList;
	}
	public List<AtchMnflVO> getAtchList() {
		return atchList;
	}
	public void setAtchList(List<AtchMnflVO> atchList) {
		this.atchList = atchList;
	}
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}
	public Date getEnd_de() {
		return end_de;
	}
	public void setEnd_de(Date end_de) {
		this.end_de = end_de;
	}
	public String getIm_code() {
		return im_code;
	}
	public void setIm_code(String im_code) {
		this.im_code = im_code;
	}
	public String getSttus_code() {
		return sttus_code;
	}
	public void setSttus_code(String sttus_code) {
		this.sttus_code = sttus_code;
	}
	public String getJob_no() {
		return job_no;
	}
	public void setJob_no(String job_no) {
		this.job_no = job_no;
	}
	public int getDrctr_empno() {
		return drctr_empno;
	}
	public void setDrctr_empno(int drctr_empno) {
		this.drctr_empno = drctr_empno;
	}
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
	public Date getRegist_de() {
		return regist_de;
	}
	public void setRegist_de(Date regist_de) {
		this.regist_de = regist_de;
	}
	

}
