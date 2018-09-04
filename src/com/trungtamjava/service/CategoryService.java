package com.trungtamjava.service;

import java.util.List;

import com.trungtamjava.model.Category;

public interface CategoryService {
	public List<Category> search(String key);
	public boolean insert(Category category);
	public boolean update(Category category);
	public boolean delete(int id);
	public Category getCategorybyId(int id);
}
