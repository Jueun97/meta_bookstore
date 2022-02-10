package com.meta.auth.controller;

import com.meta.auth.service.AuthService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@Log4j2
public class AuthController {
	
	@Autowired
	private AuthService authService;
	
	//로그인폼
    @RequestMapping("/auth/login")
    public String loginForm() {
        return "auth/login";
    }
    //스프링 시큐리티를 쓰기 때문에 post요청에 대한 URL을 만들지 않는다.
	
	@GetMapping("/auth/register")
	public String registerForm() {
		return "auth/register";
	}
//  	//회원 가입 처리 
//  	@PostMapping("/auth/register")
//  	public String register(@ModelAttribute("memberRegDto") @Valid MemberRegDto memberRegDto,BindingResult bindingResult
//  			,RedirectAttributes rttr) {
//  		log.info("register().dto : " + memberRegDto);
//  		//회원가입 입력 폼에 에러가 있다면??
//  		if(memberService.hasErrors(memberRegDto, bindingResult)) {
//  			return "member/register";
//  		}else {
//  			memberService.register(memberRegDto);
//  		}
//  		rttr.addFlashAttribute("msg","회원가입이 완료되었습니다.");
//  		return "redirect:login";
//  	}
	
	@RequestMapping("/auth/jusoPopup")
	public String jusoPopup() {
		return "auth/jusoPopup";
	}
	
  	//회원 유형에 따른 redirect요청
  	@RequestMapping("/auth/redirect")
  	public String redirect(Model model,HttpServletRequest request) {
  		if(request.isUserInRole("ROLE_ADMIN")) {
  			return "redirect:/admin/index";
  		}
  		return "redirect:/";
  	}
}
