package com.meta.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;

import com.meta.member.dto.MemberRegdto;
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
	
	public int register(MemberRegdto memberRegDto) {
		//password bcrypt암호화 과정.
		String rawPassword = memberRegDto.getPassword1();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		//validateDuplicateMember(vo);
		memberRegDto.setPassword1(encPassword);
		return memberMapper.register(memberRegDto);
	}
	
	//에러검사부분
	public boolean hasErrors(MemberRegdto memberRegDto,BindingResult bindingResult) {
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
	
	//가입된 회원인지??
//	private void validateDuplicateMember(MemberVO vo) {
//		MemberVO findMember = memberMapper.findByMemberId(vo.getId());
//		if(findMember!=null) {
//			throw new IllegalStateException("이미 가입된 회원입니다.");
//		}
//	}
	
//	public String checkId(String id) {
//		String result = memberMapper.checkId(id);
//		return result;
//	}
	
}
