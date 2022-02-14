package com.meta.member.vo;

import java.util.Date;


import lombok.Builder;
import lombok.Data;

@Data
public class MemberVO {
	private long m_no;
	private String id;
	private String password;
	private String name;
	private String zipcode; //우편번호
	private String address; //도로명주소
	private String otheraddress; //나머지 주소
	private String phone;
	private String email;
	private String grade;
	private Date regDate;
}
