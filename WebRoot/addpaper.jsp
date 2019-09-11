<%@page import="dao.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addsurvey.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
	<link rel="stylesheet" href="css/addPaper.css">
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>

  </head>
  
  <body>
    <div class="container1">
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
    		<h1><a href="index.jsp">Smile</a></h1>
    	</div>
    	<hr>
    	<div class="maincontent">
    		<form action="addPaper" method="post" class="form-horizontal" enctype=multipart/form-data>
    			
				    <h3>发布问卷</h3>
				    <div class="control-group">
					    <label class="control-label" for="inputTitle">问卷标题</label>
					    <div class="controls">
					      <input type="text" id="inputTitle" placeholder="输入问卷标题" name="paperTitle">
					    </div>
				    </div>
				    <div class="control-group">
					    <label class="control-label" for="inputType" >问卷类别</label>
					    <div class="controls">
					      <select name="paperType">
					      	<option value="1">美食</option>
					      	<option value="2">科技</option>
					      	<option value="3">IT</option>
					      	<option value="4">医疗</option>
					      	<option value="5">手机</option>
					      	<option value="6">体育</option>
					      	<option value="7">电影</option>
					      	<option value="8">动漫</option>
					      </select>
					    </div>
				    </div>
				    <div class="control-group">
					    <label class="control-label" for="inputPaperSummary">问卷摘要介绍</label>
					    <div class="controls">
					      <textarea rows="3" cols="50" placeholder="输入问卷摘要" id="inputPaperSummary" name="paperSummary"></textarea>
					    </div>
				    </div>
				    <div class="control-group">
					    <h5>选择背景图片:</h5>
					    <input type="file" name="paperBg" />						
					</div>
					<br>
					<div class="control-group">
						<input type="reset" value="重置" class="btn btn-success" >
						<input type="submit" class="btn btn-success" value="下一步">
					</div>				    
    		</form>
    	</div>
</div>

  </body>
</html>
