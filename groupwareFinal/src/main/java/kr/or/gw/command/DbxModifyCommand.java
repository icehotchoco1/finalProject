package kr.or.gw.command;

import kr.or.gw.dto.DbxVO;

public class DbxModifyCommand extends DbxRegistCommand{
	
	private String dbx_no;
	private String sj;
	private String cn;
	private String[] deleteFile;

	
	public String[] getDeleteFile() {
		return deleteFile;
	}
	public void setDeleteFile(String[] deleteFile) {
		this.deleteFile = deleteFile;
	}
	public String getDbx_no() {
		return dbx_no;
	}
	public void setDbx_no(String dbx_no) {
		this.dbx_no = dbx_no;
	}
	public String getSj() {
		return sj;
	}
	public void setSj(String sj) {
		this.sj = sj;
	}
	public String getCn() {
		return cn;
	}
	public void setCn(String cn) {
		this.cn = cn;
	}
	@Override
	public DbxVO toDbxVO() {
		DbxVO dbx = super.toDbxVO();
		dbx.setDbx_no(dbx_no);
		dbx.setCn(cn);
		dbx.setSj(sj);
		
		return dbx;
	}

	
	
}