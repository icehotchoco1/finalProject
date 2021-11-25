package kr.or.gw.dto;


/**
 * @author 장하늘
 * 코드에 대한 VO
 */

public class CodeVO {
	
	private String code_no; //코드번호
	private String code_cl; //코드분류
	private String code_dc; //코드설명
	private String code_dtls; //코드상세
	
	public String getCode_dtls() {
		return code_dtls;
	}
	public void setCode_dtls(String code_dtls) {
		this.code_dtls = code_dtls;
	}
	public String getCode_no() {
		return code_no;
	}
	public void setCode_no(String code_no) {
		this.code_no = code_no;
	}
	public String getCode_cl() {
		return code_cl;
	}
	public void setCode_cl(String code_cl) {
		this.code_cl = code_cl;
	}
	public String getCode_dc() {
		return code_dc;
	}
	public void setCode_dc(String code_dc) {
		this.code_dc = code_dc;
	}

}
