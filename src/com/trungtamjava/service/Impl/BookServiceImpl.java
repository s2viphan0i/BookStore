package com.trungtamjava.service.Impl;

import java.util.List;

import com.trungtamjava.dao.BookDao;
import com.trungtamjava.dao.Impl.BookDaoImpl;
import com.trungtamjava.model.Book;
import com.trungtamjava.model.SearchBook;
import com.trungtamjava.service.BookService;

public class BookServiceImpl implements BookService{
	private BookDao bookDao;
	
	public BookServiceImpl() {
		bookDao = new BookDaoImpl();
	}

	@Override
	public boolean update(Book book) {
		Book oldBook = bookDao.getBookbyId(book.getId());
		oldBook.setName(book.getName());
		oldBook.setAuthor(book.getAuthor());
		oldBook.setReleaseDate(book.getReleaseDate());
		oldBook.setPrice(book.getPrice());
		oldBook.setCategory(book.getCategory());
		oldBook.setNote(book.getNote());
		if(!book.getImage().equals("")) {
			oldBook.setImage(book.getImage());
		}
		return bookDao.update(oldBook);
	}

	@Override
	public boolean delete(int id) {
		return bookDao.delete(id);
	}

	@Override
	public boolean insert(Book book) {
		return bookDao.insert(book);
	}

	@Override
	public List<Book> search(SearchBook searchBook) {
		int count = bookDao.count(searchBook);
		int total = (int) Math.ceil((double)count/searchBook.getPageSize());
		searchBook.setTotalPage(total);
		searchBook.setTotal(count);
		return bookDao.search(searchBook);
	}

	@Override
	public Book getBookbyId(int id) {
		return bookDao.getBookbyId(id);
	}

}
