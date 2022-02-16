package com.meta.main.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meta.book.service.BookService;
import com.meta.book.vo.BookVO;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class MainController {

	@Autowired
	private BookService service;
	
	//메인화면 폼 
	@GetMapping("main")
	public String main(Model model,String cate_no) {
		model.addAttribute("bookList",service.list());
		log.warn("cate_no : " + cate_no);
		return "main/main";
	}
	
	//루트경로로 들어오면 /main으로 redirect 
	@GetMapping("/")
	public String redirectToMain() {
  		return "redirect:/main";
	}
	
	//-------------------민기작성----------------------------------
	@ResponseBody
	@GetMapping("/viewMainBook")
	public List<BookVO> viewMainBook(String cate_no) {
		log.warn("카테고리 번호 : " + cate_no);
		return service.bookByCate(cate_no);
	}
}
