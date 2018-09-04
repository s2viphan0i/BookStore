package com.trungtamjava.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.trungtamjava.model.Book;
import com.trungtamjava.model.Category;
import com.trungtamjava.service.CategoryService;
import com.trungtamjava.service.Impl.CategoryServiceImpl;
import com.trungtamjava.util.CommonConstant;
import com.trungtamjava.util.Function;

@WebServlet(urlPatterns = { "/admin/pages/editCategory" })
public class EditCategoryController extends HttpServlet {
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
		int categoryId = Integer.parseInt(req.getParameter("id"));
		Category category = new Category(categoryId, categoryName);
		fault = categoryService.update(category);
		resp.sendRedirect("/BookShopOnline/admin/pages/searchCategory");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		if (req.getParameter("id") == null) {
			resp.sendRedirect("/BookShopOnline/admin/pages/searchCategory");
		} else {
			int id = Integer.parseInt(req.getParameter("id"));
			Category category = categoryService.getCategorybyId(id);
			req.setAttribute("category", category);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/pages/editCategory.jsp");
			dispatcher.forward(req, resp);
		}
	}
}
