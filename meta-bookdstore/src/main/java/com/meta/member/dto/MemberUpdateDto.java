package com.meta.member.dto;

import com.meta.member.vo.MemberVO;
import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

@Data
public class MemberUpdateDto {
	
	private int m_no;
	private String id;
	private String name;

	@NotEmpty(message="기존 비밀번호를 입력하셔야 합니다.")
	@NotBlank
	private String password;
	
	@NotEmpty(message="변경할 비밀번호를 입력하셔야 합니다.")
	@NotBlank
	private String newpassword;
	
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
	@Pattern(regexp="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,9}$", message="이메일은 영문과 숫자만 사용가능합니다.")
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
	
	public MemberVO toEntity() {
		return MemberVO.builder()
						.m_no(m_no)
						.id(id)
						.name(name)
						.password(newpassword)
						.zipcode(zipcode)
						.roadAddress(roadAddress)
						.otherAddress(otherAddress)
						.phone(phone)
						.email(email)
						.build();
	}

}
