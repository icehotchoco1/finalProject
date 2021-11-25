package kr.or.gw.command;

import java.util.ArrayList;
import java.util.List;

import kr.or.gw.dto.DbxCocnrVO;

public class DbxCcrShareCommand extends DbxPublicRegistCommand {

	private String dbx_no;
	private int cocnr_empno;
	private String cocnr_nm; 
	private String rcvr_empno;
	
	public String getCocnr_nm() {
		return cocnr_nm;
	}


	public void setCocnr_nm(String cocnr_nm) {
		this.cocnr_nm = cocnr_nm;
	}


	public String getRcvr_empno() {
		return rcvr_empno;
	}


	public void setRcvr_empno(String rcvr_empno) {
		this.rcvr_empno = rcvr_empno;
	}




	public String getDbx_no() {
		return dbx_no;
	}


	public void setDbx_no(String dbx_no) {
		this.dbx_no = dbx_no;
	}



	public int getCocnr_empno() {
		return cocnr_empno;
	}


	public void setCocnr_empno(int cocnr_empno) {
		this.cocnr_empno = cocnr_empno;
	}


	public List<DbxCocnrVO> toDbxCocnrVOList() {
		
		List<DbxCocnrVO> dbxList = new ArrayList<DbxCocnrVO>();
		
		String spl1 = this.dbx_no;
		String spl2 = this.rcvr_empno;
		
		String[] split1 = spl1.split(",");
		String[] split2 = spl2.split(",");
		
 		for(int i = 0; i < split2.length; i++) {
 			for(int j = 0; j < split1.length; j++) {
 			DbxCocnrVO dbxCcr = new DbxCocnrVO();
 			dbxCcr.setCocnr_empno(this.cocnr_empno);
 			dbxCcr.setCocnr_nm(this.cocnr_nm);
// 			System.out.println("수신자 사번 : " + split2[i]);
 			
			dbxCcr.setRcvr_empno(Integer.parseInt(split2[i]));
//				System.out.println("공유 문서 번호 : " + split1[j]);
				dbxCcr.setDbx_no(split1[j]);
				dbxList.add(dbxCcr);
			}
			
		}
		
		return dbxList;
	}

}

