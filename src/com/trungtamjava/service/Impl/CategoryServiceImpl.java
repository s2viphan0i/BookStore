package com.trungtamjava.service.Impl;

import java.util.List;

import com.trungtamjava.dao.CategoryDao;
import com.trungtamjava.dao.Impl.CategoryDaoImpl;
import com.trungtamjava.model.Category;
import com.trungtamjava.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
	private CategoryDao categoryDao;

	public CategoryServiceImpl() {
		categoryDao = new CategoryDaoImpl();
	}

	@Override
	public List<Category> search(String key) {
		return categoryDao.search(key);
	}

	@Override
	public boolean insert(Category category) {
		return categoryDao.insert(category);
	}

	@Override
	public boolean update(Category category) {
		return categoryDao.update(category);
	}

	@Override
	public boolean delete(int id) {
		return categoryDao.delete(id);
	}

	@Override
	public Category getCategorybyId(int id) {
		return categoryDao.getCategorybyId(id);
	}

}
