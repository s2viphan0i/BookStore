package com.trungtamjava.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.trungtamjava.connection.JDBCConnection;
import com.trungtamjava.dao.CategoryDao;
import com.trungtamjava.model.Category;

public class CategoryDaoImpl implements CategoryDao {

	private Connection con = null;

	public CategoryDaoImpl() {
		con = JDBCConnection.getJDBCConnection();
	}
	@Override
	public List<Category> search(String key) {
		List<Category> listCategories = new ArrayList<Category>();
		try {
			String sql = "SELECT * FROM category WHERE LCASE(category_name) LIKE LCASE(?)";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			if (key == null) {
				preparedStatement.setString(1, "%%");
			} else {
				preparedStatement.setString(1, "%" + key + "%");
			}
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Category category = new Category();
				category.setId(rs.getInt("category_id"));
				category.setName(rs.getString("category_name"));
				listCategories.add(category);
			}
			return listCategories;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public boolean insert(Category category) {
		try {
			String sql = "INSERT INTO category(category_name) VALUES(?)";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, category.getName());
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}
	
	@Override
	public boolean update(Category category) {
		try {
			String sql = "UPDATE category SET category_name = ? WHERE category_id = ?";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, category.getName());
			preparedStatement.setInt(2, category.getId());
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
			String sql = "DELETE FROM category WHERE category_id = ?";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}
	
	public Category getCategorybyId(int id) {
		Category category;
		try {
			String sql = "SELECT * FROM category WHERE category_id = ?";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()) {
				category = new Category();
				category.setId(rs.getInt("category_id"));
				category.setName(rs.getString("category_name"));
				return category;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

}
