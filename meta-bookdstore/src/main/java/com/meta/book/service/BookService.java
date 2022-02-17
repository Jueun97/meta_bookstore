package com.meta.book.service;

import com.meta.book.mapper.BookMapper;

import com.meta.book.vo.BookVO;
import com.meta.book.vo.CateVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BookService {
	
	private final BookMapper mapper;

	//-------------------관리자----------------------------------
	public List<BookVO> list() {

		return mapper.list();
	}

	public void delete(Long book_no){
		mapper.delete(book_no);
	}

	public BookVO detailBookInfo(Long book_no){

		return mapper.detailBookInfo(book_no);
	}

	public void updateBookInfo(BookVO vo){
		mapper.update(vo);
	}

	public void insert(BookVO vo){
		mapper.insert(vo);
	}

	public List<CateVO> cateList(){
		return mapper.cateList();
	}

	//----------------------------------------------------------
	
	//-------------------민기작성----------------------------------
	public List<BookVO> bookByCate(String cate_no){
		List<BookVO> bookByCateList = new ArrayList<BookVO>();
		bookByCateList = mapper.selectBookList(cate_no);
		return bookByCateList;
	}
	//유저가 접근했을때 List
	public List<BookVO> userBookList(String cate_no) {

		return mapper.userBookList(cate_no);
	}

}
