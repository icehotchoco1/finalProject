package kr.or.gw.command;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.gw.dto.BbsCmpnyDsptchVO;

public class NewsRegistCommand {
	
	private String sj;
	private String cn;
	private int empno;
	private String emp_nm;
	private List<MultipartFile> uploadFile;
	
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
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
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}
	@Override
	public String toString() {
		return "NewsRegistCommand [sj=" + sj + ", cn=" + cn + ", empno=" + empno + ", emp_nm=" + emp_nm + "]";
	}
	
	public BbsCmpnyDsptchVO toBbsCmpnyDsptchVO() {
		BbsCmpnyDsptchVO news = new BbsCmpnyDsptchVO();
		news.setSj(this.sj);
		news.setRgsde(new Date());
		news.setEmpno(this.empno);
		news.setEmp_nm(this.emp_nm);
		news.setCn(this.cn);
		
		return news;
	}
}
