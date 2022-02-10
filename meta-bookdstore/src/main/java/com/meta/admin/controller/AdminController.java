package com.meta.admin.controller;

import com.meta.book.service.BookService;
import com.meta.book.vo.BookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private BookService bookService;


	//추후 admin의 메인 페이지로 사용할 예정. 아직 페이지 구성 미완료.
	@RequestMapping("index")
	public String index(Model model) {
		return "/admin/index";
	}

	//추후 admin의 책관리 페이지로 사용.
	@GetMapping("main")
	public String adminMainView(Model model) {
		System.out.println("adminTestView");

		model.addAttribute("bookdata", bookService.list());

		return "/admin/main";
	}

	//추후 admin의 책관리 페이지로 사용.
	@GetMapping("book")
	public String bookView(Model model) {
		System.out.println("adminTestView");

		model.addAttribute("bookdata", bookService.list());

		return "/admin/book";
	}

	@GetMapping("bookUpdate")
	public String bookUpdate(@ModelAttribute BookVO vo, Model model){
		System.out.println("bookUpdate");
		System.out.println(vo.getBook_no());
		model.addAttribute("bookinfo", bookService.detailBookInfo(vo.getBook_no()));
		System.out.println(bookService.detailBookInfo(vo.getBook_no()));

		return "/admin/bookInfoDetail";
	}

	//책의 정보의 삭제
	@GetMapping("delete")
	public String bookDelete(@ModelAttribute BookVO vo){
		//Get방식의 url mapping을 통해서 삭제할 책의 정보 번호를
		//받아와 @ModelAttribute를 통해 vo로 값을 받는다.
		System.out.println(">>> "+this.getClass()+ " 호출됨!");
		System.out.println(vo.getBook_no());

		//받아온 책의 no를 BookService의 delete함수로 전달.
		bookService.delete(vo.getBook_no());

		//과정이 끝난 후에는 책관리 페이지로 다시 redirecting한다.
		return "redirect:/admin/book";
	}
}
