 package kr.or.gw.dto;

import java.util.Date;

/**
 * @author 장하늘
 *근태관리테이블에 대한 VO
 */

public class DclzMngtVO {
	
	private String dclz_no; //근태번호
	private int empno; //사번
	private Date attend_time; //출근시간
	private Date lvffc_time; //퇴근시간
	private int adit_work_time; //추가근무시간
	private Date rgsde; //등록일
	private String sttus_code; //상태코드
	
	private String day; //일수
	private String time; // 시간
	
	private String datee; // 차트 시간 
	private String data; // 차트 데이터
	
	private String month_h; // 한달 h
	private String month_m; // 한달 m
	
	private String front; // 시차출 앞
	private String back; // 시차출 뒤
	
	private OrgnztEmpMngtVO empVO;
	
	public OrgnztEmpMngtVO getEmpVO() {
		return empVO;
	}
	public void setEmpVO(OrgnztEmpMngtVO empVO) {
		this.empVO = empVO;
	}
	public String getFront() {
		return front;
	}
	public void setFront(String front) {
		this.front = front;
	}
	public String getBack() {
		return back;
	}
	public void setBack(String back) {
		this.back = back;
	}
	
	
	public String getDatee() {
		return datee;
	}
	public void setDatee(String datee) {
		this.datee = datee;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDclz_no() {
		return dclz_no;
	}
	public void setDclz_no(String dclz_no) {
		this.dclz_no = dclz_no;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public Date getAttend_time() {
		return attend_time;
	}
	public void setAttend_time(Date attend_time) {
		this.attend_time = attend_time;
	}
	public Date getLvffc_time() {
		return lvffc_time;
	}
	public void setLvffc_time(Date lvffc_time) {
		this.lvffc_time = lvffc_time;
	}
	public int getAdit_work_time() {
		return adit_work_time;
	}
	public void setAdit_work_time(int adit_work_time) {
		this.adit_work_time = adit_work_time;
	}
	public Date getRgsde() {
		return rgsde;
	}
	public void setRgsde(Date rgsde) {
		this.rgsde = rgsde;
	}
	public String getSttus_code() {
		return sttus_code;
	}
	public void setSttus_code(String sttus_code) {
		this.sttus_code = sttus_code;
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

	
	
}
