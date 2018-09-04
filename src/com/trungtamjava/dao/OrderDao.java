package com.trungtamjava.dao;

import java.util.List;

import com.trungtamjava.model.Order;
import com.trungtamjava.model.SearchOrder;

public interface OrderDao {
	public void insert(Order order);
	public List<Order> search(SearchOrder searchOrder);
}
