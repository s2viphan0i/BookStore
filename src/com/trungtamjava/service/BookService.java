package com.trungtamjava.service;

import java.util.List;

import com.trungtamjava.model.Book;
import com.trungtamjava.model.SearchBook;

public interface BookService {
	boolean update(Book book);
	boolean delete(int id);
	boolean insert(Book book);
	List<Book> search(SearchBook searchBook);
	Book getBookbyId(int id);
}
