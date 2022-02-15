package com.meta.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.meta.cart.service.CartService;
import com.meta.cart.vo.CartVO;
import com.meta.config.auth.PrincipalDetails;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	
	private static final Logger log = LoggerFactory.getLogger(OrderController.class);

	@Autowired
	private CartService cartService;
	
	@GetMapping("list")
	public String order(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		log.info("order창");
		System.out.println("세션 정보 : " + principalDetails.getMember());
		return "order/list";
	}
	
	@PostMapping("checkout")
	public String checkout(HttpServletRequest request,Model model ) {
		String[] data = request.getParameterValues("cart_no");
		List<CartVO> list = new ArrayList<CartVO>();
		for(int i=0 ; i<data.length ; i++) {
			CartVO cartVo = new CartVO();
			cartVo.setCart_no(	Integer.parseInt(data[i]));
			list.add(cartVo);
		}
		System.out.println("주문 정보 : " + data[0]);
		model.addAttribute("checkoutList", cartService.getCheckedoutCartList(list));
		model.addAttribute("sub_total_price", cartService.getSelectedSubTotalPrice(list));
		return "order/checkout";
	}
}
