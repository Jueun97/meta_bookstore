package com.meta.book.mapper;

import com.meta.book.vo.BookVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMapper {
	
	public List<BookVO> list();

	//관리자 페이지에서 사용하는 책 삭제 mapper
	public void delete(int book_no);

	public List<BookVO> detailBookInfo(int book_no);
}
