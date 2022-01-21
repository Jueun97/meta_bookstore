package com.meta.book.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.meta.book.service.BookService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/book")
@RequiredArgsConstructor
public class BookController {
	
	private static final Logger log = LoggerFactory.getLogger(BookController.class);
	
	private final BookService service;
	
	@GetMapping("list")
	public String booklist(Model model) {
		log.info("북인포");
		model.addAttribute("bookList",service.list());
		return "book/list";
	}

}
