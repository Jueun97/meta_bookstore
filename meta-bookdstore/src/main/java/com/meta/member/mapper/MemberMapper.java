package com.meta.member.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.meta.member.dto.MemberRegdto;
import com.meta.member.vo.MemberVO;

@Mapper
public interface MemberMapper {
	MemberVO findByMemberId(String username);
	int register(MemberRegdto memberRegDto);
	public String checkId(String id);
}
