package com.meta.cart.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	private int cart_no;
	private long m_no;
	private int book_no;
	private int cart_book_qt;
	//해당 장바구니 전체 금액
	private int cart_total_price;
	private String title;
	private String author;
	private int price;
	private String image;
	//장바구니 전체 금액
	private long sub_total_price;
	private int stock;
	
	
	
}
