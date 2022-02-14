package com.meta.cart.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.meta.cart.vo.CartVO;

@Mapper
public interface CartMapper {
	
	public int addCart(CartVO cartVo);
	public ArrayList<CartVO> getCartList(long m_no);
	public CartVO getACart(int cart_no);
	public long getSubTotalPrice();
	public long getSelectedSubTotalPrice(List<CartVO> cartList);
	public long getCartCount(long m_no);
	public int modifyQuantity(CartVO cartVo);
	public int deleteCart(int cart_no);
	public int deleteSelectedCart(List<CartVO> cartList);
}