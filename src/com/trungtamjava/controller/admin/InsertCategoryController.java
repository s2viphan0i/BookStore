package com.trungtamjava.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.trungtamjava.model.Category;
import com.trungtamjava.service.CategoryService;
import com.trungtamjava.service.Impl.CategoryServiceImpl;

@WebServlet(urlPatterns = { "/admin/pages/insertCategory" })
public class InsertCategoryController extends HttpServlet {
private CategoryService categoryService;
	
	@Override
	public void init() throws ServletException {
		categoryService = new CategoryServiceImpl();
		super.init();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		boolean fault = false;
		String categoryName = req.getParameter("name");
		
		Category category = new Category(0, categoryName);
		if(categoryService.insert(category)) {
			fault = true;
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/pages/insertCategory.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/pages/insertCategory.jsp");
		dispatcher.forward(req, resp);
	}

}
