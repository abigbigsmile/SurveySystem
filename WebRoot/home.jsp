<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Smile-个人中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
	<link rel="stylesheet" href="css/home.css">
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>

  </head>
		<jsp:useBean id="pg" class="javaBean.Page" scope="page"/>  <!-- 创建Page对象 -->
		<c:if test="${papers != null && loginInfo != null }">
			<c:if test="${param.showPage!=null }">
				<jsp:setProperty name="pg" property="currentPage" value="${param.showPage }" />
			</c:if>
			<jsp:setProperty name="pg" property="beginIndex" value="${pg.currentPage==0?0:pg.currentPage*pg.pageSize}"/>
			<jsp:setProperty name="pg" property="count" value="${papers.size()}"/>			
			<c:choose>
				<c:when test="${pg.beginIndex+pg.pageSize>pg.count }">
					<jsp:setProperty name="pg" property="endIndex" value="${pg.count}"/>
				</c:when>
				<c:otherwise>
					<jsp:setProperty name="pg" property="endIndex" value="${pg.beginIndex+pg.pageSize-1}"/>
				</c:otherwise>			
			</c:choose>
		</c:if>
 
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
    		<div class="row-fluid">
    			<div class="span10">
    		<table class="table table-striped table-hover">
    			<thead>
    				<tr>
    					<th>问卷标题</th>
    					<th>发布日期</th>
    					<th>回答次数</th>
    					<th>查看结果</th>
    				</tr>
    			</thead>
    			<tbody>
  			<c:forEach items="${papers }" var="paper" begin="${pg.beginIndex }" end="${pg.endIndex}">
    				<tr>
	    				<td><a href="surveyPage?paperId=${paper.paperId }">${paper.paperTitle}</a></td>
	    				<td>${paper.paperStartDate }</td>
	    				<td>${paper.paperCount }</td>
	    				<td><a href="showresult.jsp?paperId=${paper.paperId }" class="btn btn-small">查看结果</a></td>
	    				<td><a href="deletePage?paperId=${paper.paperId }" class="btn btn-small btn-danger">删除</a></td>
	    			</tr>    			
    			</c:forEach>
  			
    			</tbody>
    		</table>
    			</div>
    			<div class="span2">
	    			<div class="right-button">
	    				<div class="row">
	    					<div class="span2"></div>
	    					<div class="span8 fabu"><a href="addpaper.jsp" class="btn btn-success">发布问卷</a></div>
	    					<div class="span2"></div>
	    				</div>
	    				
	    			</div>
    			</div>
    		</div>
    		<div class="row">
    			<div class="span10">
    				<ul class="pager">  			  
					  <c:choose>
					  	<c:when test="${pg.currentPage==0 }">
					  		<li class="disabled"><a href="#">前一页</a></li>
					  	</c:when>
					  	<c:otherwise>				  		
					  		<li><a href="home.jsp?showPage=${pg.currentPage-1 }">前一页</a></li>
					  	</c:otherwise>
					  </c:choose>
					  <li><a href="home.jsp?showPage=${pg.currentPage+1 }">后一页</a></li>
					  					  
					</ul>
		    	</div>
    		</div>
    	</div>
   </div>
 </body>
</html>
