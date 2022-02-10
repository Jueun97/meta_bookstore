package com.meta.admin.service;

import com.meta.book.mapper.BookMapper;
import com.meta.book.vo.BookVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AdminService {

	private final BookMapper mapper;
	
	public List<BookVO> list() {
		return mapper.list();
	}
}
