package service;

import javaBean.Login;

public interface LoginService {
	
	Login loginInfo(String userName, String userPassword);
	
}
