package com.meta.book.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BookVO {
	private int book_no;
	private String title;
	private String image;
	private String author;
	private String price;
	private String publisher;
	private String pubdate;
	private String description;
	private int cate_no;
}
