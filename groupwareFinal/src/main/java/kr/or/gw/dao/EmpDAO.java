package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.command.Criteria;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public interface EmpDAO {
	
	
	// 회원정보 조회
	OrgnztEmpMngtVO selectEmpByEmpno(int empno) throws SQLException;
	
	//회원리스트 조회
	List<OrgnztEmpMngtVO> selectEmpList()throws SQLException;
	List<OrgnztEmpMngtVO> selectEmpList(Criteria cri)throws SQLException;
	List<OrgnztEmpMngtVO> selectEmpList(SearchCriteria cri)throws SQLException;
	
	// 검색 결과의 전체 리스트 개수
	int selectEmpListCount(SearchCriteria cri) throws SQLException;
	
	// 회원 추가
	public void insertEmp(OrgnztEmpMngtVO emp) throws SQLException;

	// 회원 수정
	public void updateEmp(OrgnztEmpMngtVO emp) throws SQLException;
	
	// 회원정보 삭제
	void deleteEmp(int empno) throws SQLException;

	// 회원정지
	void disabledEmp(int empno) throws SQLException;

	// 회원 활성화
	void enabledEmp(int empno) throws SQLException;
	
	// 비번 변경
	void modifyPw(OrgnztEmpMngtVO emp) throws SQLException;
	
	// 비번 변경 (로그인화면에서 )
	void modifyPwMain(OrgnztEmpMngtVO emp) throws SQLException;
	
	//같은 부서 사람들 가져오기
	List<OrgnztEmpMngtVO> getDeptPeople(String dept_code) throws SQLException;
}








