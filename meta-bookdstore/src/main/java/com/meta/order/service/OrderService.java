package com.meta.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meta.order.mapper.OrderMapper;
import com.meta.order.vo.OrderItemsVO;
import com.meta.order.vo.OrderVO;

@Service
public class OrderService {
	
	@Autowired
	private OrderMapper mapper;
	
	public int insertOrder(OrderVO orderVo) {
		return mapper.insertOrder(orderVo);
	}
	public int insertOrderItem(OrderItemsVO itemVo) {
		return mapper.insertOrderItem(itemVo);
	}
	public List<OrderItemsVO> getOrderItems(String order_no){
		return mapper.getOrderItems(order_no);
	}
	
	public OrderVO getOrderInfo(String order_no) {
		return mapper.getOrderInfo(order_no);
	}
}
