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

@WebServlet(urlPatterns = { "/admin/pages/editUser" })
public class EditUserController extends HttpServlet {
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
		String fullname = req.getParameter("fullname");
		System.out.println(fullname);
		int role = Integer.parseInt(req.getParameter("role"));
		User user = new User(0, "", "", fullname, role);
		if (userService.insert(user)) {
			fault = true;
		}
		resp.sendRedirect("/BookShopOnline/admin/pages/searchUser");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		if (req.getParameter("id") == null) {
			resp.sendRedirect("/BookShopOnline/admin/pages/searchUser");
		} else {
			int id = Integer.parseInt(req.getParameter("id"));
			User user = userService.get(id);
			req.setAttribute("user", user);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/pages/editUser.jsp");
			dispatcher.forward(req, resp);
		}
	}
}
