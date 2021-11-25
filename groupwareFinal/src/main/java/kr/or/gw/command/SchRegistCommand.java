package kr.or.gw.command;

import java.util.Date;

import kr.or.gw.dto.SchdulMngtVO;

public class SchRegistCommand {

	private int empno;
	private String nm;

	private String schdul_code; // 일정코드
	private String schdul_sj; // 일정제목
	private String schdul_cn; // 일정내용
	private String bgnde; // 시작일
	private String endde; // 종료일
	private String cnrs_at; // 공유여부
	private String bg_color; // 배경 색깔
	private String dept_code; // 부서코드

	
	public String getDept_code() {
		return dept_code;
	}
	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
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

/*		try {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			this.bgnde = transFormat.parse(bgnde);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

*/

		this.bgnde = bgnde;
	}
	public String getEndde() {
		return endde;
	}
	public void setEndde(String endde) {
		/*try {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			this.endde = transFormat.parse(endde);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
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
	public String toString() {
		return "SchRegistCommand [empno=" + empno + ", schdul_code=" + schdul_code + ", schdul_sj=" + schdul_sj
				+ ", schdul_cn=" + schdul_cn + ", bgnde=" + bgnde + ", endde=" + endde + ", cnrs_at=" + cnrs_at
				+ ", bg_color=" + bg_color + "]";
	}
	
	public SchdulMngtVO toSchdulMngtVO() {

		SchdulMngtVO sch = new SchdulMngtVO();
		sch.setNm(this.nm);
		sch.setEmpno(this.empno);
		sch.setSchdul_code(this.schdul_code);
		sch.setSchdul_sj(this.schdul_sj);
		sch.setSchdul_cn(this.schdul_cn);
		sch.setBgnde(this.bgnde);
		sch.setEndde(this.endde);
		sch.setCnrs_at(this.cnrs_at);
		sch.setBg_color(this.bg_color);
		sch.setDept_code(this.dept_code);

		return sch;
	}
}
