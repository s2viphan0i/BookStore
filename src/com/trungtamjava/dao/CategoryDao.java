package com.trungtamjava.dao;

import java.util.List;

import com.trungtamjava.model.Category;

public interface CategoryDao {
	public List<Category> search(String key);
	public boolean insert(Category category);
	public boolean update(Category category);
	public boolean delete(int id);
	public Category getCategorybyId(int id);
}
