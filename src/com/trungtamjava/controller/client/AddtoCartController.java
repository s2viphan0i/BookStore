package com.trungtamjava.controller.client;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.trungtamjava.model.Book;
import com.trungtamjava.model.Item;
import com.trungtamjava.model.Order;
import com.trungtamjava.service.BookService;
import com.trungtamjava.service.Impl.BookServiceImpl;

@WebServlet(urlPatterns = { "/client/addtoCart"})
public class AddtoCartController extends HttpServlet {
	private BookService bookService;
	
	@Override
	public void init() throws ServletException {
		bookService = new BookServiceImpl();
		super.init();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int quantity = 1;
		int id;
		if(req.getParameter("bookId")!=null) {
			id = Integer.parseInt(req.getParameter("bookId"));
			Book book = bookService.getBookbyId(id);
			if(book!=null) {
				if(req.getParameter("quantity")!=null) {
					quantity = Integer.parseInt(req.getParameter("quantity"));
				}
				HttpSession session = req.getSession();
				if(session.getAttribute("order")==null) {
					Order order = new Order();
					List<Item> listItems = new ArrayList<Item>();
					Item item = new Item();
					item.setQuantity(quantity);
					item.setBook(book);
					item.setPrice(book.getPrice());
					listItems.add(item);
					order.setItems(listItems);
					session.setAttribute("order", order);
				} else {
					Order order = (Order) session.getAttribute("order");
					List<Item> listItems = order.getItems();
					boolean check = false;
					for(Item item : listItems) {
						if(item.getBook().getId()==book.getId()) {
							item.setQuantity(item.getQuantity()+quantity);
							check = true;
						}
					}
					if(check==false) {
						Item item = new Item();
						item.setQuantity(quantity);
						item.setBook(book);
						item.setPrice(book.getPrice());
						listItems.add(item);
					}
					session.setAttribute("order", order);
				}
			}
			resp.sendRedirect(req.getContextPath()+"/client/index");
		} else {
			resp.sendRedirect(req.getContextPath()+"/client/index");
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		super.doPost(req, resp);
	}
}
