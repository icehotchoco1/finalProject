 package kr.or.gw.dto;

/**
 * @author 장하늘
 *근태관리테이블에 대한 VO
 */

public class DclzVacVO {
	
	private String vcatn_no;
	private String vcatn_code;
	private int empno;
	private int tot_vcatn_daycnt;
	private float use_vcatn_daycnt;
	private String empnm;
	private String sanctn_no;
	
	private EccstSanctnMngtVO sanctnVO;
	private DclzVacCodeVO vacCodeVO;

	public DclzVacCodeVO getVacCodeVO() {
		return vacCodeVO;
	}
	public void setVacCodeVO(DclzVacCodeVO vacCodeVO) {
		this.vacCodeVO = vacCodeVO;
	}
	public EccstSanctnMngtVO getSanctnVO() {
		return sanctnVO;
	}
	public void setSanctnVO(EccstSanctnMngtVO sanctnVO) {
		this.sanctnVO = sanctnVO;
	}
	public String getSanctn_no() {
		return sanctn_no;
	}
	public void setSanctn_no(String sanctn_no) {
		this.sanctn_no = sanctn_no;
	}
	public String getEmpnm() {
		return empnm;
	}
	public void setEmpnm(String empnm) {
		this.empnm = empnm;
	}
	public String getVcatn_no() {
		return vcatn_no;
	}
	public void setVcatn_no(String vcatn_no) {
		this.vcatn_no = vcatn_no;
	}
	public String getVcatn_code() {
		return vcatn_code;
	}
	public void setVcatn_code(String vcatn_code) {
		this.vcatn_code = vcatn_code;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getTot_vcatn_daycnt() {
		return tot_vcatn_daycnt;
	}
	public void setTot_vcatn_daycnt(int tot_vcatn_daycnt) {
		this.tot_vcatn_daycnt = tot_vcatn_daycnt;
	}
	public float getUse_vcatn_daycnt() {
		return use_vcatn_daycnt;
	}
	public void setUse_vcatn_daycnt(float use_vcatn_daycnt) {
		this.use_vcatn_daycnt = use_vcatn_daycnt;
	}
	
}
