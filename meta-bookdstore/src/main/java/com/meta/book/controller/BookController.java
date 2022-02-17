package com.meta.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.meta.book.service.BookService;
import com.meta.util.PageObject;

import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private BookService service;
	
	@GetMapping("list")
	public String booklist(Model model,String cate_no,@ModelAttribute PageObject pageObject) {
		log.info("북인포");
		model.addAttribute("bookList",service.userBookList(cate_no));
		return "book/list";
	}
	
	@GetMapping("/detail/{book_no}")
	public String showBookDetail(Model model,@PathVariable Long book_no) {
		log.info("책 상세정보");
		model.addAttribute("bookInfo",service.detailBookInfo(book_no));
		return "book/details";
	}
}
