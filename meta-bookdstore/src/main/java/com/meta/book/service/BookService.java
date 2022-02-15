package com.meta.book.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.meta.book.mapper.BookMapper;
import com.meta.book.vo.BookVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookService {
	
	private final BookMapper mapper;
	
	public List<BookVO> list() {
		return mapper.list();
	}
	public BookVO getBookInfo(int book_no) {
		return mapper.bookInfo(book_no);
	}
}
