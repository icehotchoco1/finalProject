package kr.or.gw.dto;

import java.util.Date;
import kr.or.gw.dto.CodeVO;
import kr.or.gw.dto.DclzMngtVO;


/**
 * @author 장하늘
 * 임직원VO
 */

public class OrgnztEmpMngtVO {
	
	private int empno; //사번
	private String nm; //이름
	private String cttpc; //연락처
	private String fxnum; //팩스번호
	private String dept_code; //부서코드
	private String clsf_code; //직급코드
	private String rspofc_code; //직책코드
	private Date encpn; //입사일
	private Date retire_de; //퇴사일
	private String password; //비밀번호
	private String sanctn_password; //결재 비밀번호
	private int actvty_at; //활성여부
	private String ip_adres; //ip주소
	private String face_recog_info; //얼굴인식정보
	private String email_adres; //이메일주소
	private String author_code; //권한코드
	private String face_photo; // 얼굴사진
	private String sanctn_sign; //결재서명
	
	
	//부서근태조회때문에 추가했음_하늘
	
	private Date attend_time; //출근시간
	private Date lvffc_time; //퇴근시간
	private String sttus_code; //상태코드
	
	// 불만있음 정재헌한테 가쇼
	
	private String time; // 일한시간
	private Date rgsde; // 등록시간
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Date getRgsde() {
		return rgsde;
	}
	public void setRgsde(Date rgsde) {
		this.rgsde = rgsde;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getCttpc() {
		return cttpc;
	}
	public void setCttpc(String cttpc) {
		this.cttpc = cttpc;
	}
	public String getFxnum() {
		return fxnum;
	}
	public void setFxnum(String fxnum) {
		this.fxnum = fxnum;
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
	public String getRspofc_code() {
		return rspofc_code;
	}
	public void setRspofc_code(String rspofc_code) {
		this.rspofc_code = rspofc_code;
	}
	public Date getEncpn() {
		return encpn;
	}
	public void setEncpn(Date encpn) {
		this.encpn = encpn;
	}
	public Date getRetire_de() {
		return retire_de;
	}
	public void setRetire_de(Date retire_de) {
		this.retire_de = retire_de;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSanctn_password() {
		return sanctn_password;
	}
	public void setSanctn_password(String sanctn_password) {
		this.sanctn_password = sanctn_password;
	}
	public int getActvty_at() {
		return actvty_at;
	}
	public void setActvty_at(int actvty_at) {
		this.actvty_at = actvty_at;
	}
	public String getIp_adres() {
		return ip_adres;
	}
	public void setIp_adres(String ip_adres) {
		this.ip_adres = ip_adres;
	}
	public String getFace_photo() {
		return face_photo;
	}
	public void setFace_photo(String face_photo) {
		this.face_photo = face_photo;
	}
	public String getFace_recog_info() {
		return face_recog_info;
	}
	public void setFace_recog_info(String face_recog_info) {
		this.face_recog_info = face_recog_info;
	}
	public String getEmail_adres() {
		return email_adres;
	}
	public void setEmail_adres(String email_adres) {
		this.email_adres = email_adres;
	}
	public String getAuthor_code() {
		return author_code;
	}
	public String getSanctn_sign() {
		return sanctn_sign;
	}
	public void setSanctn_sign(String sanctn_sign) {
		this.sanctn_sign = sanctn_sign;
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
	public void setAuthor_code(String author_code) {
		this.author_code = author_code;
	}
	public String getSttus_code() {
		return sttus_code;
	}
	public void setSttus_code(String sttus_code) {
		this.sttus_code = sttus_code;
	}
	
	
	
	
/*
	private DclzMngtVO dclzMngtVO;
	private CodeVO codeVO;
	
	public DclzMngtVO getDclzMngtVO() {
		return dclzMngtVO;
	}
	public void setDclzMngtVO(DclzMngtVO dclzMngtVO) {
		this.dclzMngtVO = dclzMngtVO;
	}
	public CodeVO getCodeVO() {
		return codeVO;
	}
	public void setCodeVO(CodeVO codeVO) {
		this.codeVO = codeVO;
	}
	public void setAuthor_code(String author_code) {
		this.author_code = author_code;
	}*/

}
