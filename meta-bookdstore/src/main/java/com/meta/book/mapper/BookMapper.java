package com.meta.book.mapper;

import com.meta.book.vo.BookVO;

import com.meta.book.vo.CateVO;
import com.meta.util.BookPageObject;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMapper {

	public List<BookVO> list();

	//관리자 페이지에서 사용하는 책 삭제 mapper
	public void delete(Long book_no);

	public BookVO detailBookInfo(Long book_no);

	public void update(BookVO vo);

	public void insert(BookVO vo);

	public List<CateVO> cateList();
	
	//-------------------민기작성----------------------------------
	public List<BookVO> selectMainBookList();
	public List<BookVO> selectBookListByCateNo(String cate_no);
	public List<BookVO> userBookList(BookPageObject bookPageObject);
	//페이징처리 위한 책 갯수 구하기
	public Long getTotalRow(BookPageObject pageObject);
	//view리스트에서 카테고리별 관련 북리스트
	public List<BookVO> relatedBookList(int cate_no);
}

