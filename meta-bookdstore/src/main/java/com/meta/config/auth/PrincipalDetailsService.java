package com.meta.config.auth;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.meta.cart.mapper.CartMapper;
import com.meta.member.mapper.MemberMapper;
import com.meta.member.vo.MemberVO;



@Service
public class PrincipalDetailsService implements UserDetailsService{
	
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private CartMapper cartMapper;
	
	private static final Logger log = LoggerFactory.getLogger(PrincipalDetailsService.class);

	//1.패스워드를 알아서 체킹하니까 신경쓸 필요가 없다.
	//2.리턴이 잘되면 자동으로 UserDetails타입(=new PrincipalDetails)한것을 세션으로 만든다.
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// username = id이다. 
		log.info("넘겨온 id : " + username);
		MemberVO memberEntity = mapper.findByMemberId(username);
		log.info("memberEntity : " + memberEntity);
		if(memberEntity==null) {
			throw new UsernameNotFoundException(username);			
		}else {
			memberEntity.setCartCount(cartMapper.getCartCount(memberEntity.getM_no()));
			return new PrincipalDetails(memberEntity);
		}
	}
	
}
