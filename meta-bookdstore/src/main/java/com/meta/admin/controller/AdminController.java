package com.meta.admin.controller;

import com.meta.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private BookService bookService;
	
	@RequestMapping("index")
	public String index(Model model) {
		return "admin/index";
	}

	@GetMapping("main")
	public String admintestView(Model model) {
		System.out.println("adminTestView");

		model.addAttribute("bookData", bookService.list());

		return "/admin/admin";
	}
}
