package com.meta.cart.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.meta.cart.service.CartService;
import com.meta.cart.vo.CartVO;
import com.meta.config.auth.PrincipalDetails;

@Controller
@RequestMapping("/cart")
public class CartController {

	private static final Logger log = LoggerFactory.getLogger(CartController.class);

	@Autowired
	private CartService cartService;

	@PostMapping("/add")
	@ResponseBody
	public String addCart(@AuthenticationPrincipal PrincipalDetails principalDetails, @ModelAttribute CartVO cartVo) {
		long memberId = principalDetails.getMember() != null ? principalDetails.getMember().getM_no() : 0;

		if (memberId != 0) {
			cartVo.setM_no(memberId);
			cartService.addCart(cartVo);
			System.out.println("cart" + cartVo.toString());
			updateCartInfo(principalDetails);
			return "true";
		} else {
			return "false";
		}
	}

	@GetMapping("/details")
	public String showCartDeatils(Model model,@AuthenticationPrincipal PrincipalDetails principalDetails) {
		System.out.println(">>>>"+principalDetails.getMember().getM_no());
		long m_no = principalDetails.getMember().getM_no();
		ArrayList<CartVO> list = cartService.getCartList(m_no);
		model.addAttribute("cartList", list);
		return "cart/cart";

	}

	@PostMapping("/modify/quantity")
	@ResponseBody
	public CartVO modifyQuantity(@ModelAttribute CartVO cartVo, HttpServletRequest request,@AuthenticationPrincipal PrincipalDetails principalDetails) {
		System.out.println("result >> " + cartVo.toString());
		cartService.modifyQuantity(cartVo);
		updateCartInfo(principalDetails);
		return cartService.getACart(cartVo.getCart_no());
	}

	@PostMapping("/delete")
	@ResponseBody
	public long deleteCart(@ModelAttribute CartVO cartVo, HttpServletRequest request,@AuthenticationPrincipal PrincipalDetails principalDetails) {
		cartService.deleteCart(cartVo.getCart_no());
		long count = cartService.getCartCount(principalDetails.getMember().getM_no());
		if (count > 0) {
			long subTotal = cartService.getSubTotalPrice();
			updateCartInfo(principalDetails);
			return subTotal;
		} else {
			updateCartInfo(principalDetails);
			return 0;
		}

	}

	@PostMapping("/delete/selected")
	@ResponseBody
	public long deleteAllCart(HttpServletRequest request,@RequestParam String data) throws JSONException {
		JSONArray jsonArray = new JSONArray(data);

		if (jsonArray.length() == 0) {
			return 0;
		} else {
			Gson gson = new Gson();
			int index = 0;
			List<CartVO> cartList = new ArrayList<CartVO>();
			while (index < jsonArray.length()) {
				CartVO cartVo = gson.fromJson(jsonArray.get(index).toString(), CartVO.class);

				cartList.add(cartVo);

				index++;
			}

			// jsonArray = (JSONArray) object.get("list");
			cartService.deleteSelectedCart(cartList);
			return 0;
		}

	}

	@PostMapping("/choose")
	@ResponseBody
	public long chooseCart(@RequestParam String data) throws JSONException {

		JSONArray jsonArray = new JSONArray(data);

		if (jsonArray.length() == 0) {
			return 0;
		} else {
			Gson gson = new Gson();
			int index = 0;
			List<CartVO> cartList = new ArrayList<CartVO>();
			while (index < jsonArray.length()) {
				CartVO cartVo = gson.fromJson(jsonArray.get(index).toString(), CartVO.class);

				cartList.add(cartVo);

				index++;
			}

			// jsonArray = (JSONArray) object.get("list");

			return cartService.getSelectedSubTotalPrice(cartList);
		}
		// System.out.println(data.getClass().getSimpleName());

	}

	public void updateCartInfo(@AuthenticationPrincipal PrincipalDetails principalDetails) {
	    
		//session.setAttribute("subTotalPrice", formatter.format(subTotal));
		long newCartCount = cartService.getCartCount(principalDetails.getMember().getM_no());
		principalDetails.getMember().setCartCount(newCartCount);

	}

}
