package com.meta.book.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.meta.book.service.BookService;



@Controller
@RequestMapping("/book")
public class BookController {
	
	private static final Logger log = LoggerFactory.getLogger(BookController.class);
	
	@Autowired
	private BookService service;
	
	@GetMapping("list")
	public String booklist(Model model) {
		log.info("북인포");
		model.addAttribute("bookList",service.list());
		return "book/list";
	}
	
	@GetMapping("/detail/{book_no}")
	public String showBookDetail(Model model,@PathVariable Long book_no) {
		log.info("책 상세정보");
		model.addAttribute("bookInfo",service.detailBookInfo(book_no));
		return "book/details";
	}

}
