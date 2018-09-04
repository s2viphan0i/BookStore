package com.trungtamjava.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.trungtamjava.connection.JDBCConnection;
import com.trungtamjava.dao.BookDao;
import com.trungtamjava.model.Book;
import com.trungtamjava.model.Category;
import com.trungtamjava.model.SearchBook;
import com.trungtamjava.util.Function;

public class BookDaoImpl implements BookDao {

	private Connection con = null;

	public BookDaoImpl() {
		con = JDBCConnection.getJDBCConnection();
	}

	@Override
	public boolean update(Book book) {
		try {
			String sql = "UPDATE book SET book_name = ?, book_author = ?, book_image = ?, book_price = ?, category_id = ?, book_releasedate = ?, book_note = ? WHERE book_id = ?";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, book.getName());
			preparedStatement.setString(2, book.getAuthor());
			preparedStatement.setString(3, book.getImage());
			preparedStatement.setLong(4, book.getPrice());
			preparedStatement.setInt(5, book.getCategory().getId());
			preparedStatement.setDate(6, Function.convertDate(book.getReleaseDate()));
			preparedStatement.setString(7, book.getNote());
			preparedStatement.setInt(8, book.getId());
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(int id) {
		try {
			String sql = "DELETE FROM book WHERE book_id = ?";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean insert(Book book) {
		try {
			String sql = "INSERT INTO book(book_name, book_author, book_image, book_price, category_id, book_releasedate, book_note) VALUES(?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, book.getName());
			preparedStatement.setString(2, book.getAuthor());
			preparedStatement.setString(3, book.getImage());
			preparedStatement.setLong(4, book.getPrice());
			preparedStatement.setInt(5, book.getCategory().getId());
			preparedStatement.setDate(6, Function.convertDate(book.getReleaseDate()));
			preparedStatement.setString(7, book.getNote());
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Book> search(SearchBook searchBook) {
		List<Book> listBooks = new ArrayList<Book>();
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM book INNER JOIN category ON book.category_id = category.category_id WHERE LCASE (book_name) LIKE LCASE(?)");
			sql.append(" AND book.book_price BETWEEN ? AND ?");
			switch(searchBook.getSort()) {
			case 1:
				sql.append(" ORDER BY book.book_id ASC");
				break;
			case 2:
				sql.append(" ORDER BY book.book_id DESC");
				break;
			case 3:
				sql.append(" ORDER BY book.book_price ASC");
				break;
			case 4:
				sql.append(" ORDER BY book.book_price DESC");
				break;
			default:
				sql.append(" ORDER BY book.book_id ASC");
				break;
			}
			if(searchBook.getPage()!=null&&searchBook.getPageSize()!=null) {
				sql.append(" LIMIT " + searchBook.getPageSize() + " OFFSET " + (searchBook.getPage()-1)*searchBook.getPageSize());
			}
			PreparedStatement preparedStatement = con.prepareStatement(sql.toString());
			if (searchBook.getKeyWord() == null) {
				preparedStatement.setString(1, "%%");
			} else {
				preparedStatement.setString(1, "%" + searchBook.getKeyWord() + "%");
			}
			preparedStatement.setLong(2, searchBook.getFromPrice());
			preparedStatement.setLong(3, searchBook.getToPrice());
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Book book = new Book();
				Category category = new Category();
				book.setId(rs.getInt("book_id"));
				book.setName(rs.getString("book_name"));
				book.setAuthor(rs.getString("book_author"));
				book.setImage(rs.getString("book_image"));
				book.setPrice(rs.getLong("book_price"));
				book.setReleaseDate(rs.getDate("book_releasedate"));
				category.setId(rs.getInt("category_id"));
				category.setName(rs.getString("category_name"));
				book.setCategory(category);
				book.setNote(rs.getString("book_note"));
				listBooks.add(book);
			}
			return listBooks;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public int count(SearchBook searchBook) {
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT COUNT(*) AS total FROM book INNER JOIN category ON book.category_id = category.category_id WHERE LCASE (book_name) LIKE LCASE(?)");
			sql.append(" AND book.book_price BETWEEN ? AND ?");
			switch(searchBook.getSort()) {
			case 1:
				sql.append(" ORDER BY book.book_id ASC");
				break;
			case 2:
				sql.append(" ORDER BY book.book_id ASC");
				break;
			case 3:
				sql.append(" ORDER BY book.book_price ASC");
				break;
			case 4:
				sql.append(" ORDER BY book.book_price DESC");
				break;
			default:
				sql.append(" ORDER BY book.book_id ASC");
				break;
			}
			PreparedStatement preparedStatement = con.prepareStatement(sql.toString());
			if (searchBook.getKeyWord() == null) {
				preparedStatement.setString(1, "%%");
			} else {
				preparedStatement.setString(1, "%" + searchBook.getKeyWord() + "%");
			}
			preparedStatement.setLong(2, searchBook.getFromPrice());
			preparedStatement.setLong(3, searchBook.getToPrice());
			ResultSet rs = preparedStatement.executeQuery();
			int total = 0;
			while(rs.next()) {
				total = rs.getInt("total");
				return total;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return 0;
	}
	
	@Override
	public Book getBookbyId(int id) {
		Book book;
		try {
			String sql = "SELECT * FROM book INNER JOIN category ON book.category_id = category.category_id WHERE book_id = ?";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				book = new Book();
				Category category = new Category();
				book.setId(rs.getInt("book_id"));
				book.setName(rs.getString("book_name"));
				book.setAuthor(rs.getString("book_author"));
				book.setImage(rs.getString("book_image"));
				book.setPrice(rs.getLong("book_price"));
				book.setReleaseDate(rs.getDate("book_releasedate"));
				category.setId(rs.getInt("category_id"));
				category.setName(rs.getString("category_name"));
				book.setCategory(category);
				book.setNote(rs.getString("book_note"));
				return book;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
}
