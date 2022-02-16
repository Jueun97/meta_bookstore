package com.meta.book.mapper;

import com.meta.book.vo.BookVO;
import com.meta.book.vo.CateVO;
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
	public List<BookVO> selectBookList(String cate_no);
}

