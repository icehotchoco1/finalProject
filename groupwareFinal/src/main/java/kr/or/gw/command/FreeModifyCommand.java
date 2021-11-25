package kr.or.gw.command;

import kr.or.gw.dto.BbsFreebdVO;

public class FreeModifyCommand extends FreeRegistCommand {
	private String bbsctt_no;
	private String[] deleteFile;
	
	public String getBbsctt_no() {
		return bbsctt_no;
	}
	public void setBbsctt_no(String bbsctt_no) {
		this.bbsctt_no = bbsctt_no;
	}
	public String[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	
	@Override
	public BbsFreebdVO toBbsFreebdVO() {
		BbsFreebdVO free = super.toBbsFreebdVO();
		free.setBbsctt_no(bbsctt_no);
		
		return free;
	}
	
	
	
}
