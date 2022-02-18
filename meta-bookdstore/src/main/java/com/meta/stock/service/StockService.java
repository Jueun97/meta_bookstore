package com.meta.stock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meta.stock.mapper.StockMapper;



@Service
public class StockService {
	
	@Autowired
	private StockMapper mapper;
	
	public int initializeStock(long book_no) {
		return mapper.initializeStock(book_no);
	}
}
