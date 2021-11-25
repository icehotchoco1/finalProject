package kr.or.gw.command;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import kr.or.gw.dto.JobMngtVO;
import kr.or.gw.dto.JobRcvVO;

public class WorkSendModifyCommand extends WorkSendRegistCommand{
	
	private String job_no;
	private String sj;
	private String cn; //내용
	private String sttus_code;//상태코드
	private String im_code;//중요도코드
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date end_de; //마감기한
	private int rcver_progrs;
	private String[] deleteFile;
	private String job_index;

	public String getJob_index() {
		return job_index;
	}
	public void setJob_index(String job_index) {
		this.job_index = job_index;
	}
	public int getRcver_progrs() {
		return rcver_progrs;
	}
	public void setRcver_progrs(int rcver_progrs) {
		this.rcver_progrs = rcver_progrs;
	}
	public String getJob_no() {
		return job_no;
	}
	public void setJob_no(String job_no) {
		this.job_no = job_no;
	}
	public String[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	public Date getEnd_de() {
		return end_de;
	}
	public void setEnd_de(Date end_de) {
		this.end_de = end_de;
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
	public String getSttus_code() {
		return sttus_code;
	}
	public void setSttus_code(String sttus_code) {
		this.sttus_code = sttus_code;
	}
	public String getIm_code() {
		return im_code;
	}
	public void setIm_code(String im_code) {
		this.im_code = im_code;
	}
	
	public JobMngtVO toJobMngtVO() {
		JobMngtVO job = super.toJobMngtVO();
		job.setJob_no(job_no);
		job.setSj(sj);
		job.setCn(cn);
		job.setSttus_code(sttus_code);
		job.setIm_code(im_code);
		job.setEnd_de(end_de);
		
		return job;
	}
	
	public JobRcvVO toJobRcvVO() {
		JobRcvVO jRcv = new JobRcvVO();
		jRcv.setJob_index(this.job_index);
		jRcv.setRcver_progrs(this.rcver_progrs);
		return jRcv;
	}
}
