package com.meta.book.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BookVO {
	private Long book_no;
	private String title;
	private String author;
	private String pub;
	private Date pubDate;
	private String description;
	private int price;
	private int cate_no;
}
