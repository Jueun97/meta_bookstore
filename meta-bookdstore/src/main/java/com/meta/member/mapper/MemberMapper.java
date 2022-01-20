package com.meta.member.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.meta.member.vo.MemberVO;

@Mapper
public interface MemberMapper {
	MemberVO findByMemberId(String username);
}
