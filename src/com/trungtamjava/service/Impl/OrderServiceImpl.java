package com.trungtamjava.service.Impl;

import java.sql.PreparedStatement;
import java.util.List;

import com.trungtamjava.dao.CategoryDao;
import com.trungtamjava.dao.OrderDao;
import com.trungtamjava.dao.Impl.CategoryDaoImpl;
import com.trungtamjava.dao.Impl.OrderDaoImpl;
import com.trungtamjava.model.Order;
import com.trungtamjava.model.SearchOrder;
import com.trungtamjava.service.OrderService;
import com.trungtamjava.util.Function;

public class OrderServiceImpl implements OrderService {
	private OrderDao orderDao;

	public OrderServiceImpl() {
		orderDao = new OrderDaoImpl();
	}
	
	@Override
	public void insert(Order order) {
		orderDao.insert(order);
	}
	
	public List<Order> search(SearchOrder searchOrder){
		return orderDao.search(searchOrder);
	}

}
