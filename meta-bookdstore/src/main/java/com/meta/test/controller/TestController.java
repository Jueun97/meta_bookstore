package com.meta.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.meta.test.service.TestService;

@Controller
public class TestController {
	
	@Autowired
	private TestService testService;
	
	
	//기본적인 테스트를 할 controller
	//여기서 hi로 mapping된 url을 통해 index페이지의 
	//연결된 DB정보가 잘 출력되는지 확인 
	
	@GetMapping("/hi")
	public String hi(Model model) {
		System.out.println("hi");
		
		model.addAttribute("test", testService.test());
		
		return "index";
	}
	
	@GetMapping("/testView")
	public String testView(Model model) {
		System.out.println("testView");
		
		return "/include/base";
	}

}
