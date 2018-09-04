package com.trungtamjava.service;

import java.util.List;

import com.trungtamjava.model.Order;
import com.trungtamjava.model.SearchOrder;

public interface OrderService {
	public void insert(Order order);
	public List<Order> search(SearchOrder seachOrder);
}
