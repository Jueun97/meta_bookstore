package com.meta.util;

import org.springframework.security.core.annotation.AuthenticationPrincipal;

import com.meta.cart.service.CartService;
import com.meta.config.auth.PrincipalDetails;

public class dataUtil {
	public static void updateCartInfo(@AuthenticationPrincipal PrincipalDetails principalDetails, CartService cartService ) {

		long newCartCount = cartService.getCartCount(principalDetails.getMember().getM_no());
		principalDetails.getMember().setCartCount(newCartCount);
	}

}
