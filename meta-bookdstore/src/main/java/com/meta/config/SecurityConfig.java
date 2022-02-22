package com.meta.config;

import com.meta.handler.exceptions.CustomAccessDeniedHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;


@Configuration
@EnableWebSecurity //해당 파일로 Security 활성화
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	UserDetailsService userDetailsService;
	

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

		http.csrf().disable();
		http.headers(headers -> headers.cacheControl(cache -> cache.disable()));

		
		//인증이 되지 않은 사용자를 로그인 페이지로 가게하기
		//.authenticated() : 앞에있는 주소로 갈땐 인증이 필요하다
		//.anyRequest().permitAll() : 위에꺼 아닌 주소는 허용하겠다.
		http.authorizeRequests()
			.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/order/**").authenticated()//로그인 해야 order페이지 접근가능
			.antMatchers("/cart/add").permitAll()
			.antMatchers("/cart/**").authenticated()
			.anyRequest().permitAll(); 
		
		//.formLogin() : 인증이 필요한 페이지로 갈때 form 로그인을 할거다.
		//.loginPage("/login") : 그 formLogin페이지가 /login 이다.(get요청)
		//.loginProcessingUrl("/login") //post방식으로 로그인 요청시
		//.defaultSuccessUrl("/"); : 로그인이 정상적으로 됬으면 /로 가게하기
		http.formLogin()
			.loginPage("/auth/login")
			.loginProcessingUrl("/auth/login")
			.failureUrl("/auth/login?error")
			.defaultSuccessUrl("/auth/redirect",true)
			.usernameParameter("id")
			.passwordParameter("password");
		
		
		http.logout()
			.logoutRequestMatcher(new AntPathRequestMatcher("/logout")) //로그아웃 요청 URL
			.logoutSuccessUrl("/auth/login") //로그아웃 성공시 여기로
			.invalidateHttpSession(true); //세션지우기
		//https://dkyou.tistory.com/28 참고
		 // 인증 거부 관련 처리
        http.exceptionHandling().accessDeniedHandler(accessDeniedHandler());
	}
	
	
	
	
	//403에러 처리 화면 보여주는 페이지
	 private AccessDeniedHandler accessDeniedHandler() {
	      CustomAccessDeniedHandler accessDeniedHandler = new CustomAccessDeniedHandler();
	      accessDeniedHandler.setErrorPage("/denied");
	      return accessDeniedHandler;
	    }
	 
	 
	 
	 
	 
	 
	 //<-- 시큐리티 "//" 경로 에러 발생시 해결코드 -->
	 //이거 주석해제하시오.
//	 @Override
//	 public void configure(WebSecurity web) throws Exception {
//	     web.httpFirewall(defaultHttpFirewall());
//	 }
//	  
//	 @Bean
//	 public HttpFirewall defaultHttpFirewall() {
//	     return new DefaultHttpFirewall();
//	 }

}
