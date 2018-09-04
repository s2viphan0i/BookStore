package com.trungtamjava.controller.admin;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.trungtamjava.model.Book;
import com.trungtamjava.model.SearchBook;
import com.trungtamjava.service.BookService;
import com.trungtamjava.service.Impl.BookServiceImpl;

@WebServlet(urlPatterns = { "/admin/pages/searchBook" })
public class SearchBookController extends HttpServlet {
private BookService bookService;
	
	@Override
	public void init() throws ServletException {
		bookService = new BookServiceImpl();
		super.init();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String key = req.getParameter("key");
		int page = 1;
		if(req.getParameter("page")!=null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
		SearchBook searchBook = new SearchBook();
		if(key!=null) {
			searchBook.setKeyWord(key);
		}
		searchBook.setPage(page);
		List<Book> listBooks = bookService.search(searchBook);
		req.setAttribute("search", searchBook);
		req.setAttribute("key", key);
		req.setAttribute("listBooks", listBooks);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/pages/searchBook.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
