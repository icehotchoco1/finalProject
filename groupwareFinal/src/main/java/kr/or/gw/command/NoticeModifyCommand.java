package kr.or.gw.command;

import kr.or.gw.dto.BbsNtbdVO;

public class NoticeModifyCommand extends NoticeRegistCommand{
	
	private String bbsctt_no;
	private String sj;
	private String cn;
	private String[] deleteFile;

	public String getBbsctt_no() {
		return bbsctt_no;
	}

	public void setBbsctt_no(String bbsctt_no) {
		this.bbsctt_no = bbsctt_no;
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
	public String[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	
	@Override
	public BbsNtbdVO toBbsNtbdVO() {
		BbsNtbdVO notice = super.toBbsNtbdVO();
		notice.setBbsctt_no(bbsctt_no);
		notice.setCn(cn);
		notice.setSj(sj);
		
		return notice;
	}

	
	
}