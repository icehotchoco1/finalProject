package kr.or.gw.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.gw.dto.BbsMngtbdVO;

public class MngtRegistCommand {
	private String sj;
	private String emp_nm;
	private String empno;
	private String cn;
	private List<MultipartFile> uploadFile;
	public String getSj() {
		return sj;
	}
	public void setSj(String sj) {
		this.sj = sj;
	}
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}
	public String getCn() {
		return cn;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public void setCn(String cn) {
		this.cn = cn;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	

	public BbsMngtbdVO toBbsMngtbdVO() {
		BbsMngtbdVO mngt = new BbsMngtbdVO();
		mngt.setCn(this.cn);
		mngt.setSj(this.sj);
		mngt.setEmp_nm(this.emp_nm);
		mngt.setEmpno(Integer.parseInt(this.empno));
		
		return mngt;
	}
	
	

}
