package kr.or.gw.command;

import java.util.Date;

import kr.or.gw.dto.SchdulMngtVO;

public class SchModifyCommand extends SchRegistCommand{
	
	private int empno;
	private String nm;
	private String schdul_no; //일정번호
	private String schdul_code; // 일정코드
	private String schdul_sj; // 일정제목
	private String schdul_cn; // 일정내용
	private String bgnde; // 시작일
	private String endde; // 종료일
	private String cnrs_at; // 공유여부

	private String bg_color; // 배경 색깔
	
	
	
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getSchdul_no() {
		return schdul_no;
	}
	public void setSchdul_no(String schdul_no) {
		this.schdul_no = schdul_no;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getSchdul_code() {
		return schdul_code;
	}
	public void setSchdul_code(String schdul_code) {
		this.schdul_code = schdul_code;
	}
	public String getSchdul_sj() {
		return schdul_sj;
	}
	public void setSchdul_sj(String schdul_sj) {
		this.schdul_sj = schdul_sj;
	}
	public String getSchdul_cn() {
		return schdul_cn;
	}
	public void setSchdul_cn(String schdul_cn) {
		this.schdul_cn = schdul_cn;
	}
	public String getBgnde() {
		return bgnde;
	}
	public void setBgnde(String bgnde) {
		this.bgnde = bgnde;
	}
	public String getEndde() {
		return endde;
	}
	public void setEndde(String endde) {
		this.endde = endde;
	}
	public String getCnrs_at() {
		return cnrs_at;
	}
	public void setCnrs_at(String cnrs_at) {
		this.cnrs_at = cnrs_at;
	}
	public String getBg_color() {
		return bg_color;
	}
	public void setBg_color(String bg_color) {
		this.bg_color = bg_color;
	}

	@Override
	public SchdulMngtVO toSchdulMngtVO() {
		SchdulMngtVO sch = super.toSchdulMngtVO();
		sch.setSchdul_no(schdul_no);
		sch.setEmpno(empno);
		sch.setNm(nm);
		sch.setSchdul_code(schdul_code);
		sch.setSchdul_sj(schdul_sj);
		sch.setSchdul_cn(schdul_cn);
		sch.setBgnde(bgnde);
		sch.setEndde(endde);
		sch.setCnrs_at(cnrs_at);
		sch.setBg_color(bg_color);
		
		return sch;
	}

	
	
}