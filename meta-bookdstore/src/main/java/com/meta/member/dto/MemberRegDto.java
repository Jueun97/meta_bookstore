package com.meta.member.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

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
	@Pattern(regexp = "^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$", message = "휴대폰번호를 확인해 주세요")
	private String phone;
	private String tel1;
	private String tel2;
	private String tel3;
	
	@NotEmpty(message="이메일은 필수입력 사항입니다.")
	@NotBlank
	@Email
	private String email;
	private String email1;
	private String emailDomain;
	
	@NotEmpty(message="우편번호는 필수입력 사항입니다.")
	@NotBlank
	private String zipcode;
	
	@NotEmpty(message="도로명주소는 필수입력 사항입니다.")
	@NotBlank
	private String roadAddress;
	
	@NotEmpty(message="상세주소는 필수입력 사항입니다.")
	@NotBlank
	private String otherAddress;
}

