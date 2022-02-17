package com.meta.member.dto;

import com.meta.member.vo.MemberVO;
import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

@Data
public class MemberUpdateAdminDto {

    private Long m_no;
    private String id;
    private String name;

    @NotEmpty(message="변경할 비밀번호를 입력하셔야 합니다.")
    @NotBlank
    private String newpassword;

    @NotEmpty(message="전화번호는 필수입력 사항입니다.")
    @NotBlank
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

    @NotBlank
    private String grade;

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
                .grade(grade)
                .build();
    }
}
