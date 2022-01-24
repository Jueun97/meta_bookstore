package com.meta.order.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.meta.config.auth.PrincipalDetails;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	
	private static final Logger log = LoggerFactory.getLogger(OrderController.class);

	@GetMapping("list")
	public String order(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		log.info("order창");
		System.out.println("세션 정보 : " + principalDetails.getMember());
		return "order/list";
	}
}
