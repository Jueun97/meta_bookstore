package com.meta.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.meta.book.vo.BookVO;

@Mapper
public interface BookMapper {
	
	public List<BookVO> list();
}
