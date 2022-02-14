package com.meta.auth.controller;

import com.meta.auth.service.AuthService;
import com.meta.member.dto.MemberRegDto;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

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
	public String registerForm(Model model) {
		model.addAttribute("memberRegDto",new MemberRegDto());
		return "auth/register";
	}

	//회원 가입 처리
	@PostMapping("/auth/register")
	public String register(@ModelAttribute("memberRegDto") @Valid MemberRegDto memberRegDto,BindingResult bindingResult
			,Model model,RedirectAttributes rttr) {
		log.info("register().dto : " + memberRegDto);
		if(authService.hasErrors(memberRegDto, bindingResult)) {
			Map<String,String> errorMap = new HashMap<>();
			for(FieldError error : bindingResult.getFieldErrors()) {
				// getFieldErrors() : 리스트 리턴
				errorMap.put(error.getField(), error.getDefaultMessage());
//  			System.out.println("====================");
//				System.out.println(error.getDefaultMessage()); //20자 이하여야 합니다.
//				System.out.println("====================");
			}
			model.addAttribute("errorMap",errorMap);
			return "/auth/register";
		}else {
			authService.register(memberRegDto);
		}
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
			return "redirect:/admin/main";
		}
		return "redirect:/";
	}

	@PostMapping("/checkId.do")
	public @ResponseBody String checkId(String id) {
		String resultId = authService.checkId(id);
		return resultId;
	}
}