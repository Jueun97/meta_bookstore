package com.meta.member.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MemberVO {
	private long m_no;
	private String id;
	private String password;
	private String name;
	private String address;
	private String phone;
	private String email;
	private String grade;
	private Date regDate;
}
