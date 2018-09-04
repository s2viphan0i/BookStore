package com.trungtamjava.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.trungtamjava.model.Order;
import com.trungtamjava.model.SearchOrder;
import com.trungtamjava.service.OrderService;
import com.trungtamjava.service.Impl.OrderServiceImpl;

@WebServlet(urlPatterns = { "/admin/pages/order" })
public class OrderController extends HttpServlet {

	OrderService orderService;
	
	@Override
	public void init() throws ServletException {
		orderService = new OrderServiceImpl();
		super.init();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		SearchOrder searchOrder = new SearchOrder();
		if(req.getParameter("key")!=null) {
			String key = (String) req.getParameter("key");
			searchOrder.setKeyWord(key);
		}else {
			searchOrder.setKeyWord("");
		}
		List<Order> listOrder = orderService.search(searchOrder);
		req.setAttribute("listOrder", listOrder);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/pages/order.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
