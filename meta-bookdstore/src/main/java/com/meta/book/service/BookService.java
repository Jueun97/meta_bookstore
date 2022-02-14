package com.meta.book.service;

import com.meta.book.mapper.BookMapper;
import com.meta.book.vo.BookVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BookService {
	
	private final BookMapper mapper;

	//-------------------관리자----------------------------------
	public List<BookVO> list() {

		return mapper.list();
	}

	public void delete(int book_no){
		mapper.delete(book_no);
	}

	public List<BookVO> detailBookInfo(int book_no){

		return mapper.detailBookInfo(book_no);
	}

	public void updateBookInfo(BookVO vo){
		mapper.update(vo);
	}

	//----------------------------------------------------------
}
