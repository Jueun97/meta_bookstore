package com.meta.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meta.config.auth.PrincipalDetails;
import com.meta.member.dto.MemberRegDto;
import com.meta.member.dto.MemberUpdateDto;
import com.meta.member.service.MemberService;
import com.meta.member.vo.MemberVO;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;

  	//회원 정보 찾 폼 
	@GetMapping("find")
  	public String find(Model model) {
  		//model.addAttribute("memberRegDto",new MemberRegDto());
  		return "member/find";
  	}
  	
//  	//아이디 중복 검사
//  	@PostMapping("checkId")
//  	public @ResponseBody String idCheck(String id) {
//  		String result = memberService.checkId(id);
//  		return result;
//  	}
  	
  	
  	//회원 정보 수정 폼
  	@GetMapping("{m_no}/update")
  	public String updateForm(@PathVariable int m_no,Model model) {
  		model.addAttribute("memberUpdateDto",new MemberUpdateDto());
  		return "member/update";
  	}
  	//회원 정보 수정 폼
  	@PostMapping("{m_no}/update")
  	public String update(@PathVariable int m_no,Model model,@AuthenticationPrincipal PrincipalDetails principalDetails,
  			@ModelAttribute("memberUpdateDto") @Valid MemberUpdateDto memberUpdateDto,BindingResult bindingResult
  			,RedirectAttributes rttr) {
  		log.info("update().dto : " + memberUpdateDto);
  		//회원가입 입력 폼에 에러가 있다면??
  		if(memberService.hasErrors(memberUpdateDto, bindingResult,principalDetails)) {
  			return "member/update";
  		}else {
  			int res = memberService.update(memberUpdateDto);
  			MemberVO memberEntity =  memberService.updatedSel(memberUpdateDto.toEntity());
  			principalDetails.setMember(memberEntity); //수정한 세션정보 변경
  		}
  		rttr.addFlashAttribute("msg","회원정보 수정이 완료되었습니다.");
  		return "redirect:/member/"+principalDetails.getMember().getM_no()+"/index";
  	}
  	
  	//회원 정보 확인 폼 (디테일) 
  	@GetMapping("mypage")
  	public String showMypage(Model model) {
  		//model.addAttribute("memberRegDto",new MemberRegDto());
  		return "member/mypage";
  	}
  	
  	//회원 주문 정보 확인 폼 
	@GetMapping("myorder")
  	public String showMyorder(Model model) {
  		//model.addAttribute("memberRegDto",new MemberRegDto());
  		return "member/myorder";
  	}
	

}
