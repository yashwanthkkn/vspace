package com.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.entities.Answer;
import com.entities.Order;

@Repository
public class OrderDAOImpl extends AbstractDAO<Integer, Order> implements OrderDAO {

	@Override
	public Order findById(int oid) {
		return findById(oid);
	}

	@Override
	public void saveOrder(Order order) {
		persist(order);
	}

	@Override
	public void deleteOrder(Order order) {
		delete(order);
	}

	@Override
	public List<Order> findAllOrders() {
		Criteria criteria = createEntityCriteria();
        return (List<Order>) criteria.list();
	}

	@Override
	public List<Order> findOrdersByUid(int uid) {
		Criteria criteria = createEntityCriteria();
		return (List<Order>) criteria.add(Restrictions.eq("uid", uid)).list();
	}

}
