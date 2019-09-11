<%@ page language="java" import="java.util.*,dao.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>Smile-在线问卷调查</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="">
	<meta http-equiv="description" content="">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
	<link rel="stylesheet" href="css/home.css">
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<style type="text/css">

	</style>
</head>
<body>
    <div class="container-narrow">
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
    	<div class="jumbotron">
			<form action="surveyPage" method="post">
				<div class="input-append">
					<input class="span6" id="paperId" type="text" placeholder="请输入问卷编号..." name="paperId">
					<button class="btn btn-large" type="submit">Go!</button>
				</div>
			</form>
    	</div>
    	<hr>
    	<div class="row-fluid marketing">
    		<div class="span6">
    			<h4>热门问卷1</h4>
    			<p>“大煮干丝”是哪个菜系的代表菜之一( )?</p>
    			<h4>A</h4>
    			<p>四川菜系(一份高考前的NBA试题:检验真球迷的时候到了)</p>
    			<h4>B</h4>
    			<p>山东菜系(一份高考前的NBA试题:检验真球迷的时候到了)</p>
    			<h4>C</h4>
    			<p>广东菜系(一份高考前的NBA试题:检验真球迷的时候到了)</p>
    			<h4>D</h4>
    			<p>淮扬菜系(一份高考前的NBA试题:检验真球迷的时候到了)</p>
    		</div>
    		<div class="span6">
    			<h4>热门问卷2</h4>
    			<p>勒布朗詹姆斯的球衣号码是几号?</p>
    			<h4>A</h4>
    			<p>23(一份高考前的NBA试题:检验真球迷的时候到了)</p>
    			<h4>B</h4>
    			<p>23(一份高考前的NBA试题:检验真球迷的时候到了)</p>
    			<h4>C</h4>
    			<p>23(一份高考前的NBA试题:检验真球迷的时候到了)</p>
    			<h4>D</h4>
    			<p>不知道(一份高考前的NBA试题:检验真球迷的时候到了)</p>
    		</div>
    	</div>
    	<hr>
    	<div class="footer">
    		<span>2016*****232</span>
    		<span>smile</span>
    		<span>软工1班</span>
    	</div>
    </div>
</body>
</html>
