package kr.or.gw.dto;


/**
 * @author 장하늘
 * 업무확인VO
 */
public class JobCnfirmVO {
	
	private String sn; //일련번호
	private int job_cnfirm_co; //업무확인횟수
	private int job_cnfirm_cycle; //업무확인주기
	
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	public int getJob_cnfirm_co() {
		return job_cnfirm_co;
	}
	public void setJob_cnfirm_co(int job_cnfirm_co) {
		this.job_cnfirm_co = job_cnfirm_co;
	}
	public int getJob_cnfirm_cycle() {
		return job_cnfirm_cycle;
	}
	public void setJob_cnfirm_cycle(int job_cnfirm_cycle) {
		this.job_cnfirm_cycle = job_cnfirm_cycle;
	}

	
}
