package com.meta.cart.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.meta.cart.vo.CartVO;

@Mapper
public interface CartMapper {
	public int checkIfCartExisted(CartVO cartVo);
	public int checkBookQuantity(CartVO cartVo);
	public int addCart(CartVO cartVo);
	public List<CartVO> getCartList(long m_no);
	public CartVO getACart(int cart_no);
	public long getSubTotalPrice(long m_no);
	public long getSelectedSubTotalPrice(List<CartVO> cartList);
	public long getCartCount(long m_no);
	public int modifyQuantity(CartVO cartVo);
	public int deleteCart(int cart_no);
	public int deleteSelectedCart(List<CartVO> cartList);
	public List<CartVO> getCheckedoutCartList(List<CartVO> checkoutList);
}