<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>关于我们 | 视界</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 使浏览器默认启用极速模式，但并不是所有浏览器都能正确执行 -->
<meta name="renderer" content="webkit">
<!-- 使IE浏览器启用最新的版本 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 使页面宽度与视口宽度相同，并且禁止用户缩放页面 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- 页面关键字 -->
<meta name="keywords" content="">
<!-- 页面描述 -->
<meta name="description" content="">
<!-- IE8下调用以使用HTML5和媒体查询 -->
<%@include file="../global-page/IE8.jsp" %>
<link rel="shortcut icon" href="../global-img/icon.ico">
<link rel="stylesheet" href="../global-css/bootstrap.min.css">
<link rel="stylesheet" href="../global-css/global.css">
<link rel="stylesheet" href="sjclub.css">
</head>
<body>
<!-- 加载登录|注册模态框 -->
<%@include file="../global-page/login.jsp" %>
<%@include file="../global-page/register.jsp" %>

<jsp:include page="../global-page/navbar.jsp">
	<jsp:param name="pagename" value="sjclub_about.jsp" />
</jsp:include>

<!-- header img -->
<div class="header-img">
	<img class="img-responsive" src="img/about.jpg">
</div>
<!-- /header img -->

<!-- content -->
<div class="container-fluid content">
	<div class="introducation " style="word-spacing:15px">
		<p>江汉大学<span class="strong-1">社团平台</span>是由<span class="strong-2">视界网络新媒体社团</span>设计并推出的</p>
		<p>旨在汇集江大各社团的<span class="strong-1">最新资讯</span></p>
		<p>让广大师生能够<span class="strong-1">第一时间</span>了解社团最新动态</p>
		<p>选择自己<span class="strong-3">喜欢</span>的社团活动</p>
		<p><span class="strong-1">提高</span>大家活动参与积极度</p>
		<p>最终做到<span class="strong-1">推动</span>江大社团积极<span class="strong-3">健康发展</span>的目的</p>
		<p>我们<span class="strong-1">由衷欢迎</span>广大师生给我们留言提出<span class="strong-1">宝贵意见</span></p>
		<p>让我们能够<span class="strong-1">进步</span></p>
		<p>也希望有更多江大学子能够参与到<span class="strong-1">社团活动</span>中来</p>
	</div>
</div>
<!-- /content -->

<!-- footer -->
<%@include file="../global-page/footer.jsp" %>

<script src="../global-js/jquery.min.js"></script>
<script src="../global-js/bootstrap.min.js"></script>
<!-- 数据验证 -->
<script src="../global-js/validate.js"></script>
</body>
</html>