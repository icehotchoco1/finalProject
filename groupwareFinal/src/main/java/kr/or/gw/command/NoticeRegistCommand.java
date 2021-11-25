package kr.or.gw.command;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.gw.dto.BbsNtbdVO;

public class NoticeRegistCommand {

	private String sj;
	private String cn;
	private int empno;
	private String emp_nm; // 작성자명
	private List<MultipartFile> uploadFile;
	
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
	
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public BbsNtbdVO toBbsNtbdVO() {
		BbsNtbdVO notice = new BbsNtbdVO();
		notice.setSj(this.sj);
		notice.setCn(this.cn);
		notice.setEmpno(this.empno);
		notice.setEmp_nm(this.emp_nm);
		notice.setRgsde(new Date());
		
		return notice;
	}
	
	

}
