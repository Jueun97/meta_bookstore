package com.meta.stock.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StockMapper {
	
	public int initializeStock(long book_no);

}
