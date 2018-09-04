package com.trungtamjava.controller.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.trungtamjava.model.Book;
import com.trungtamjava.model.Category;
import com.trungtamjava.model.SearchBook;
import com.trungtamjava.service.BookService;
import com.trungtamjava.service.CategoryService;
import com.trungtamjava.service.Impl.BookServiceImpl;
import com.trungtamjava.service.Impl.CategoryServiceImpl;

@WebServlet(urlPatterns = { "/client/detail"})
public class DetailBookController extends HttpServlet{
private BookService bookService;
private CategoryService categoryService;
	
	@Override
	public void init() throws ServletException {
		bookService = new BookServiceImpl();
		categoryService = new CategoryServiceImpl();
		super.init();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		List<Category> listCategories = categoryService.search(null);
		req.setAttribute("listCategories", listCategories);
		Book book = bookService.getBookbyId(id);
		req.setAttribute("book", book);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/client/pages/detail.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
