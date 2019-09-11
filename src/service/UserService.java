package service;

import java.util.List;

import javaBean.User;

public interface UserService {
	
	List<User> findAllUsers();
	
	User findUserByUserId(int userId);
	User findUserByUserName(String userName);

	int addUsers(User user);
	int modifyUsers(User user);
	int deleteUsers(int userId);
}