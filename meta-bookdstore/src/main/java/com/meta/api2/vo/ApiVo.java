package com.meta.api2.vo;


import lombok.Data;

@Data
public class ApiVo {
	private long book_no;
	private String title;
	private String image;
	private String author;
	private String price;
	private String publisher;
	private String pubdate;
	private String description;
	private String link;
	private int cate_no;
}
