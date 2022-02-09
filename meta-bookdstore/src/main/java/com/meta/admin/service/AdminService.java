package com.meta.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.meta.book.mapper.BookMapper;
import com.meta.book.vo.BookVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminService {

	private final BookMapper mapper;
	
	public List<BookVO> list() {
		return mapper.list();
	}
}
