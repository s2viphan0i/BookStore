package com.trungtamjava.controller.admin;

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

@WebServlet(urlPatterns = { "/admin/pages/insertBook" })
@MultipartConfig(maxFileSize = 1073741824)
public class InsertBookController extends HttpServlet {
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
			boolean fault = false;
			String bookName = "", authorName = "", note = "";
			Date releaseDate = new Date();
			long price = 0;
			Category category = new Category();
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
				if(fileItem.isFormField()) {
					if(fileItem.getFieldName().equals("name")) {
						bookName = fileItem.getString("UTF-8");
					}else if(fileItem.getFieldName().equals("author")) {
						authorName = fileItem.getString("UTF-8");
					}else if(fileItem.getFieldName().equals("releaseDate")) {
						releaseDate = Function.StringtoDate(fileItem.getString(), "MM/dd/yyyy");
					}else if(fileItem.getFieldName().equals("price")) {
						price = Long.parseLong(fileItem.getString());
					}else if(fileItem.getFieldName().equals("category")) {
						category.setId(Integer.parseInt(fileItem.getString()));
					}else if(fileItem.getFieldName().equals("note")) {
						note = fileItem.getString("UTF-8");
					}
				}
			}
			Book book = new Book(0, bookName, authorName, url, releaseDate, price, category, note);
			if(bookService.insert(book)) {
				fault = true;
			}
			RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/pages/insertBook.jsp");
			dispatcher.forward(req, resp);
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
