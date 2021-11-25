package kr.or.gw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.Criteria;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.exception.InvalidPasswordException;
import kr.or.gw.exception.NotFoundIDException;
import kr.or.gw.exception.PasswordChangeException;

public interface EmpService {
	
	// 로그인
	void login(int empno, String pwd) throws SQLException, NotFoundIDException, 
															InvalidPasswordException, PasswordChangeException;
	// 회원정보조회
	OrgnztEmpMngtVO getEmp(int empno) throws SQLException;
	
	// 회원리스트조회
	List<OrgnztEmpMngtVO> getEmpList()throws SQLException;
	List<OrgnztEmpMngtVO> getEmpList(Criteria cri)throws SQLException;
	Map<String,Object> getEmpList(SearchCriteria cri)throws SQLException;
	
	//회원등록
	public void regist(OrgnztEmpMngtVO emp) throws SQLException;
	
	// 회원수정		
	void modify(OrgnztEmpMngtVO emp) throws SQLException;
	
	// 회원삭제
	void remove(int empno) throws SQLException;

	// 회원정지
	void disabled(int empno) throws SQLException;

	// 회원활성
	void enabled(int empno) throws SQLException;
	
	// 비번변경
	void modifyPw(OrgnztEmpMngtVO emp) throws SQLException;
	
	// 비번 변경 (로그인화면에서 )
	void modifyPwMain(OrgnztEmpMngtVO emp) throws SQLException;
	
	//같은 부서 사람들 가져오기
	List<OrgnztEmpMngtVO> getDeptPeople(String dept_code) throws SQLException;
}









