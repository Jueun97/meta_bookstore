package com.meta.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	//메인화면 폼 
	@GetMapping("main")
	public String main() {
		return "main/main";
	}
	
	//루트경로로 들어오면 /main으로 redirect 
	@GetMapping("/")
	public String redirectToMain() {
  		return "redirect:/main";
	}
}
