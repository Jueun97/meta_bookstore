package com.meta.member.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

import com.meta.member.vo.MemberVO;

import lombok.Data;

@Data
public class MemberRegDto {
	@NotEmpty(message="id를 입력하셔야 합니다.")
	@NotBlank
	private String id;
	
	@NotEmpty(message="비밀번호를 입력하셔야 합니다.")
	@NotBlank
	private String password;
	
	@NotEmpty(message="이름은 필수입력 사항입니다.")
	@NotBlank
	private String name;
	
	@NotEmpty(message="전화번호는 필수입력 사항입니다.")
	@NotBlank
	private String phone;
	
	@NotEmpty(message="이메일은 필수입력 사항입니다.")
	@NotBlank
	@Email
	private String email;

	private String email1;
	private String emailDomain;
	
	private String tel1;
	private String tel2;
	private String tel3;
	
	@NotEmpty(message="우편번호는 필수입력 사항입니다.")
	@NotBlank
	private String zipcode;
	
	@NotEmpty(message="도로명주소는 필수입력 사항입니다.")
	@NotBlank
	private String roadAddress;
	
	@NotEmpty(message="상세주소는 필수입력 사항입니다.")
	@NotBlank
	private String otherAddress;
	
//	public MemberVO toEntity() {
//		return MemberVO.builder()
//						.id(id)
//						.password(password1)
//						.name(name)
//						.address(address)
//						.phone(phone)
//						.email(email)
//						.build();
//	}
}
