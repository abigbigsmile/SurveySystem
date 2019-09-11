package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaBean.Login;
import javaBean.Paper;
import javaBean.User;
import service.LoginService;
import service.PaperService;
import service.UserService;
import service.impl.LoginServiceImpl;
import service.impl.PaperServiceImpl;
import service.impl.UserServiceImpl;

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	@Override
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userName = request.getParameter("inputUserName").trim();
		String userPassword = request.getParameter("inputPassword").trim();
		
		String rtnMsg = "ERROR";
System.out.println(request.getRequestURL());		
		Login login = null;
		User user = null;
		LoginService loginService = new LoginServiceImpl();
		UserService userService = new UserServiceImpl();
		PaperService paperService = new PaperServiceImpl();

		if (userName != null && userPassword != null) {
			// 登录成功，带着登录信息跳转到个人中心：home.jsp
			login = loginService.loginInfo(userName, userPassword);
		}
		if (login == null || login.isLogin() == false) {
			login = new Login();
			login.setUserName(userName);
			login.setUserPassword(userPassword);
			login.setAdmin(false);
			login.setLogin(false);
			HttpSession session = request.getSession();
			session.setAttribute("rtnMsg", rtnMsg);
			response.sendRedirect("login.jsp");
		} else {			
			if(login != null && login.isAdmin() == true){
				HttpSession session = request.getSession();
				session.setAttribute("admined", "admined");
				response.sendRedirect("admin.jsp");
			}else{
				user = new User();
				user = userService.findUserByUserName(userName);
				List<Paper> papers = paperService.findPaperByUserId(user.getUserId());
				HttpSession session = request.getSession();
				session.setAttribute("loginInfo", login);
				session.setAttribute("papers", papers);
				session.setAttribute("userInfo", user);
				response.sendRedirect("home.jsp");
			}
			
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	@Override
	public void init() throws ServletException {
		// Put your code here
	}

}
