package com.meta.cart.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meta.cart.mapper.CartMapper;
import com.meta.cart.vo.CartVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartService {
	
	@Autowired
	private CartMapper mapper;
	
	public int addCart(CartVO cartVo) {
		System.out.println("cart service = "+cartVo);
		return mapper.addCart(cartVo);
	}
	
	public ArrayList<CartVO> getCartList(long m_no) {
		return mapper.getCartList(m_no);
	}
	
	public CartVO getACart(int cart_no) {
		CartVO cartVo = mapper.getACart(cart_no);
		cartVo.setSub_total_price(mapper.getSubTotalPrice());
		return cartVo;
	}
	public long getSubTotalPrice() {
		return mapper.getSubTotalPrice();
	}
	public long getSelectedSubTotalPrice(List<CartVO> cartList) {
		return mapper.getSelectedSubTotalPrice(cartList);
	}
	public long getCartCount(long m_no) {
		return mapper.getCartCount(m_no);
	}
	
	public int modifyQuantity(CartVO cartVo) {
		return 	mapper.modifyQuantity(cartVo);
		
	}
	
	public int deleteCart(int cart_no) {
		return mapper.deleteCart(cart_no);
	}	
	public int deleteSelectedCart(List<CartVO> cartList) {
		return mapper.deleteSelectedCart(cartList);
	}
}
