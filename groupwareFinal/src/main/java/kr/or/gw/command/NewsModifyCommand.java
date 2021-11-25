package kr.or.gw.command;

import kr.or.gw.dto.BbsCmpnyDsptchVO;

public class NewsModifyCommand extends NewsRegistCommand{
	
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
	public BbsCmpnyDsptchVO toBbsCmpnyDsptchVO() {
		BbsCmpnyDsptchVO news = super.toBbsCmpnyDsptchVO();
		news.setBbsctt_no(bbsctt_no);
		news.setCn(cn);
		news.setSj(sj);
		
		return news;
	}

	
	
}