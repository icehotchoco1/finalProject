package kr.or.gw.command;

import kr.or.gw.dto.EccstSanctnMngtVO;

public class EscMngtModifyCommand {

	private String sanctn_no;
	private String sj;

	public String getSanctn_no() {
		return sanctn_no;
	}

	public void setSanctn_no(String sanctn_no) {
		this.sanctn_no = sanctn_no;
	}

	public String getSj() {
		return sj;
	}

	public void setSj(String sj) {
		this.sj = sj;
	}
	
	public EccstSanctnMngtVO toEccstSanctnMngtVO() {
		EccstSanctnMngtVO escMngt = new EccstSanctnMngtVO();
		escMngt.setSanctn_no(this.sanctn_no);
		escMngt.setSj(this.sj);
		
		return escMngt;
	}
}
