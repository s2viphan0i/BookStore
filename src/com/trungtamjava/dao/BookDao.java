package com.trungtamjava.dao;

import java.util.List;

import com.trungtamjava.model.Book;
import com.trungtamjava.model.SearchBook;

public interface BookDao {
	boolean update(Book book);
	boolean delete(int id);
	boolean insert(Book book);
	List<Book> search(SearchBook searchBook);
	int count(SearchBook searchBook);
	Book getBookbyId(int id);
}
