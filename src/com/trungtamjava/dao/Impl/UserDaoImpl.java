package com.trungtamjava.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.trungtamjava.connection.JDBCConnection;
import com.trungtamjava.dao.UserDao;
import com.trungtamjava.model.SearchUser;
import com.trungtamjava.model.User;

public class UserDaoImpl implements UserDao {
	
	private Connection con = null;
	
	public UserDaoImpl() {
	}

	@Override
	public boolean insert(User user) {
		try {
			con = JDBCConnection.getJDBCConnection();
			String sql = "INSERT INTO user(username,password,fullname,role) VALUES(?,?,?,?)";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getFullName());
			preparedStatement.setInt(4, user.getRole());
			preparedStatement.executeUpdate();
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(User user) {
		try {
			con = JDBCConnection.getJDBCConnection();
			String sql = "UPDATE user SET fullname = ?, role = ? WHERE id = ?";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, user.getFullName());
			preparedStatement.setInt(2, user.getRole());
			preparedStatement.setInt(3, user.getId());
			preparedStatement.executeUpdate();
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(int id) {
		try {
			con = JDBCConnection.getJDBCConnection();
			String sql = "DELETE FROM user WHERE id = ?";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public User getUserbyId(int id) {
		try {
			con = JDBCConnection.getJDBCConnection();
			String sql = "SELECT * FROM user WHERE id = ?";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setFullName(rs.getString("fullname"));
				user.setRole(rs.getInt("role"));
				return user;
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public User checklogin(String username, String password) {
		try {
			con = JDBCConnection.getJDBCConnection();
			String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setFullName(rs.getString("fullname"));
				user.setRole(rs.getInt("role"));
				return user;
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public List<User> search(SearchUser searchUser) {
		try {
			List<User> listUser = new ArrayList<>();
			con = JDBCConnection.getJDBCConnection();
			String sql = "SELECT * FROM user WHERE CONCAT(username, fullname) LIKE ? AND role < ?";
			System.out.println(searchUser.getRole());
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, "%"+searchUser.getKeyWord()+"%");
			preparedStatement.setInt(2, searchUser.getRole());
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setFullName(rs.getString("fullname"));
				user.setRole(rs.getInt("role"));
				listUser.add(user);
			}
			return listUser;
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
	
	@Override
	public boolean check(User user) {
		try {
			String username = user.getUsername();
			con = JDBCConnection.getJDBCConnection();
			String sql = "SELECT * FROM user WHERE username = ?";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, username);
			ResultSet rs = preparedStatement.executeQuery();
			if (!rs.isBeforeFirst()) {    
			    return true;
			} 
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

}
