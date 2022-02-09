package com.meta.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity //해당 파일로 Security 활성화
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	UserDetailsService userDetailsService;
	
	//BCrypt Password설정부분 <- 나중에..
	@Bean
	public BCryptPasswordEncoder encode() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		//로그인한 사용자 정보를 조회할때 userDetailsService객체를 사용하라.
		//passwordEncoder()메소드가 리턴하는 객체를 사용하여, 비밀번호를 암호화 하라.
		auth.userDetailsService(userDetailsService)
			.passwordEncoder(encode());
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//super.configure(http); //삭제 시 기존 시큐리티가 가지고 있는 기능 비활성화
		http.csrf().disable(); //csrf토큰 비활성화
		
		
		//인증이 되지 않은 사용자를 로그인 페이지로 가게하기
		//.authenticated() : 앞에있는 주소로 갈땐 인증이 필요하다
		//.anyRequest().permitAll() : 위에꺼 아닌 주소는 허용하겠다.
		http.authorizeRequests()
			//.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/order/**").authenticated()//로그인 해야 order페이지 접근가능
			.anyRequest().permitAll(); 
		
		//.formLogin() : 인증이 필요한 페이지로 갈때 form 로그인을 할거다.
		//.loginPage("/login") : 그 formLogin페이지가 /login 이다.(get요청)
		//.loginProcessingUrl("/login") //post방식으로 로그인 요청시
		//.defaultSuccessUrl("/"); : 로그인이 정상적으로 됬으면 /로 가게하기
		http.formLogin()
			.loginPage("/member/login")
			.loginProcessingUrl("/member/login")
			.failureUrl("/member/login?error")
			.defaultSuccessUrl("/member/redirect",true)
			.usernameParameter("id")
			.passwordParameter("password");
		
		
		http.logout()
			.logoutRequestMatcher(new AntPathRequestMatcher("/member/logout")) //로그아웃 요청 URL
			.logoutSuccessUrl("/member/login") //로그아웃 성공시 여기로
			.invalidateHttpSession(true); //세션지우기
	}
}
