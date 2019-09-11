package control;

import java.util.List;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.PaperDao;
import dao.mysqlimpl.PaperDaoImpl;
import javaBean.Paper;
import javaBean.User;

public class AddPaper extends HttpServlet {


	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}


	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PaperDao paperDao = new PaperDaoImpl();		
		Paper paper = new Paper();		
		HttpSession session = request.getSession();
		String filepath = null ;		
		
		User user = (User) session.getAttribute("userInfo");
		int userId = user.getUserId();

		paper.setUserId(userId);
		
		//背景图片
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload uploader = new ServletFileUpload(factory);
		List<FileItem> list = null;
		// 中文处理
		uploader.setHeaderEncoding("utf-8");
		
		try {
			list = uploader.parseRequest(request);
		} catch (FileUploadException e1) {
			e1.printStackTrace();
		}
		
		for(FileItem item : list){
			if (item.isFormField()){
				// 处理普通表单域
					String fieldName = item.getFieldName();//表单域名
					String fieldValue = new String(item.getString().getBytes("ISO-8859-1"),"utf-8");//表单域的值
					if("paperTitle".equals(fieldName))paper.setPaperTitle(fieldValue);
					else if("paperType".equals(fieldName))paper.setPaperType(Integer.parseInt(fieldValue));
					else if("paperSummary".equals(fieldName))paper.setPaperSummary(fieldValue);
					else ;					
System.out.print(item.getFieldName());
System.out.println(item.getString());
				} else {
					
			
//获取当前的classpath的绝对URI路径 
String p1 = this.getClass().getClassLoader().getResource("").getPath(); 
//获取当前类的加载目录，如果有“／”，获取当前类的所在工程路径 
String p2 = this.getClass().getResource("").getPath();	

//得到工程目录（参数具体到包名） 
String p3 = request.getSession().getServletContext().getRealPath("");
//得到IE地址栏地址 
StringBuffer p4 = request.getRequestURL();
//得到相对地址 
String p5 = request.getRequestURI();
//获取站点的绝对路径 
String p6 = request.getServletContext().getRealPath("/"); 

System.out.println(p1);
System.out.println(p2);	
System.out.println(p3);
System.out.println(p4);	
System.out.println(p5);
System.out.println(p6);	

				//将临时文件保存到指定目录					
					String path = this.getClass().getClassLoader().getResource("").getPath();
					String filePath = path.replace("WEB-INF/classes/", "")+"img/";											
				try {
					String[] names = item.getName().split("\\\\");
					String fileName = names[names.length-1];
					File file = new File(filePath,fileName);
					item.write(file);				
					paper.setPaperBg("img/"+fileName);					
				} catch (Exception e) {
					e.printStackTrace();
				}//执行保存
				}
		}		
		//背景图片结束		
		
		//发布日期
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String paperStartDate = simpleDateFormat.format(date);
		paper.setPaperStartDate(paperStartDate);
		
		//截止日期的设置
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(Calendar.DATE,+30);
		date = calendar.getTime();
		String dataString = simpleDateFormat.format(date);
		paper.setPaperEndDate(dataString);
		
		int paperStatus = 0;//未发布
		paper.setPaperStatus(paperStatus);
		
		//回答次数 
		int paperCount = 0;
		paper.setPaperCount(paperCount);
		
	
		paperDao.addPapers(paper);
		
		int paperId = paperDao.findPaperIdByuserIdAndDate(userId, paperStartDate);
		
		session.setAttribute("paperId", new Integer(paperId));
		response.sendRedirect("addquestion1.jsp");
		
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
