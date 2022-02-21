package com.meta.order.service;

import com.meta.order.mapper.OrderMapper;
import com.meta.order.vo.OrderItemsVO;
import com.meta.order.vo.OrderStatusVO;
import com.meta.order.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.meta.stock.mapper.StockMapper;
import com.meta.stock.vo.StockVO;


@Service
public class OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private StockMapper stockMapper;
	
	public int insertOrder(OrderVO orderVo) {
		return orderMapper.insertOrder(orderVo);
	}
	public int insertOrderItem(OrderItemsVO itemVo) {
		System.out.println("insert order item >>>>> "+ itemVo.toString());
		StockVO stockVo = new StockVO();
		stockVo.setBook_no(itemVo.getBook_no());
		stockVo.setSold_cnt(itemVo.getOrder_qt());
		System.out.println("stock item >>>>> "+ stockVo.toString());
		if(stockMapper.addStockWhenCheckedout(stockVo)>0) {
			return orderMapper.insertOrderItem(itemVo);
		}else {
			return 0;
		}
	
	}
	public int setOrderCount(OrderVO orderCountVo) {
		
		return orderMapper.setOrderCount(orderCountVo);
	}
	public List<OrderItemsVO> getOrderItems(String order_no){
		return orderMapper.getOrderItems(order_no);
	}
	
	public OrderVO getOrderInfo(String order_no) {
		return orderMapper.getOrderInfo(order_no);
	}
	
	public List<OrderVO> getOrderList(long m_no){
		return orderMapper.getOrderList(m_no);
	}
	
	public int deleteOrder(String order_no) {
		List<OrderItemsVO> orderItems = getOrderItems(order_no);
		for(int i=0 ; i<orderItems.size() ; i++) {
			StockVO stockVo = new StockVO();
			stockVo.setBook_no(orderItems.get(i).getBook_no());
			stockVo.setSold_cnt(orderItems.get(i).getOrder_qt());
			stockMapper.removeStockWhenCancelled(stockVo);
		}
		
		return orderMapper.deleteOrder(order_no);
	}
	public int updateOrderInfo(OrderVO orderVo) {
		return orderMapper.updateOrderInfo(orderVo);
	}

	//------------------------------------------관리자---------------------------------------------------
	public List<OrderVO> orderList(){
		return orderMapper.orderList();
	}

	public OrderVO getOneOrderInfo(String order_no){
		return orderMapper.getOneOrderInfo(order_no);
	}

	public List<OrderStatusVO> getOrderStatusInfo(){
		return orderMapper.getOrderStatusInfo();
	}

	public int updateOrderAdmin(OrderVO orderVo){
		return orderMapper.updateOrderAdmin(orderVo);
	}
}
