package kr.or.gw.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.gw.dto.EccstSanctnMngtVO;

public class EccstRegistCommand {
	private String userNum;
	private String userNm;
	private String sanctners;
	private String refferers;
	private String formNo;
	private String formSj;
	private String scrty;
	private String prsrv;
	private Date limit;
	private String ipcr;
	private String sttus;
	private String cn;
	private Date startDate;
	private Date endDate;
	
	private List<MultipartFile> uplFile;


	public List<MultipartFile> getUplFile() {
		return uplFile;
	}

	public void setUplFile(List<MultipartFile> uplFile) {
		this.uplFile = uplFile;
	}

	public String getUserNum() {
		return userNum;
	}

	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}

	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}


	
	public String getSanctners() {
		return sanctners;
	}

	public void setSanctners(String sanctners) {
		this.sanctners = sanctners;
	}

	public String getRefferers() {
		return refferers;
	}

	public void setRefferers(String refferers) {
		this.refferers = refferers;
	}


	public String getFormNo() {
		return formNo;
	}

	public void setFormNo(String formNo) {
		this.formNo = formNo;
	}

	public String getFormSj() {
		return formSj;
	}

	public void setFormSj(String formSj) {
		this.formSj = formSj;
	}


	public String getScrty() {
		return scrty;
	}

	public void setScrty(String scrty) {
		this.scrty = scrty;
	}



	public String getPrsrv() {
		return prsrv;
	}

	public void setPrsrv(String prsrv) {
		this.prsrv = prsrv;
	}

	public Date getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		
		System.out.println(limit+"<---limit");
		if(!limit.equals("")) {
			SimpleDateFormat sfm = new SimpleDateFormat("yyyy-MM-dd");
			try {
				this.limit = sfm.parse(limit);
			} catch (ParseException e) {
				this.limit = null;
			}
		}else {
			this.limit = null;
		}
	}

	public String getIpcr() {
		return ipcr;
	}

	public void setIpcr(String ipcr) {
		this.ipcr = ipcr;
	}

	public String getSttus() {
		return sttus;
	}

	public void setSttus(String sttus) {
		this.sttus = sttus;
	}

	public String getCn() {
		return cn;
	}

	public void setCn(String cn) {
		this.cn = cn;
	}


	public Date getStartDate() {
		
		return startDate;
	}

	public void setStartDate(String startDate) {
		
		if(!startDate.equals("no")) {
			SimpleDateFormat sfm = new SimpleDateFormat("yyyy-MM-dd");
			
			try {
				this.startDate = sfm.parse(startDate.replace("/", "-"));
			}catch (Exception e) {
				this.startDate=null;
			}
			
		}else {
			this.startDate=null;
		}
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		SimpleDateFormat sfm = new SimpleDateFormat("yyyy-MM-dd");
		
		if(!endDate.equals("no")) {
			try {
				this.endDate = sfm.parse(endDate.replace("/", "-"));
			} catch (ParseException e) {
				this.endDate = null;
			}
			
		}else {
			this.endDate = null;
		}
		
	}

	
	public EccstSanctnMngtVO toEccstVo() {
		EccstSanctnMngtVO ecst = new EccstSanctnMngtVO();
		
		ecst.setEmpno(Integer.parseInt(userNum));
		ecst.setNm(userNm);
		ecst.setForm_no(formNo);
		ecst.setSj(formSj);
		ecst.setScrty_grad(scrty);
		ecst.setPrsrv_pd(prsrv);
		ecst.setSanctn_tmlmt(limit);
		ecst.setIpcr_code(ipcr);
		ecst.setSttus_code(sttus);
		ecst.setCn(cn);
		ecst.setBgnde(startDate);
		ecst.setEndde(endDate);
		
		return ecst;
		
	}
	
	
}
