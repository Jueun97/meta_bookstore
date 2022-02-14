package com.meta.cart.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
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

@Controller
@RequestMapping("/cart")
public class CartController {

	private static final Logger log = LoggerFactory.getLogger(CartController.class);

	@Autowired
	private CartService cartService;

	@PostMapping("/add")
	@ResponseBody
	public String addCart(HttpServletRequest request, @ModelAttribute CartVO cartVo) {
		System.out.println("cart" + cartVo.toString());
		HttpSession session = request.getSession();
		long memberId = session.getAttribute("memberId") != null ? (long) session.getAttribute("memberId") : 0;

		if (memberId != 0) {
			cartVo.setM_no(memberId);
			cartService.addCart(cartVo);
			System.out.println("cart" + cartVo.toString());
			updateCartInfo(request, cartService.getCartCount(), cartService.getSubTotalPrice());
			return "true";
		} else {
			return "false";
		}
	}

	@GetMapping("/details")
	public String showCartDeatils(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		long m_no = (long) session.getAttribute("memberId");
		ArrayList<CartVO> list = cartService.getCartList(m_no);
		model.addAttribute("cartList", list);
		return "cart/cart";

	}

	@PostMapping("/modify/quantity")
	@ResponseBody
	public CartVO modifyQuantity(@ModelAttribute CartVO cartVo, HttpServletRequest request) {
		System.out.println("result >> " + cartVo.toString());
		cartService.modifyQuantity(cartVo);
		updateCartInfo(request, cartService.getCartCount(), cartService.getSubTotalPrice());
		return cartService.getACart(cartVo.getCart_no());
	}

	@PostMapping("/delete")
	@ResponseBody
	public long deleteCart(@ModelAttribute CartVO cartVo, HttpServletRequest request) {
		cartService.deleteCart(cartVo.getCart_no());
		long count = cartService.getCartCount();
		if (count > 0) {
			long subTotal = cartService.getSubTotalPrice();
			updateCartInfo(request, count, subTotal);
			return subTotal;
		} else {
			updateCartInfo(request, count, 0);
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

	public void updateCartInfo(HttpServletRequest request, long count, long subTotal) {
		HttpSession session = request.getSession(); // 세션을 생성해서

		DecimalFormat formatter = new DecimalFormat("###,###");

		session.setAttribute("subTotalPrice", formatter.format(subTotal));
		session.setAttribute("cartCount", cartService.getCartCount());

	}

}
