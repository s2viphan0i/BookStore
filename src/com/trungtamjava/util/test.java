package com.trungtamjava.util;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.trungtamjava.model.Book;
import com.trungtamjava.model.Category;
import com.trungtamjava.service.BookService;
import com.trungtamjava.service.CategoryService;
import com.trungtamjava.service.Impl.BookServiceImpl;
import com.trungtamjava.service.Impl.CategoryServiceImpl;
import com.trungtamjava.util.CommonConstant;
import com.trungtamjava.util.Function;

@WebServlet(urlPatterns = { "/test" })
@MultipartConfig(maxFileSize = 1073741824)
public class test extends HttpServlet {
private BookService bookService;
	
	@Override
	public void init() throws ServletException {
		bookService = new BookServiceImpl();
		super.init();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		try {
			Date releaseDate = new Date();
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			diskFileItemFactory.setRepository(new File("/Users/sonvi/eclipse-workspace/BookShopOnline/WebContent"));
			ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
			String url = "";
			List<FileItem> fileItems = fileUpload.parseRequest(req);
			for(FileItem fileItem : fileItems) {
				if(!fileItem.isFormField()) {
					if(fileItem.getFieldName().equals("file")) {
						String fileName = Function.generateUniqueFileName()+"_"+fileItem.getName();
						File file = new File(CommonConstant.IMAGE_LOCATION+fileName);
						fileItem.write(file);
						url = fileName;
					}
				}
			}
			resp.sendRedirect("google.com.vn");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		CategoryService categoryService = new CategoryServiceImpl();
		List<Category> listCategories = categoryService.search("");
		req.setAttribute("listCategories", listCategories);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/pages/insertBook.jsp");
		dispatcher.forward(req, resp);
	}
}

