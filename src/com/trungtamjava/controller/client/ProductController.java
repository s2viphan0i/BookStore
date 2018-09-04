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

@WebServlet(urlPatterns = { "/client/index" })
public class ProductController extends HttpServlet {
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
		String key = req.getParameter("key");
		int page = 1;
		if(req.getParameter("page")!=null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
		int sorting = 1, price = 1;
		if(req.getParameter("sort")!=null) {
			sorting = Integer.parseInt(req.getParameter("sort"));
		}
		if(req.getParameter("price")!=null) {
			price = Integer.parseInt(req.getParameter("price"));
		}
		long fromPrice, toPrice;
		switch (price) {
		case 1:
			fromPrice = 0;
			toPrice = 99999999;
			break;
		case 2:
			fromPrice = 0;
			toPrice = 50000;
			break;
		case 3:
			fromPrice = 50000;
			toPrice = 100000;
			break;
		case 4:
			fromPrice = 100000;
			toPrice = 200000;
			break;
		case 5:
			fromPrice = 200000;
			toPrice = 500000;
			break;
		case 6:
			fromPrice = 500000;
			toPrice = 99999999;
			break;
		default:
			fromPrice = 0;
			toPrice = 99999999;
			break;
		}
		SearchBook search = new SearchBook();
		search.setFromPrice(fromPrice);
		search.setToPrice(toPrice);
		search.setSort(sorting);
		search.setKeyWord(key);
		search.setPage(page);
		List<Category> listCategories = categoryService.search(null);
		List<Book> listBooks = bookService.search(search);
		req.setAttribute("search", search);
		req.setAttribute("price", price);
		req.setAttribute("listBooks", listBooks);
		req.setAttribute("listCategories", listCategories);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/client/pages/index.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
