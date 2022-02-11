package com.meta.member.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.meta.member.dto.MemberRegDto;
import com.meta.member.dto.MemberUpdateDto;
import com.meta.member.vo.MemberVO;

@Mapper
public interface MemberMapper {
	MemberVO findByMemberId(String username);
	MemberVO findByMno(long m_no);
	int register(MemberVO vo);
	int update(MemberUpdateDto memberUpdateDto);
	public String checkId(String id);
}
