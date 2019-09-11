package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaBean.Paper;
import javaBean.User;
import service.PaperService;
import service.UserService;
import service.impl.PaperServiceImpl;
import service.impl.UserServiceImpl;

public class AdminServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = null;
		Paper paper = null;
		UserService userService = new UserServiceImpl();
		PaperService paperService = new PaperServiceImpl();
		// 查找所有用户
		String action = request.getParameter("action");
		if (action != null) {
			if (action.equals("findAllUsers")) {
				List<User> users = userService.findAllUsers();
				HttpSession session = request.getSession();
				session.setAttribute("users", users);
				response.sendRedirect("iframe.jsp");
			} else if (action.equals("findUser")) {// 查找用户，返回查找表单页面
				HttpSession session = request.getSession();
				session.setAttribute("findUser", "findUser");
				response.sendRedirect("iframe.jsp");
			} else if (action.equals("addUser")) {// 添加用户账户
				HttpSession session = request.getSession();
				session.setAttribute("addUser", "addUser");
				response.sendRedirect("iframe.jsp");
			}else if (action.equals("findAllPapers")){
				List<Paper> papers = paperService.findAllPapers();
				HttpSession session = request.getSession();
				session.setAttribute("papers", papers);
				response.sendRedirect("iframe.jsp");
			}else if (action.equals("findPaper")) {// 查找用户，返回查找表单页面
				HttpSession session = request.getSession();
				session.setAttribute("findPaper", "findPaper");
				response.sendRedirect("iframe.jsp");
			}
		}

		// 根据用户ID查找用户信息
		String userIdString = request.getParameter("findUserByUserId");
		if (userIdString != null) {
			int userId = Integer.parseInt(userIdString);
			user = userService.findUserByUserId(userId);
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("findUserResult", user);
				response.sendRedirect("iframe.jsp");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("tips", "ERROR");
				response.sendRedirect("iframe.jsp");
			}
		}
		// 根据用户名查找用户信息
		String userName = request.getParameter("findUserByUserName");
		if (userName != null) {
			user = userService.findUserByUserName(userName);
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("findUserResult", user);
				response.sendRedirect("iframe.jsp");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("tips", "ERROR");
				response.sendRedirect("iframe.jsp");
			}

		}
		String deleteIdString = request.getParameter("deleteUserId");
		if (deleteIdString != null) {
			int deleteId = Integer.parseInt(deleteIdString);
			int result = userService.deleteUsers(deleteId);
			if (result == 0) {
				HttpSession session = request.getSession();
				session.setAttribute("tips", "SUCCESS");
				response.sendRedirect("iframe.jsp");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("tips", "ERROR");
				response.sendRedirect("iframe.jsp");
			}
		}
		// 查找到用户后修改资料
		String modifyUserName = request.getParameter("modifyUserName");
		String modifyUserPassword = request.getParameter("modifyPassword");
		String modifyUserEmail = request.getParameter("modifyEmail");
		if (modifyUserName != null && modifyUserPassword != null && modifyUserEmail != null) {
			user = userService.findUserByUserName(modifyUserName);
			user.setUserPassword(modifyUserPassword);
			user.setUserMail(modifyUserEmail);
			int result = userService.modifyUsers(user);
			if (result == 0) {
				HttpSession session = request.getSession();
				session.setAttribute("tips", "SUCCESS");
				response.sendRedirect("iframe.jsp");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("tips", "ERROR");
				response.sendRedirect("iframe.jsp");
			}
		}
		
		//根据问卷ID查找问卷
		String paperIdString = request.getParameter("findPaperByPaperId");
		if (paperIdString != null) {
			int paperId = Integer.parseInt(paperIdString);
			paper = paperService.findPaperByPaperId(paperId);

			if (paper != null) {
				HttpSession session = request.getSession();
				session.setAttribute("findPaperResult", paper);
				response.sendRedirect("iframe.jsp");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("tips", "ERROR");
				response.sendRedirect("iframe.jsp");
			}
		}
		
		// 查找到问卷后修改资料
				String sPaperId = request.getParameter("paperId");
				if(sPaperId != null) {
					int paperId = Integer.parseInt(sPaperId);
					String modifyPaperTitle = request.getParameter("modifyPaperTitle");
					String modifyPaperSummery = request.getParameter("modifyPaperSummery");
					if (modifyPaperTitle != null && modifyPaperSummery != null) {
						Paper p = paperService.findPaperByPaperId(paperId);
						p.setPaperTitle(modifyPaperTitle);
						p.setPaperStartDate(modifyPaperSummery);
						int result = 1;
						if (result == 0) {
							HttpSession session = request.getSession();
							session.setAttribute("tips", "SUCCESS");
							response.sendRedirect("iframe.jsp");
						} else {
							HttpSession session = request.getSession();
							session.setAttribute("tips", "ERROR");
							response.sendRedirect("iframe.jsp");
						}
					}
				}
			
		
		
		
		//根据PaperId删除问卷
		String deletePaperIdString = request.getParameter("deletePaperId");
		if (deletePaperIdString != null) {
			int deleteId = Integer.parseInt(deletePaperIdString);
			int result = paperService.deletePaperByPaperId(deleteId);
			if (result == 0) {
				HttpSession session = request.getSession();
				session.setAttribute("tips", "SUCCESS");
				response.sendRedirect("iframe.jsp");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("tips", "ERROR");
				response.sendRedirect("iframe.jsp");
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

		this.doGet(request, response);
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
