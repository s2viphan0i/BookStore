package com.trungtamjava.dao;

import java.util.List;

import com.trungtamjava.model.SearchUser;
import com.trungtamjava.model.User;

public interface UserDao {
	boolean insert(User user);
	boolean update(User user);
	boolean delete(int id);
	User getUserbyId(int id);
	boolean check(User user);
	User checklogin(String username, String password);
	List<User> search(SearchUser searchUser);
}
