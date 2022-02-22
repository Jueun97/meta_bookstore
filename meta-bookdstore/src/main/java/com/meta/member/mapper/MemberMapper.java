package com.meta.member.mapper;

import com.meta.member.dto.MemberRegDto;
import com.meta.member.dto.MemberUpdateAdminDto;
import com.meta.member.dto.MemberUpdateDto;
import com.meta.member.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {
	MemberVO findByMemberId(String username);
	MemberVO findByMno(long m_no);
	int register(MemberRegDto dto);
	int update(MemberUpdateDto memberUpdateDto);
	public String checkId(String id);

	//-----------관리자-------------------------
	public List<MemberVO> memberList();
	public MemberVO memberDetailInfo(Long m_no);
	public int memberUpdate(MemberUpdateAdminDto memberUpdateAdminDto);
	public int memberDelete(Long m_no);
	public List<MemberVO> rownumMemberList();
}
