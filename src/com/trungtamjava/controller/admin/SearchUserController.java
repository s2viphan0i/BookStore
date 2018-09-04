package com.trungtamjava.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.trungtamjava.model.SearchUser;
import com.trungtamjava.model.User;
import com.trungtamjava.service.UserService;
import com.trungtamjava.service.Impl.UserServiceImpl;

@WebServlet(urlPatterns = { "/admin/pages/searchUser"})
public class SearchUserController  extends HttpServlet {
	private UserService userService;
	
	@Override
	public void init() throws ServletException {
		userService = new UserServiceImpl();
		super.init();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		SearchUser searchUser = new SearchUser();
		if(req.getParameter("key")!=null) {
			String key = (String) req.getParameter("key");
			searchUser.setKeyWord(key);
		}else {
			searchUser.setKeyWord("");
		}
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("current_user");
		searchUser.setRole(user.getRole());
		List<User> listUsers = userService.search(searchUser);
		req.setAttribute("listUsers", listUsers);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/pages/searchUser.jsp");
		dispatcher.forward(req, resp);
	}
}
