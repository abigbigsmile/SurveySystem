<%@ page language="java" import="java.util.*,javaBean.*,dao.*,dao.mysqlimpl.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'scanservey.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/bookstrap-responsive.min.css" rel="stylesheet" type="text/css">

<script src="js/jquery-1.9.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/html5shiv.js"></script>
<style type="text/css">
body {
	background-repeat: repeat-x;
	background-attachment: fixed;
}

.container {
	margin-top: 15px;
}

.masthead {
	background-color: none;
}

.radio.inline.q2+.radio.inline.q2 {
	margin-right: 30px;
}

.survey {
	border: 1px;
	background-color: white;
	height: auto;
	margin: 0px;
	padding: 15px 0px 0px 30px;
}

.div_question {
	width: 96%;
	height: auto;
	border: 2px solid white;
	padding: 4px 4px;
	margin: 2px auto;
	border-bottom: 1px solid #EFEEEE;
}


.mastfoot {
	text-align: center;
	margin: 10px 0px 5px;
}
</style>
<%
	Paper paper = new Paper() ;
	Login login = (Login) session.getAttribute("loginInfo");
	PaperDao pd = new PaperDaoImpl();
	String pid = request.getParameter("paperId");
	if(pid != null){
		int paperId = Integer.parseInt(pid);
		paper = pd.findPaperByPaperId(paperId);
	}	
 %>
</head>

<body style="background:url('<%=paper.getPaperBg()%>');">
	<div class="container">
		<div class="masthead">
			<ul class="nav nav-pills pull-right">
				<c:choose>
					<c:when test="${sessionScope.loginInfo!=null && sessionScope.loginInfo.isLogin() == true}">
						<li><a href="home.jsp" role="button" class="btn">当前用户：${sessionScope.loginInfo.userName}</a></li>
    					<li>&nbsp;</li>
    					<li><a href="Logout" role="button" class="btn">注销</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="login.jsp" role="button" class="btn">登录</a></li>
    					<li>&nbsp;</li>
    					<li><a href="reg.jsp" role="button" class="btn">注册</a></li>
   					</c:otherwise>
				</c:choose>
			</ul>
			<h1>
				<a href="index.jsp">Smile</a>
			</h1>
		</div>
		<hr>
		<hr>
		<div class="survey">
			<form action="pubPaper" method="post">
				<%
					QuestionDao questionDao = new QuestionDaoImpl();

					String ss = "";
					Integer paperIdInt = (Integer) session.getAttribute("paperId");
					int paperId = paperIdInt.intValue();
					List<Question> questions = questionDao
							.findQuestionsByPaperId(paperId);
					int totalNum = questions.size();
					int i = 1;
				%>
				<input type="hidden" name="totalNum" value=<%=questions.size()%>>
				<div class="div_question">
					<%
					for (Question question : questions) {
						ss = "q" + i;
				%>

				
					<label><h5>题目：<%=question.getQstTitle()%></h5>
					</label>
					<%
							String content = question.getQstOption();
							if (content != null && (question.getQstType() == 1)) {
								String[] options = content.split("#");
								for (String option : options) {
					%>
					<label class="radio"> <input type="radio" name=<%=ss%>
						id=<%=ss%> value=<%=i %>> <%=option%> </label>

					<%
						}
							} else {
					%>
					<textarea rows="4" cols="50" name=<%=ss%>></textarea>
					<%
						}
							i++;
						}
					%>
					<br>
					<input class="btn btn-danger" type="submit" value="发布"> 
					<a href="addquestion1.jsp" class="btn btn-success">继续添加</a>
						</div>
			</form>
		</div>
		<div class="footer">
    		<span>201641404232、201641412126</span>
    		<span>梁闯荣、付乐祺</span>
    		<span>16软卓1班</span>
    	</div>
	</div>
</body>
</html>