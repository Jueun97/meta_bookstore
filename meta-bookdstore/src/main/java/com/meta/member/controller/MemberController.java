package com.meta.member.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meta.member.dto.MemberRegdto;
import com.meta.member.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	
	@Autowired
	private MemberService memberService;
	
	//로그인폼
    @RequestMapping("login")
    public String loginForm() {
        return "member/login";
    }
    //스프링 시큐리티를 쓰기 때문에 post요청에 대한 URL을 만들지 않는다.
    
    //회원 가입 폼
  	@GetMapping("register")
  	public String registerForm(Model model) {
  		model.addAttribute("memberRegDto",new MemberRegdto());
  		return "member/register";
  	}
  	//회원 가입 처리
  	@PostMapping("register")
  	public String register(@ModelAttribute("memberRegDto") @Valid MemberRegdto memberRegDto,BindingResult bindingResult
  			,RedirectAttributes rttr) {
  		log.info("register().dto : " + memberRegDto);
  		//회원가입 입력 폼에 에러가 있다면??
  		if(memberService.hasErrors(memberRegDto, bindingResult)) {
  			return "member/register";
  		}else {
  			memberService.register(memberRegDto);
  		}
  		rttr.addFlashAttribute("msg","회원가입이 완료되었습니다.");
  		return "redirect:login";
  	}
  	
//  	//아이디 중복 검사
//  	@PostMapping("checkId")
//  	public @ResponseBody String idCheck(String id) {
//  		String result = memberService.checkId(id);
//  		return result;
//  	}
}
