package kr.or.gw.dto;

/**
 * @author 장하늘
 * 첨부파일에 대한 VO
 */


public class AtchMnflVO {
	private String file_no; //파일번호
	private String file_nm; //파일명
	private String file_type; //확장자명
	private String bbsctt_no; //게시글번호
	private int atch_order; //저장순번
	private String uploadpath;//파일 경로
	
	
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	public String getBbsctt_no() {
		return bbsctt_no;
	}
	public void setBbsctt_no(String bbsctt_no) {
		this.bbsctt_no = bbsctt_no;
	}
	public int getAtch_order() {
		return atch_order;
	}
	public void setAtch_order(int atch_order) {
		this.atch_order = atch_order;
	}
	public String getUploadpath() {
		return uploadpath;
	}
	public void setUploadpath(String uploadpath) {
		this.uploadpath = uploadpath;
	}
	public String getFile_no() {
		return file_no;
	}
	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}
	public String getFile_nm() {
		return file_nm;
	}
	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}
	
	
}
