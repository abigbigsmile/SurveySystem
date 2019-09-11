package dao;

import java.util.List;

import javaBean.User;

public interface UserDao {

	List<User> findAllUsers();
	
	User findUserByUserId(int userId);
	User findUserByUserName(String userName);
		
	int addUsers(User user);
	int modifyUsers(User user);
	int deleteUsers(int userId);
}
