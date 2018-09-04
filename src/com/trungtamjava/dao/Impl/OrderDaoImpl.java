package com.trungtamjava.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;
import com.trungtamjava.connection.JDBCConnection;
import com.trungtamjava.dao.OrderDao;
import com.trungtamjava.model.Category;
import com.trungtamjava.model.Item;
import com.trungtamjava.model.Order;
import com.trungtamjava.model.SearchOrder;
import com.trungtamjava.model.User;
import com.trungtamjava.util.Function;

public class OrderDaoImpl implements OrderDao {
	private Connection con = null;

	public OrderDaoImpl() {
		con = JDBCConnection.getJDBCConnection();
	}
	
	public void insert(Order order) {
		try {
			con.setAutoCommit(false);
			String sql = "INSERT INTO orders(user_id, status) VALUES (?, ?)";
			PreparedStatement preparedStatement = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			preparedStatement.setInt(1, order.getCustomer().getId());
			preparedStatement.setInt(2, 0);
			int orderID = preparedStatement.executeUpdate();
			String sqlItems = "INSERT INTO item(book_id, quantity, price, orders_id) VALUES (?, ?, ?, ?)";
			preparedStatement = con.prepareStatement(sqlItems);
			for(Item item : order.getItems()) {
				preparedStatement.setInt(1, item.getBook().getId());
				preparedStatement.setInt(2, item.getQuantity());
				preparedStatement.setLong(3, item.getPrice());
				preparedStatement.setInt(4, orderID);
				preparedStatement.addBatch();
			}
			
			preparedStatement.executeBatch();
			con.commit();
			
		} catch (Exception ex) {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			ex.printStackTrace();
		}
	}

	@Override
	public List<Order> search(SearchOrder searchOrder) {
		List<Order> listOrders = new ArrayList<Order>();
		try {
			String sql = "SELECT user.username, orders.status, orders.orders_id FROM orders INNER JOIN user ON orders.user_id = user.id WHERE LCASE(user.username) LIKE LCASE(?)";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			if (searchOrder.getKeyWord() == null) {
				preparedStatement.setString(1, "%%");
			} else {
				preparedStatement.setString(1, "%" + searchOrder.getKeyWord() + "%");
			}
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getInt("orders_id"));
				User user = new User();
				user.setFullName(rs.getString("username"));
				order.setStatus(rs.getInt("status"));
				order.setCustomer(user);
			}
			return listOrders;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
