package com.meta.member.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

import com.meta.member.vo.MemberVO;

import lombok.Data;

@Data
public class MemberUpdateDto {
	
	private int m_no;
	@NotEmpty(message="id를 입력하셔야 합니다.")
	@NotBlank
	private String id;
	
	@NotEmpty(message="비밀번호를 입력하셔야 합니다.")
	@NotBlank
	private String password;
	
	@NotEmpty(message="이름은 필수입력 사항입니다.")
	@NotBlank
	private String name;
	
	@NotEmpty(message="주소는 필수입력 사항입니다.")
	@NotBlank
	private String address;
	
	@NotEmpty(message="전화번호는 필수입력 사항입니다.")
	@NotBlank
	private String phone;
	
	@NotEmpty(message="이메일은 필수입력 사항입니다.")
	@NotBlank
	@Email
	private String email;
	
	public MemberVO toEntity() {
		return MemberVO.builder()
						.m_no(m_no)
						.id(id)
						.password(password)
						.name(name)
						.address(address)
						.phone(phone)
						.email(email)
						.build();
	}
}
