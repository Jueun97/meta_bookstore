package com.meta.stock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meta.stock.mapper.StockMapper;
import com.meta.stock.vo.StockVO;



@Service
public class StockService {
	
	@Autowired
	private StockMapper mapper;
	
	public int initializeStock(long book_no) {
		return mapper.initializeStock(book_no);
	}
	public int addStockWhenCheckedout(StockVO stockVo) {
		return mapper.addStockWhenCheckedout(stockVo);
	}
	public int removeStockWhenCancelled(StockVO stockVo) {
		return mapper.removeStockWhenCancelled(stockVo);
	}


	//----------------------------------관리자---------------------------------------
	public int updateStock(StockVO stockVO){
		return mapper.updateStock(stockVO);
	}

	public int insertStock(StockVO stockVO){
		return mapper.insertStock(stockVO);
	}
}
