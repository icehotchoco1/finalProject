package kr.or.gw.security;

import java.sql.SQLException;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;

import kr.or.gw.dao.EmpDAO;
import kr.or.gw.dto.OrgnztEmpMngtVO;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	private EmpDAO empDAO;

	public void setEmpDAO(EmpDAO empDAO) {
		this.empDAO = empDAO;
	}

	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		int empno = (Integer.parseInt((String) auth.getPrincipal())); // 로그인 시도한 ID를 가져온다.
		String pw = (String) auth.getCredentials(); // 로그인 시도한 Password를 가져온다.

		System.out.println(empno);
		System.out.println(pw);

		OrgnztEmpMngtVO empVO = null;
		try {
			empVO = empDAO.selectEmpByEmpno(empno);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AuthenticationServiceException("Internal server error!");
		}

		if (empVO != null) {
			if (pw.equals(empVO.getPassword())) {
				UserDetails authUser = new User(empVO);
				boolean invalidCheck = authUser.isAccountNonExpired() && authUser.isAccountNonLocked()
						&& authUser.isCredentialsNonExpired() && authUser.isEnabled();
				if (invalidCheck) {
					// 스프링 시큐리티 내부 클래스로 인증토큰을 생성한다.
					UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(
							authUser.getUsername(), authUser.getPassword(), authUser.getAuthorities());
					
					// 전달할 내용을 설정한 후
					result.setDetails(authUser);
					// 리턴한다. successHandler로 전송된다.
					return result;
				
				} else {
					throw new BadCredentialsException("로그인이 거부되었습니다.");
				}
			} else {
				throw new BadCredentialsException("패스워드가 일치하지 않습니다.");
			}

		} else {
			throw new BadCredentialsException("존재하지 않는 아이디입니다.");
		}

	}

	@Override
	public boolean supports(Class<?> auth) {
		return auth.equals(UsernamePasswordAuthenticationToken.class);
	}

}