package com.meta.cart.controller;

import com.google.gson.Gson;
import com.meta.cart.service.CartService;
import com.meta.cart.vo.CartVO;
import com.meta.config.auth.PrincipalDetails;
import com.meta.util.dataUtil;
import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.json.JSONException;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

	private static final Logger log = LoggerFactory.getLogger(CartController.class);

	@Autowired
	private CartService cartService;

	@PostMapping("/add")
	@ResponseBody
	public String addCart(@AuthenticationPrincipal PrincipalDetails principalDetails, @ModelAttribute CartVO cartVo) {
		long memberId = principalDetails != null ? principalDetails.getMember().getM_no() : 0;
		
		if (memberId != 0) {
			cartVo.setM_no(memberId);
			if (cartService.checkIfCartExisted(cartVo)) {
				if (cartService.checkBookQuantity(cartVo) >= cartVo.getCart_book_qt()) {
					return "2";
				} else {
					cartService.modifyQuantity(cartVo);
					return "1";
				}
			} else {
				cartService.addCart(cartVo);
				dataUtil.updateCartInfo(principalDetails,cartService);
				return "1";
			}

		} else {
			return "0";
		}
	}

	@GetMapping("/details")
	public String showCartDeatils(Model model, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		long m_no = principalDetails.getMember().getM_no();

		List<CartVO> list = cartService.getCartList(m_no);
		model.addAttribute("cartList", list);
		if (cartService.getCartCount(m_no) != 0) {
			model.addAttribute("subTotalPrice", cartService.getSubTotalPrice(m_no));
		}
		return "cart/cart";

	}

	@PostMapping("/modify/quantity")
	@ResponseBody
	public CartVO modifyQuantity(@ModelAttribute CartVO cartVo,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		cartService.modifyQuantity(cartVo);
		dataUtil.updateCartInfo(principalDetails,cartService);
		return cartService.getACart(cartVo.getCart_no());
	}

	@PostMapping("/delete")
	@ResponseBody
	public long deleteCart(@ModelAttribute CartVO cartVo, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		cartService.deleteCart(cartVo.getCart_no());
		long m_no = principalDetails.getMember().getM_no();
		long count = cartService.getCartCount(m_no);
		if (count > 0) {
			long subTotal = cartService.getSubTotalPrice(m_no);
			dataUtil.updateCartInfo(principalDetails,cartService);
			return subTotal;
		} else {
			dataUtil.updateCartInfo(principalDetails,cartService);
			return 0;
		}

	}

	@PostMapping("/delete/selected")
	@ResponseBody
	public long deleteAllCart(@RequestParam String data, @AuthenticationPrincipal PrincipalDetails principalDetails)
			throws JSONException {
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
			cartService.deleteSelectedCart(cartList);

			dataUtil.updateCartInfo(principalDetails,cartService);
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

			return cartService.getSelectedSubTotalPrice(cartList);
		}

	}


}