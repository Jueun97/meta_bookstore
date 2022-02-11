package com.meta.auth.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;

import com.meta.member.dto.MemberRegDto;
import com.meta.member.mapper.MemberMapper;
import com.meta.member.vo.MemberVO;

@Service
@Transactional
public class AuthService {
	
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	

	public int register(MemberVO vo) {
		//password bcrypt암호화 과정.
		String rawPassword = vo.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		vo.setPassword(encPassword);
		return memberMapper.register(vo);
	}
	
	public String checkId(String id) {
		String result = memberMapper.checkId(id);
		return result;
	}
}
