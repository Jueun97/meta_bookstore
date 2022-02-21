package com.meta.order.service;

import com.meta.order.mapper.OrderMapper;
import com.meta.order.vo.OrderItemsVO;
import com.meta.order.vo.OrderStatusVO;
import com.meta.order.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
	
	public List<OrderVO> getOrderList(long m_no){
		return mapper.getOrderList(m_no);
	}
	
	public int deleteOrder(String order_no) {
		return mapper.deleteOrder(order_no);
	}
	public int updateOrderInfo(OrderVO orderVo) {
		return mapper.updateOrderInfo(orderVo);
	}

	//------------------------------------------관리자---------------------------------------------------
	public List<OrderVO> orderList(){
		return mapper.orderList();
	}

	public OrderVO getOneOrderInfo(String order_no){
		return mapper.getOneOrderInfo(order_no);
	}

	public List<OrderStatusVO> getOrderStatusInfo(){
		return mapper.getOrderStatusInfo();
	}

	public int updateOrderAdmin(OrderVO orderVo){
		return mapper.updateOrderAdmin(orderVo);
	}
}
