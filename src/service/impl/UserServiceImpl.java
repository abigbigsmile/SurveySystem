package service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.Properties;

import dao.UserDao;
import dao.mysqlimpl.UserDaoImpl;
import javaBean.User;
import service.UserService;

public class UserServiceImpl implements UserService {

	private UserDao userDao = new UserDaoImpl();
	File file = new File("C:\\config.properties");
	Properties properties = new Properties();

	public List<User> findAllUsers() {
		// TODO Auto-generated method stub
		try {
			properties.load(new FileInputStream(file));
			String userDaoString = properties.getProperty("userDao");
			userDao = (UserDao) Class.forName(userDaoString).newInstance();
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}
		return userDao.findAllUsers();
	}

	public User findUserByUserId(int userId) {
		// TODO Auto-generated method stub
		try {
			properties.load(new FileInputStream(file));
			String userDaoString = properties.getProperty("userDao");
			userDao = (UserDao) Class.forName(userDaoString).newInstance();
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}
		return userDao.findUserByUserId(userId);
	}

	public User findUserByUserName(String userName) {
		// TODO Auto-generated method stub
		try {
			properties.load(new FileInputStream(file));
			String userDaoString = properties.getProperty("userDao");
			userDao = (UserDao) Class.forName(userDaoString).newInstance();
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}
		return userDao.findUserByUserName(userName);
	}

	public int addUsers(User user) {
		// TODO Auto-generated method stub
		try {
			properties.load(new FileInputStream(file));
			String userDaoString = properties.getProperty("userDao");
			userDao = (UserDao) Class.forName(userDaoString).newInstance();
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}
		return userDao.addUsers(user);
	}

	public int modifyUsers(User user) {
		// TODO Auto-generated method stub
		try {
			properties.load(new FileInputStream(file));
			String userDaoString = properties.getProperty("userDao");
			userDao = (UserDao) Class.forName(userDaoString).newInstance();
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}
		return userDao.modifyUsers(user);
	}

	public int deleteUsers(int userId) {
		// TODO Auto-generated method stub
		try {
			properties.load(new FileInputStream(file));
			String userDaoString = properties.getProperty("userDao");
			userDao = (UserDao) Class.forName(userDaoString).newInstance();
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}
		return userDao.deleteUsers(userId);
	}
}
