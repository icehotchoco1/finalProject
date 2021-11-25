package kr.or.gw.command;

import kr.or.gw.dto.JobAnswerVO;

public class JobAnsModifyCommand extends JobAnsRegistCommand{

	private String answer_no;

	public String getAnswer_no() {
		return answer_no;
	}

	public void setAnswer_no(String answer_no) {
		this.answer_no = answer_no;
	}
	
	@Override
	public JobAnswerVO toJobAnswerVO() {
		JobAnswerVO ans = super.toJobAnswerVO();
		ans.setAnswer_no(this.answer_no);
		
		return ans;
	}
	
}
