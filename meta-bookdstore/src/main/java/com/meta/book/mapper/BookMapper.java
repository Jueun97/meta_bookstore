package com.meta.book.mapper;

import com.meta.book.vo.BookVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMapper {
	
	public List<BookVO> list();
	public void delete();
}
