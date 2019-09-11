package control;

import java.io.IOException;
import java.util.*;
import java.text.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaBean.Login;
import javaBean.User;
import service.LoginService;
import service.UserService;
import service.impl.LoginServiceImpl;
import service.impl.UserServiceImpl;

public class RegServlet extends HttpServlet {


	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String from = request.getParameter("from");
		String userName = request.getParameter("inputUserName");
		String userPassword = request.getParameter("inputPassword");
		String userSexString = request.getParameter("inputSex");
		int userSex = Integer.parseInt(userSexString);
		String userEmail = request.getParameter("inputEmail");

		Date now = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance();
		String datetime = dateFormat.format(now);

		UserService userService = new UserServiceImpl();
		if (userService.findUserByUserName(userName) == null) {
			User user = new User();
			user.setUserName(userName);
			user.setUserPassword(userPassword);
			user.setUserIcon("default_icon.png");
			user.setUserMail(userEmail);
			user.setUserReg(datetime);
			user.setUserSex(userSex);
			user.setUserRole(1);
			userService.addUsers(user);
		}
		if (from != null && from.equals("fromAdmin")) {
			HttpSession session = request.getSession();
			session.setAttribute("tips", "SUCCESS");
			response.sendRedirect("iframe.jsp");
		} else {
			Login login = null;
			LoginService loginService = new LoginServiceImpl();
			// 登录成功，带着登录信息跳转到个人中心：home.jsp
			login = loginService.loginInfo(userName, userPassword);
			HttpSession session = request.getSession();
			session.setAttribute("loginInfo", login);
			response.sendRedirect("home.jsp");
		}
	}


	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.doGet(request, response);
	}



}
