package com.meta.cart.service;

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
	
	public boolean checkIfCartExisted(CartVO cartVo) {
		if(mapper.checkIfCartExisted(cartVo)>0) {
			return true;
		}else {
			return false;
		}
		
	}
	public int checkBookQuantity(CartVO cartVo) {
		return mapper.checkBookQuantity(cartVo);
		
	}
	
	public int addCart(CartVO cartVo) {
		System.out.println("cart service = "+cartVo);
		return mapper.addCart(cartVo);
	}
	
	public List<CartVO> getCartList(long m_no) {
		List<CartVO> cartList = mapper.getCartList(m_no);
		for(int i=0 ;i <cartList.size() ; i++) {
			CartVO cartVo = cartList.get(i);
			int stock = cartVo.getStock();
			if(stock == 0) {
				cartVo.setCart_book_qt(0);
				cartVo.setCart_total_price(0);
				mapper.modifyQuantity(cartVo);
			}else if(stock < cartVo.getCart_book_qt()) {
				int price = cartVo.getPrice();
				cartVo.setCart_book_qt(stock);
				cartVo.setCart_total_price(price*stock);
				mapper.modifyQuantity(cartVo);
			}
		}
		return cartList;
	}
	
	public CartVO getACart(int cart_no) {
		CartVO cartVo = mapper.getACart(cart_no);
		cartVo.setSub_total_price(mapper.getSubTotalPrice(cartVo.getM_no()));
		return cartVo;
	}
	public List<CartVO> getCheckedoutCartList(List<CartVO> checkoutList){
		return mapper.getCheckedoutCartList(checkoutList);
	}
	public long getSubTotalPrice(long m_no) {
		return mapper.getSubTotalPrice(m_no);
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
