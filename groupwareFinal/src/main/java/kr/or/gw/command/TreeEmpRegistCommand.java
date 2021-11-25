package kr.or.gw.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import kr.or.gw.dto.OrgnztEmpMngtVO;

public class TreeEmpRegistCommand {
	private String empno;
	private String nm;
	private String[] cttpc;
	private String[] fxnum;
	private String dept_code;
	private String clsf_code;
	private String rspofc_code;
	private Date encpn;
	private String ip_adres;
	private String email_adres;
	private String face_photo;
	
	
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String[] getCttpc() {
		return cttpc;
	}
	public void setCttpc(String[] cttpc) {
		this.cttpc = cttpc;
	}
	public String[] getFxnum() {
		return fxnum;
	}
	public void setFxnum(String[] fxnum) {
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
	public void setEncpn(String encpn) {
		SimpleDateFormat sfm = new SimpleDateFormat("yyyy-MM-dd");
		
		
		
		try {
			this.encpn = sfm.parse(encpn);
		} catch (ParseException e) {
			e.printStackTrace();
			this.encpn = null;
		}
	}
	public String getIp_adres() {
		return ip_adres;
	}
	public void setIp_adres(String ip_adres) {
		this.ip_adres = ip_adres;
	}
	public String getEmail_adres() {
		return email_adres;
	}
	public void setEmail_adres(String email_adres) {
		this.email_adres = email_adres;
	}
	public String getFace_photo() {
		return face_photo;
	}
	public void setFace_photo(String face_photo) {
		this.face_photo = face_photo;
	}
	
	public OrgnztEmpMngtVO toEmpVO() {
		String cttpc = "";
		int i = 0;
		for (String data : this.cttpc) {
			if(i == 0) {
				cttpc += data;
			}else {
				cttpc += "-"+data;
			}
			i++;
		}
		String fxnum = "";
		for (String data : this.fxnum) {
			if(i == 0) {
				fxnum += data;
			}else {
				fxnum += "-"+data;
			}
			
			
		}
		
		OrgnztEmpMngtVO emp = new OrgnztEmpMngtVO();
		emp.setEmpno(Integer.parseInt(empno));
		
		
		emp.setNm(nm);
		emp.setCttpc(cttpc);
		emp.setFxnum(fxnum);
		emp.setDept_code(dept_code);
		emp.setClsf_code(clsf_code);
		emp.setRspofc_code(rspofc_code);
		emp.setEncpn(encpn);
		emp.setPassword(empno+"!");
		emp.setIp_adres(ip_adres);
		emp.setEmail_adres(email_adres);
		emp.setFace_photo(face_photo);
		
		return emp;
	}
	
}
