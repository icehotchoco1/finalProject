package kr.or.gw.dto;

import java.util.Date;

public class DclzComVO {

	private String nm; // 이름
	private int empno; // 사번
	private String dept_code; // 부서명
	private String clsf_code; // 직책명
	private Date sysdate; // 직책명
	private String face_photo; // 사진
	
	private String month_h; // 한달 h
	private String month_m; // 한달 m
	
	private String one_h; // 1주 h
	private String one_m; // 1주 m
	
	private String two_h; // 2주 h
	private String two_m; // 2주 m
	
	private String three_h; // 3주 h
	private String three_m; // 3주 m
	
	private String four_h; // 4주 h
	private String four_m; // 4주 m
	
	private String five_h; // 5주 h
	private String five_m; // 5주 m
	
	private int tardy; // 지각
	private int earlyLeave; // 조퇴
	private int absenteeism; // 결근
	
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getDept_code() {
		return dept_code;
	}
	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}
	public String getClsf_code() {
		return clsf_code;
	}
	public void setClsf_code(String clsf_code) {
		this.clsf_code = clsf_code;
	}
	public String getMonth_h() {
		return month_h;
	}
	public void setMonth_h(String month_h) {
		this.month_h = month_h;
	}
	public String getMonth_m() {
		return month_m;
	}
	public void setMonth_m(String month_m) {
		this.month_m = month_m;
	}
	public String getOne_h() {
		return one_h;
	}
	public void setOne_h(String one_h) {
		this.one_h = one_h;
	}
	public String getOne_m() {
		return one_m;
	}
	public void setOne_m(String one_m) {
		this.one_m = one_m;
	}
	public String getTwo_h() {
		return two_h;
	}
	public void setTwo_h(String two_h) {
		this.two_h = two_h;
	}
	public String getTwo_m() {
		return two_m;
	}
	public void setTwo_m(String two_m) {
		this.two_m = two_m;
	}
	public String getThree_h() {
		return three_h;
	}
	public void setThree_h(String three_h) {
		this.three_h = three_h;
	}
	public String getThree_m() {
		return three_m;
	}
	public void setThree_m(String three_m) {
		this.three_m = three_m;
	}
	public String getFour_h() {
		return four_h;
	}
	public void setFour_h(String four_h) {
		this.four_h = four_h;
	}
	public String getFour_m() {
		return four_m;
	}
	public void setFour_m(String four_m) {
		this.four_m = four_m;
	}
	public String getFive_h() {
		return five_h;
	}
	public void setFive_h(String five_h) {
		this.five_h = five_h;
	}
	public String getFive_m() {
		return five_m;
	}
	public void setFive_m(String five_m) {
		this.five_m = five_m;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public Date getSysdate() {
		return sysdate;
	}
	public void setSysdate(Date sysdate) {
		this.sysdate = sysdate;
	}
	public String getFace_photo() {
		return face_photo;
	}
	public void setFace_photo(String face_photo) {
		this.face_photo = face_photo;
	}
	public int getTardy() {
		return tardy;
	}
	public void setTardy(int tardy) {
		this.tardy = tardy;
	}
	public int getAbsenteeism() {
		return absenteeism;
	}
	public void setAbsenteeism(int absenteeism) {
		this.absenteeism = absenteeism;
	}
	public int getEarlyLeave() {
		return earlyLeave;
	}
	public void setEarlyLeave(int earlyLeave) {
		this.earlyLeave = earlyLeave;
	}
	
	

}
