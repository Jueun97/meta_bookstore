package com.meta.order.mapper;

import com.meta.order.vo.OrderItemsVO;
import com.meta.order.vo.OrderStatusVO;
import com.meta.order.vo.OrderVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {
	public int insertOrder(OrderVO orderVo);
	public int insertOrderItem(OrderItemsVO itemVo);
	public List<OrderItemsVO> getOrderItems(String order_no);
	public OrderVO getOrderInfo(String order_no);
	public List<OrderVO> getOrderList(long m_no);
	public int deleteOrder(String order_no);
	public int updateOrderInfo(OrderVO orderVo);
	public int setOrderCount(OrderVO orderCountVo);

	//-----------------------------------------관리자----------------------------------------------
	public List<OrderVO> orderList();
	public OrderVO getOneOrderInfo(String order_no);
	public List<OrderStatusVO> getOrderStatusInfo();
	public int updateOrderAdmin(OrderVO orderVo);
}
