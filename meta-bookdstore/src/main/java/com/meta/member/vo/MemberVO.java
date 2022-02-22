package com.meta.member.vo;

import lombok.Builder;
import lombok.Data;

@Data
public class MemberVO {
	private long m_no;
	private String id;
	private String password;
	private String name;
	private String zipcode; //우편번호
	private String roadAddress; //도로명주소
	private String otherAddress; //나머지 주소
	private String phone;
	private String email;
	private String grade;
	private String regDate;
	private long cartCount;
	private int rownum;
	
	@Builder
	public MemberVO(long m_no, String id, String password, String name, String zipcode, String roadAddress,
			String otherAddress, String phone, String email, String grade, String regDate) {
		super();
		this.m_no = m_no;
		this.id = id;
		this.password = password;
		this.name = name;
		this.zipcode = zipcode;
		this.roadAddress = roadAddress;
		this.otherAddress = otherAddress;
		this.phone = phone;
		this.email = email;
		this.grade = grade;
		this.regDate = regDate;
	}
}
