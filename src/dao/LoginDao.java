package dao;

import javaBean.Login;

public interface LoginDao {

	Login loginInfo(String userName, String userPassword);
}
