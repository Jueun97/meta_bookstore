package com.meta.config.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.meta.member.vo.MemberVO;

import lombok.Data;

@Data
public class PrincipalDetails implements UserDetails{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private MemberVO member;
	
	public PrincipalDetails(MemberVO member) {
		this.member = member;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		//권한을 가져오는 함수 (타입 : 컬렉션, 권한은 한개가 아닐수도 있으니)
		//ex.어떤 사람은 3개 이상의 권한을 가지고 있으니
		Collection<GrantedAuthority> collector = new ArrayList<>();
		switch(member.getGrade()) {
		case "ADMIN" : collector.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
			break;
		case "USER" : collector.add(new SimpleGrantedAuthority("ROLE_USER"));
			break;
		}
		return collector;
	}

	@Override
	public String getPassword() {
		return member.getPassword();
	}

	@Override
	public String getUsername() {
		return member.getId();
	}

	@Override
	public boolean isAccountNonExpired() {
		//이계정이 만료가 안되었나?
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// 이 계정이 잠겻나?
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// 비번 안바꾼지 1년 된지 아닌지?
		return true;
	}

	@Override
	public boolean isEnabled() {
		// 이 계정이 활성화 되어있는지?
		return true;
	}
}
