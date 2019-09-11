package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PaperDao;
import dao.QuestionDao;
import dao.mysqlimpl.PaperDaoImpl;
import dao.mysqlimpl.QuestionDaoImpl;
import javaBean.Paper;
import javaBean.User;

public class DeletePage extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeletePage() {
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

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String paperIdString = request.getParameter("paperId");
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("userInfo");
		
		if(paperIdString != null && user != null){
			int paperId = Integer.parseInt(paperIdString);
			int userId = user.getUserId();
			
			PaperDao paperDao = new PaperDaoImpl();
			 int paperNum = paperDao.deletePaperByPaperId(paperId);
			QuestionDao questionDao = new QuestionDaoImpl(); 
			int questionNum = questionDao.deleteQusetionByPaperId(paperId);
			PaperDaoImpl paperDaoImpl = new PaperDaoImpl();
			List<Paper> papers = paperDaoImpl.findPaperByUserId(userId);
			
			session.setAttribute("papers", papers);
			response.sendRedirect("home.jsp");
			
		}
		
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	@Override
	public void init() throws ServletException {
		// Put your code here
	}

}
