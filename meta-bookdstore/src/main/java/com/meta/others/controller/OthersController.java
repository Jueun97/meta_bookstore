package com.meta.others.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/others")
public class OthersController {
	@GetMapping("/storelocation")
	public String storeLocation(Model model) {
		return "others/store-location";
	}
	
	@GetMapping("/contact")
	public String contactUs(Model model) {
		return "others/contact";
	}
	
	@GetMapping("/about")
	public String aboutUs(Model model) {
		return "others/about";
	}
}
