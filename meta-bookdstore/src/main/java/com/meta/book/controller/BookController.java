package com.meta.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.meta.book.service.BookService;
import com.meta.util.BookPageObject;

import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private BookService service;
	
	@GetMapping("list")
	public String booklist(Model model,@ModelAttribute BookPageObject bookPageObject) {
		//파라매터에 pageObject 써줌으로써, bookPageObject가 생성되며 생성자 기본값이 셋팅됨
		//기본값 : BookPageObject [page=1, perPageNum=10, startRow=0, endRow=0 ~~
		model.addAttribute("bookList",service.userBookList(bookPageObject));
		log.info("-------list실행 후 : " + bookPageObject + "------------");
		return "book/list";
	}
	
	@GetMapping("/detail/{book_no}")
	public String showBookDetail(Model model,@PathVariable Long book_no) {
		log.info("책 상세정보");
		model.addAttribute("bookInfo",service.detailBookInfo(book_no));
		return "book/details";
	}

}
