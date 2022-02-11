package com.meta.member.service;

import org.springframework.beans.factory.annotation.Autowired;
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
		
	//회원 가입시 에러검사부분
	public boolean hasErrors(MemberRegDto memberRegDto,BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return true;
		}
		if(memberRegDto.getPassword1().equals(memberRegDto.getPassword2())==false) {
			bindingResult.rejectValue("password2", null,"비밀번호가 일치하지 않습니다.");
			return true;
		}
		//중복된 id로 가입한 유저가 있는지??
  		MemberVO vo = memberMapper.findByMemberId(memberRegDto.getId());
  		if(vo!=null) {
  			//id가 중복될 경우
  			bindingResult.rejectValue("id",null,"id가 중복됩니다.");
  			return true;
  		}
  		return false;
	}
	
	public int update(MemberUpdateDto memberUpdateDto) {
		//password bcrypt암호화 과정.
		String rawPassword = memberUpdateDto.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		memberUpdateDto.setPassword(encPassword);
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
		if(bindingResult.hasErrors()) {
			return true;
		}
		return false;
	}
	
	//가입된 회원인지??
//	private void validateDuplicateMember(MemberVO vo) {
//		MemberVO findMember = memberMapper.findByMemberId(vo.getId());
//		if(findMember!=null) {
//			throw new IllegalStateException("이미 가입된 회원입니다.");
//		}
//	}
	
}
