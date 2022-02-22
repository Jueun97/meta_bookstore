package com.meta.order.vo;

import lombok.Data;

@Data
public class OrderVO {
	private String order_no;
	private long m_no;
	private String msg=null;
	private String receiver_email;
	private String receiver_zipcode;
	private String receiver_roadAddress;
	private String receiver_otherAddress;
	private String receiver_phone;
	private String receiver_name;
	private int order_count;
	private long order_price;
	private String order_date;
	private int status_code;
	private String status;
	private int rownum;
}
