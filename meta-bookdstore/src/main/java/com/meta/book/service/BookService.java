package com.meta.book.service;

import com.meta.book.mapper.BookMapper;
import com.meta.book.vo.BookVO;
import com.meta.book.vo.CateVO;
import com.meta.util.BookPageObject;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
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

	public List<BookVO> rownumBookList(){
		return mapper.rownumBookList();
	}

	public int cateCount(int number) {
		return mapper.cateCount(number);
	}

	//----------------------------------------------------------
	
	//-------------------민기작성----------------------------------
	//main페이지에서 전체 book리스트 보여주기 (/main 경로)
	public List<BookVO> selectMainBookList(){
		return mapper.selectMainBookList();
	}
	//main페이지에서 category별 book리스트 보여주기 (/main 경로)
	public List<BookVO> selectBookListByCateNo(String cate_no){
		List<BookVO> bookByCateList = new ArrayList<BookVO>();
		bookByCateList = mapper.selectBookListByCateNo(cate_no);
		return bookByCateList;
	}
	//유저가 접근했을때 List (/book/list 경로)
	public List<BookVO> userBookList(BookPageObject bookPageObject) {
		bookPageObject.setTotalRow(mapper.getTotalRow(bookPageObject));
		//setTotalRow : startRow와 endRow계산
		log.info("service 계산 후 bookPageObject : " + bookPageObject);
		return mapper.userBookList(bookPageObject);
	}
	public List<BookVO> relatedBookList(BookVO bookVoInfo){

		return mapper.relatedBookList(bookVoInfo);
	}
}
