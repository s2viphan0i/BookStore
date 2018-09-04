package com.trungtamjava.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.trungtamjava.model.Category;
import com.trungtamjava.model.User;
import com.trungtamjava.service.CategoryService;
import com.trungtamjava.service.UserService;
import com.trungtamjava.service.Impl.CategoryServiceImpl;
import com.trungtamjava.service.Impl.UserServiceImpl;
import com.trungtamjava.util.Function;

@WebServlet(urlPatterns = { "/admin/pages/insertUser" })
public class InserUserController extends HttpServlet {
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
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		boolean fault = false;
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String repassword = req.getParameter("repassword");
		String fullname = req.getParameter("fullname");
		int role = Integer.parseInt(req.getParameter("role"));
		if (repassword.equals(password)) {
			String md5Password = function.MD5(password);
			User user = new User(0, username, md5Password, fullname, role);
			if (userService.insert(user)) {
				fault = true;
			}
		}else {
			
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/pages/insertUser.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/pages/insertUser.jsp");
		dispatcher.forward(req, resp);
	}
}
