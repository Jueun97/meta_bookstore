package com.meta.order.vo;

import lombok.Data;

@Data
public class OrderItemsVO {
	private String order_no;
	private int book_no;
	private int order_qt;
	private int total_price;
	private String title;
	private String author;
	private String image;
	private String price;
}
