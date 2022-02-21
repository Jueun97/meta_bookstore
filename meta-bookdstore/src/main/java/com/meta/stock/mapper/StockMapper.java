package com.meta.stock.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.meta.stock.vo.StockVO;

@Mapper
public interface StockMapper {
	
	public int initializeStock(long book_no);
	public int addStockWhenCheckedout(StockVO stockVo);
	public int removeStockWhenCancelled(StockVO stockVo);

	//----------------------------------관리자--------------------------------------
	public int updateStock(StockVO stockVO);
	public int insertStock(StockVO stockVO);

}
