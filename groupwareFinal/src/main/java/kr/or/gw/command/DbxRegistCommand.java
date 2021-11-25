package kr.or.gw.command;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.gw.dto.DbxVO;

public class DbxRegistCommand {
	
	private String sj;
	private String cn;
	private int empno;
	private String emp_nm;
	private List<MultipartFile> uploadFile; //첨부파일
	
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
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
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}

	@Override
	public String toString() {
		return "DbxRegistCommand [sj=" + sj + ", cn=" + cn + ", empno=" + empno + ", emp_nm=" + emp_nm + "]";
	}

	public DbxVO toDbxVO() {
		DbxVO dbx = new DbxVO();
		dbx.setSj(this.sj);
		dbx.setRgsde(new Date());
		dbx.setEmpno(this.empno);
		dbx.setCn(this.cn);
		dbx.setEmp_nm(this.emp_nm);
		
		return dbx;
	}
}
