package com.meta.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.meta.order.vo.OrderItemsVO;
import com.meta.order.vo.OrderVO;

@Mapper
public interface OrderMapper {
	public int insertOrder(OrderVO orderVo);
	public int insertOrderItem(OrderItemsVO itemVo);
	public List<OrderItemsVO> getOrderItems(String order_no);
	public OrderVO getOrderInfo(String order_no);
}
