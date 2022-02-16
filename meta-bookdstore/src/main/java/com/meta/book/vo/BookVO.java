package com.meta.book.vo;

import lombok.Data;

@Data
public class BookVO {
	private Long book_no;
	private String title;
	private String author;
	private String publisher;
	private String pubdate;
	private String description;
	private int price;
	private int cate_no;
	private String image;
	private String th_image;
}
