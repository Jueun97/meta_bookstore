package com.meta.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.meta.book.service.BookService;

@Controller
public class MainController {

	@Autowired
	private BookService service;
	
	//메인화면 폼 
	@GetMapping("main")
	public String main(Model model) {
		model.addAttribute("bookList",service.list());
		return "main/main";
	}
	
	//루트경로로 들어오면 /main으로 redirect 
	@GetMapping("/")
	public String redirectToMain() {
  		return "redirect:/main";
	}
}
