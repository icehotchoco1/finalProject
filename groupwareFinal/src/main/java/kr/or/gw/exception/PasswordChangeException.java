package kr.or.gw.exception;

public class PasswordChangeException extends Exception {

	public PasswordChangeException() {
		super("비밀번호를 변경해주십시오.");
	}
}
