package kr.or.gw.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import kr.or.gw.dto.OrgnztEmpMngtVO;

public class User implements UserDetails {
   
   private OrgnztEmpMngtVO empVO;
   
   public User(OrgnztEmpMngtVO empVO) {
      this.empVO = empVO;
   }

   @Override
   public Collection<? extends GrantedAuthority> getAuthorities() {   // 권한을 뱉어주는 역할
      List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
      roles.add(new SimpleGrantedAuthority(empVO.getAuthor_code()));
      return roles;
   }

   @Override
   public String getPassword() {
      return empVO.getPassword();
   }

   @Override
   public String getUsername() {
      return String.valueOf(empVO.getEmpno());
   }

   @Override
   public boolean isAccountNonExpired() {   // 기간제계정의 경우 기간만료 여부 : enabled = 4
      return empVO.getActvty_at() != 4;
   }

   @Override
   public boolean isAccountNonLocked() {   // 사용정지 혹은 휴면계정 : enabled = 3
      return empVO.getActvty_at() != 3;
   }

   @Override
   public boolean isCredentialsNonExpired() {   // 인증정보 만료여부 : enabled = 2
      return empVO.getActvty_at() != 2;
   }

   @Override
   public boolean isEnabled() {   // 탈퇴 혹은 삭제 : enabled = 0
      return empVO.getActvty_at() != 0;
   }
   
   public OrgnztEmpMngtVO getOrgnztEmpMngtVO() {
      return this.empVO;
   }

}