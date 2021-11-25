package kr.or.gw.command;

import kr.or.gw.dto.OrgnztEmpMngtVO;

public class MypageModifyCommand {
	private String cttpc = ""; // 연락처
	private String email_adres = ""; // 이메일주소
	private String password = ""; // 비밀번호

	public String getCttpc() {
		return cttpc;
	}

	public void setCttpc(String cttpc) {
		this.cttpc = cttpc;
	}

	public String getEmail_adres() {
		return email_adres;
	}

	public void setEmail_adres(String email_adres) {
		this.email_adres = email_adres;
	}
	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public OrgnztEmpMngtVO toOrgnztEmpMngtVO() {
		OrgnztEmpMngtVO empVO = new OrgnztEmpMngtVO();
		empVO.setCttpc(this.cttpc);
		empVO.setEmail_adres(this.email_adres);
		empVO.setPassword(this.password);

		return empVO;
	}
}
