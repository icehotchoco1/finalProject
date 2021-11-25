package kr.or.gw.dto;

/**
 * @author 장하늘
 * 일정참여자VO
 */
public class SchdulPrtcpntVO {
	
	private int prtcpnt_empno; //참여자사번
	private String schdul_no; //일정번호

	public int getPrtcpnt_empno() {
		return prtcpnt_empno;
	}
	public void setPrtcpnt_empno(int prtcpnt_empno) {
		this.prtcpnt_empno = prtcpnt_empno;
	}
	public String getSchdul_no() {
		return schdul_no;
	}
	public void setSchdul_no(String schdul_no) {
		this.schdul_no = schdul_no;
	}
	
	

}
