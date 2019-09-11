package service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;

import dao.LoginDao;
import dao.mysqlimpl.LoginDaoImpl;
import javaBean.Login;
import service.LoginService;

public class LoginServiceImpl implements LoginService {

	private LoginDao loginDao = new LoginDaoImpl();
	File file = new File("C:\\config.properties");
	Properties properties = new Properties();

	public Login loginInfo(String userName, String userPassword) {
		// TODO Auto-generated method stub
		try {
			properties.load(new FileInputStream(file));
			String loginDaoString = properties.getProperty("loginDao");
System.out.println(loginDaoString);		
			loginDao = (LoginDao) Class.forName(loginDaoString).newInstance();

		} catch (Exception e) {
			// TODO: handle exception
		}
		return loginDao.loginInfo(userName, userPassword);
	}
}
