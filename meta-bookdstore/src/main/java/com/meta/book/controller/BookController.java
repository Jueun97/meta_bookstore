package com.meta.book.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.meta.book.service.BookService;
import com.meta.config.auth.PrincipalDetails;

import lombok.RequiredArgsConstructor;

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

}
