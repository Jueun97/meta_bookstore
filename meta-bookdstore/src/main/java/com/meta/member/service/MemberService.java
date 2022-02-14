package com.meta.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;

import com.meta.config.auth.PrincipalDetails;
import com.meta.member.dto.MemberRegDto;
import com.meta.member.dto.MemberUpdateDto;
import com.meta.member.mapper.MemberMapper;
import com.meta.member.vo.MemberVO;


@Service
@Transactional
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
    public MemberVO findByMemberId(String id) {
        return memberMapper.findByMemberId(id);
    }
  	//https://cordingmonster.tistory.com/39 참조 땡큐	
	public int update(MemberUpdateDto memberUpdateDto,@AuthenticationPrincipal PrincipalDetails principalDetails) {
		//password bcrypt암호화 과정.
		String rawPassword = memberUpdateDto.getNewpassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		memberUpdateDto.setNewpassword(encPassword);
		//시큐리티 세션에 암호화된 비밀번호 변경
		principalDetails.getMember().setPassword(encPassword);
		return memberMapper.update(memberUpdateDto);
	}
	
	public MemberVO updatedSel(MemberVO member) {
		MemberVO memberEntity = memberMapper.findByMno(member.getM_no());
		System.out.println("memberEntitiy 값 : " + memberEntity);
		memberEntity.setName(member.getName());
		memberEntity.setPhone(member.getPhone());
//		memberEntity.setAddress(member.getAddress());
		memberEntity.setEmail(member.getEmail());
		return memberEntity;
	}
	
	//회원 수정 시 에러검사부분
	public boolean hasErrors(MemberUpdateDto memberUpdateDto,BindingResult bindingResult,PrincipalDetails principalDetails) {
		MemberVO vo = principalDetails.getMember();
		String originalPw = memberUpdateDto.getPassword();
		if(bindingResult.hasErrors()) {
			return true;
		}
		//기존 비밀번호가 db의 비밀번호와 일치하지 않으면
		if(!bCryptPasswordEncoder.matches(originalPw, vo.getPassword())) {
			bindingResult.rejectValue("password",null,"기존 비밀번호와 일치하지 않습니다.");
			return true;
		}
		return false;
	}
	
}
