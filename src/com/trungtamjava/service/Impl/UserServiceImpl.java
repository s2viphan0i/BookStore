package com.trungtamjava.service.Impl;

import java.util.List;

import com.trungtamjava.dao.UserDao;
import com.trungtamjava.dao.Impl.UserDaoImpl;
import com.trungtamjava.model.SearchUser;
import com.trungtamjava.model.User;
import com.trungtamjava.service.UserService;

public class UserServiceImpl implements UserService{
	private UserDao userDao;
	
	public UserServiceImpl() {
		userDao = new UserDaoImpl();
	}
	
	@Override
	public boolean insert(User user) {
		return userDao.insert(user);
	}

	@Override
	public boolean update(User user) {
		return userDao.update(user);
	}

	@Override
	public boolean delete(int id) {
		return userDao.delete(id);
	}

	@Override
	public User get(int id) {
		User user = userDao.getUserbyId(id);
		return user;
	}
	
	@Override
	public List<User> search(SearchUser searchUser) {
		return userDao.search(searchUser);
	}
	
	@Override
	public boolean check(User user) {
		return userDao.check(user);
	}

	@Override
	public User login(String username, String password) {
		return userDao.checklogin(username, password);
	}

}
