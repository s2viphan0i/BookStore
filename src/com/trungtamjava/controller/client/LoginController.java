package com.trungtamjava.controller.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.trungtamjava.model.User;
import com.trungtamjava.service.UserService;
import com.trungtamjava.service.Impl.UserServiceImpl;
import com.trungtamjava.util.Function;

@WebServlet(urlPatterns = { "/client/login" })
public class LoginController extends HttpServlet {
	private UserService userService;
	private Function function;
	
	@Override
	public void init() throws ServletException {
		userService = new UserServiceImpl();
		function = new Function();
		super.init();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		UserService usi = new UserServiceImpl();
		String md5Password = function.MD5(password);
		User user = usi.login(username, md5Password);
		if (user != null) {
			HttpSession session = req.getSession();
			session.setAttribute("current_user", user);
			String destination = req.getContextPath() +"/client/index";
			resp.sendRedirect(destination);
		} else {
			req.setAttribute("error_type", 0);

			RequestDispatcher dispatcher = req.getRequestDispatcher("/client/pages/login.jsp");
			dispatcher.forward(req, resp);
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/client/pages/login.jsp");
		dispatcher.forward(req, resp);
	}
}
