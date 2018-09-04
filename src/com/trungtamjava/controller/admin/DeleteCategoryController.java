package com.trungtamjava.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.trungtamjava.service.CategoryService;
import com.trungtamjava.service.Impl.CategoryServiceImpl;

@WebServlet(urlPatterns = { "/admin/pages/deleteCategory"})
public class DeleteCategoryController  extends HttpServlet {
private CategoryService categoryService;
	
	@Override
	public void init() throws ServletException {
		categoryService = new CategoryServiceImpl();
		super.init();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		int id = Integer.parseInt(req.getParameter("id"));
		categoryService.delete(id);
		resp.sendRedirect("/BookShopOnline/admin/pages/searchCategory");
	}
}
