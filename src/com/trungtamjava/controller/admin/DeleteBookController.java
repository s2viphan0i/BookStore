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
import com.trungtamjava.service.BookService;
import com.trungtamjava.service.Impl.BookServiceImpl;
import com.trungtamjava.util.CommonConstant;
import com.trungtamjava.util.Function;

@WebServlet(urlPatterns = { "/admin/pages/deleteBook"})
public class DeleteBookController extends HttpServlet {
private BookService bookService;
	
	@Override
	public void init() throws ServletException {
		bookService = new BookServiceImpl();
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
		bookService.delete(id);
		resp.sendRedirect("/BookShopOnline/admin/pages/searchBook");
	}
}
