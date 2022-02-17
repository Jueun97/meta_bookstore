package com.meta.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meta.config.auth.PrincipalDetails;
import com.meta.member.dto.MemberUpdateDto;
import com.meta.member.service.MemberService;
import com.meta.order.service.OrderService;
import com.meta.order.vo.OrderVO;

import lombok.extern.log4j.Log4j2;


@Controller
@RequestMapping("/member")
@Log4j2
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private OrderService orderService;

	//회원 정보 확인 폼 (디테일)
	@GetMapping("mypage")
	public String showMypage(Model model) {
		model.addAttribute("memberUpdateDto",new MemberUpdateDto());
		return "member/mypage";
		//좀되라..
	}

	//회원 정보 수정 요청
	@PostMapping("mypage")
	public String update(Model model,@AuthenticationPrincipal PrincipalDetails principalDetails,
						 @ModelAttribute("memberUpdateDto") @Valid MemberUpdateDto memberUpdateDto,BindingResult bindingResult
			,RedirectAttributes rttr) {
		log.info("update().dto : " + memberUpdateDto);
		//회원가입 입력 폼에 에러가 있다면??
		if(memberService.hasErrors(memberUpdateDto, bindingResult,principalDetails)) {
			Map<String,String> errorMap = new HashMap<>();
			for(FieldError error : bindingResult.getFieldErrors()) {
				// getFieldErrors() : 리스트 리턴
				errorMap.put(error.getField(), error.getDefaultMessage());
				System.out.println("====================");
				System.out.println(error.getDefaultMessage()); //20자 이하여야 합니다.
				System.out.println("====================");
			}
			model.addAttribute("errorMap",errorMap);
			return "member/mypage";
		}else {
			int res = memberService.update(memberUpdateDto,principalDetails);
			principalDetails.setMember(memberUpdateDto.toEntity());
			//MemberVO memberEntity =  memberService.updatedSel(memberUpdateDto.toEntity());
			//principalDetails.setMember(memberEntity); //수정한 세션정보 변경

		}
		rttr.addFlashAttribute("msg","회원정보 수정이 완료되었습니다.");
		return "redirect:/member/mypage";
	}


	
	
	//회원 정보 찾 폼
	@GetMapping("find")
	public String find(String order_no,Model model) {
		//model.addAttribute("memberRegDto",new MemberRegDto());
	
		return "member/find";
	}

}