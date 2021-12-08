package com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.OrderDAO;
import com.entities.Order;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDAO dao;

	@Override
	public Order findById(int oid) {
		return dao.findById(oid);
	}

	@Override
	public void saveOrder(Order order) {
		dao.saveOrder(order);
	}

	@Override
	public void deleteOrder(Order order) {
		dao.deleteOrder(order);
		
	}

	@Override
	public void updateOrder(Order order) {
		Order entity = dao.findById(order.getOid());
		if(entity != null) {
			entity.setAmount(order.getAmount());
			entity.setStatus(order.getStatus());
			entity.setTid(order.getTid());
			entity.setUid(order.getUid());
		}
	}

	@Override
	public List<Order> findAllOrders() {
		return dao.findAllOrders();
	}

	@Override
	public List<Order> findOrdersByUid(int uid) {
		return dao.findOrdersByUid(uid);
	}

}
