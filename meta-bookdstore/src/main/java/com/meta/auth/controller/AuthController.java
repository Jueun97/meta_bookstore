package com.meta.auth.controller;

import javax.servlet.http.HttpServletRequest;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meta.auth.service.AuthService;
import com.meta.member.dto.MemberRegDto;
import com.meta.member.service.MemberService;
import com.meta.member.vo.MemberVO;

import lombok.extern.log4j.Log4j2;

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
	
    //회원가입 폼 가기
	@GetMapping("/auth/register")
	public String registerForm() {
		return "auth/register";
	}
	
  	//회원 가입 처리 
  	@PostMapping("/auth/register")
  	public String register(MemberVO vo,RedirectAttributes rttr) {
  		log.info("register().vo : " + vo);
  		authService.register(vo);
  		rttr.addFlashAttribute("msg","회원가입이 완료되었습니다.");
  		return "redirect:/auth/login";
  	}
	
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
  	
  	@PostMapping("/checkId.do")
  	public @ResponseBody String checkId(String id) {
  		String resultId = authService.checkId(id);
  		return resultId;
  	}
}
