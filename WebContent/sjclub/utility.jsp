<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>实用工具 | 视界</title>
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

<!-- navbar -->
<jsp:include page="../global-page/navbar.jsp">
	<jsp:param name="pagename" value="sjclub_utility.jsp" />
</jsp:include>

<!-- header img -->
<div class="header-img">
	<img class="img-responsive" src="img/utility.jpg">
</div>
<!-- /header img -->

<!-- content -->
<div class="container-fluid content">
	<!-- utility list -->
	<div class="utility-content">
		<h2>小工具解决大烦恼</h2>
		<ul class="utility-ul">
			<li>
				<ul>
					<li class="utility-ul-li1"><a href="../count/count.jsp">统</a></li>
					<li>
						<h4>统计工具</h4>
						<p>使用在线统计的方式，它自动帮您汇总数据</p>
					</li>
				</ul>
			</li>
			<li>
				<ul>
					<li class="utility-ul-li2"><a href="#">问</a></li>
					<li>
						<h4>问卷工具</h4>
						<p>不用再派发纸质问卷啦！您只用发布URL地址即可</p>
					</li>
				</ul>
			</li>
			<li>
				<ul>
					<li class="utility-ul-li3"><a href="#">投</a></li>
					<li>
						<h4>投票工具</h4>
						<p>想要创建投票活动？相信它能助您一臂之力</p>
					</li>
				</ul>
			</li>
			<li>
				<ul>
					<li class="utility-ul-li4"><a href="#">评</a></li>
					<li>
						<h4>评分工具</h4>
						<p>评分还要用笔来算？让它来给您计算吧</p>
					</li>
				</ul>
			</li>
		</ul>
	</div>
	<!-- /.utility list -->
</div>
<!-- ./content -->

<!-- footer -->
<%@include file="../global-page/footer.jsp" %>

<script src="../global-js/jquery.min.js"></script>
<script src="../global-js/bootstrap.min.js"></script>
<!-- 数据验证 -->
<script src="../global-js/validate.js"></script>
</body>
</html>