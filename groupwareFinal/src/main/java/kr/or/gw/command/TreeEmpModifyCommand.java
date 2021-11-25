package kr.or.gw.command;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import kr.or.gw.dto.OrgnztEmpMngtVO;

public class TreeEmpModifyCommand {
	private int empno;
	private String nm;
	private String cttpc;
	private String fxnum;
	private String dept_code;
	private String clsf_code;
	private String rspofc_code;
	private String password;
	private String ip_adres;
	private String email_adres;
	private String author_code;
	private MultipartFile picture; // 사진파일 
	private String oldPicture; // 이전 사진파일명
	private String uploadPicture; // 변경된 사진 파일명.
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getCttpc() {
		return cttpc;
	}
	public void setCttpc(String cttpc) {
		this.cttpc = cttpc;
	}
	public String getFxnum() {
		return fxnum;
	}
	public void setFxnum(String fxnum) {
		this.fxnum = fxnum;
	}
	public String getDept_code() {
		return dept_code;
	}
	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}
	public String getClsf_code() {
		return clsf_code;
	}
	public void setClsf_code(String clsf_code) {
		this.clsf_code = clsf_code;
	}
	public String getRspofc_code() {
		return rspofc_code;
	}
	public void setRspofc_code(String rspofc_code) {
		this.rspofc_code = rspofc_code;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIp_adres() {
		return ip_adres;
	}
	public void setIp_adres(String ip_adres) {
		this.ip_adres = ip_adres;
	}
	public String getEmail_adres() {
		return email_adres;
	}
	public void setEmail_adres(String email_adres) {
		this.email_adres = email_adres;
	}
	public String getAuthor_code() {
		return author_code;
	}
	public void setAuthor_code(String author_code) {
		this.author_code = author_code;
	}
	public MultipartFile getPicture() {
		return picture;
	}
	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}
	public String getOldPicture() {
		return oldPicture;
	}
	public void setOldPicture(String oldPicture) {
		this.oldPicture = oldPicture;
	}
	public String getUploadPicture() {
		return uploadPicture;
	}
	public void setUploadPicture(String uploadPicture) {
		this.uploadPicture = uploadPicture;
	}
	
	public OrgnztEmpMngtVO toEmpVO() {
		OrgnztEmpMngtVO emp = new OrgnztEmpMngtVO();
		
		emp.setEmpno(this.empno);
		emp.setNm(this.nm);
		emp.setCttpc(this.cttpc);
		emp.setFxnum(this.fxnum);
		emp.setDept_code(this.dept_code);
		emp.setClsf_code(this.clsf_code);
		emp.setRspofc_code(this.rspofc_code);
		emp.setPassword(this.password);
		emp.setIp_adres(this.ip_adres);
		emp.setEmail_adres(this.email_adres);
		emp.setAuthor_code(this.author_code);
		
		
		return emp;
	}
}
