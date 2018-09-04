package com.trungtamjava.controller.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.trungtamjava.model.Order;
import com.trungtamjava.model.User;
import com.trungtamjava.service.OrderService;
import com.trungtamjava.service.Impl.OrderServiceImpl;

@WebServlet(urlPatterns = { "/client/user/order" })
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
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("current_user");
		Order order = (Order) session.getAttribute("order");
		if(user!=null&&order!=null) {
			order.setCustomer(user);
			orderService.insert(order);
		}
		session.removeAttribute("order");
		RequestDispatcher dispatcher = req.getRequestDispatcher("/client/pages/success.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
}
