package com.trungtamjava.service;

import java.util.List;

import com.trungtamjava.model.SearchUser;
import com.trungtamjava.model.User;

public interface UserService {
	boolean insert(User user);
	boolean update(User user);
	boolean delete(int id);
	User get(int id);
	boolean check(User user);
	List<User> search(SearchUser searchUser);
	User login(String username, String password);
}
