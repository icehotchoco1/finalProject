package kr.or.gw.command;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import kr.or.gw.dto.JobMngtVO;

public class WorkSendRegistCommand {

	private int drctr_empno;
	private String sj;
	private String cn; //내용
	private String im_code;//중요도코드
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date end_de; //마감기한
	private String emp_nm; //작성자이름
	private List<MultipartFile> uploadFile; //첨부파일
	private List<String[]> jrcvList;

	public List<String[]> getJrcvList() {
		return jrcvList;
	}
	public void setJrcvList(List<String[]> jrcvList) {
		this.jrcvList = jrcvList;
	}
	public Date getEnd_de() {
		return end_de;
	}
	public void setEnd_de(Date end_de) {
		this.end_de = end_de;
	}
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
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
	public String getIm_code() {
		return im_code;
	}
	public void setIm_code(String im_code) {
		this.im_code = im_code;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public JobMngtVO toJobMngtVO() {
		JobMngtVO job = new JobMngtVO();
		job.setDrctr_empno(this.drctr_empno);
		job.setSj(this.sj);
		job.setCn(this.cn);
		job.setIm_code(this.im_code);
		job.setEmp_nm(this.emp_nm);
		job.setEnd_de(this.end_de);
		
		return job;
	}
	
}
