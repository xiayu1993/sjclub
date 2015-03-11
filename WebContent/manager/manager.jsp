<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javabean.User" %>
    <%
   		User user = (User)session.getAttribute("user");
    	//用户权限
    	int rank = user.getRank();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>管理中心 | 视界</title>
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
<link rel="stylesheet" href="manager.css">
<link rel="stylesheet" href="timeTo.css">
</head>
<body>
<!-- manager page -->
<div class="manager-page">
	<!-- manager nav -->
	<div id="manager-nav">
		<div class="row">
			<div class="col-md-4">
				<h3>欢迎，<%=user.getName() %></h3>
			</div>
			<div class="col-md-4">
				<ul class="manager-nav-ul">
					<li><a href="../sjclub/index.jsp">首页</a></li>
					<li><a href="../sjclub/active.jsp">社团活动</a></li>
					<li><a href="../sjclub/list.jsp">社团列表</a></li>
					<li><a href="../sjclub/utility.jsp">实用工具</a></li>
					<li><a href="../sjclub/about.jsp">关于我们</a></li>
				</ul>
			</div>
			<div class="col-md-4">
				<div class="time">
					<script>
						var myDate = new Date();
						var Week = ['日','一','二','三','四','五','六'];
						document.write("现在是"+myDate.getFullYear()+"年"+(myDate.getMonth() + 1)+"月"+myDate.getDate()+"日"+"星期"+Week[myDate.getDay()]); 
					</script>
				</div>
				<div id="clock"></div>
			</div>
		</div>
	</div><!-- ./manager nav -->
	
	<!-- manager main -->
	<div>
		<!-- manager left -->
		<div class="manager-left">
			<div class="manager-title">
				管理中心
				<span class="glyphicon glyphicon-chevron-up manager-nav-control hidden-xs" id="manager-nav-up"></span>
				<span class="glyphicon glyphicon-chevron-down manager-nav-control hidden-xs" id="manager-nav-down"></span>
			</div>
			<ul class="menu">
				<li>
					<span data-toggle="collapse" data-target="#person-center" aria-expanded="true" aria-controls="person-center">个人中心</span>
					<ul id="person-center" class="collapse">
						<li id="userInfo">个人资料</li>
						<li id="modifyPassword">修改密码</li>
					</ul>
				</li>
				<li>
					<span data-toggle="collapse" data-target="#message-center" aria-expanded="false" aria-controls="message-center">消息中心</span>
					<ul id="message-center" class="collapse">
						<li>发件箱</li>
						<li>收件箱</li>
					</ul>
				</li>
				<li>
					<span data-toggle="collapse" data-target="#club-center" aria-expanded="false" aria-controls="club-center">社团中心</span>
					<ul id="club-center" class="collapse">
						<li>社团资料</li>
						<li>社团活动</li>
						<%
							//如果用户权限大于等于2（社团副管理员），才显示
							if(rank >=2 ){
						%>
						<li>社团成员</li>
						<%
							}
							//社团管理员
							if(rank >=3 ){
						%>
						<li>权限分配</li>
						<%
							}
						%>
					</ul>
				</li>
				<%
					//如果用户权限大于等于4（超级管理员）
					if(rank >= 4){
				%>
				<li>
					<span data-toggle="collapse" data-target="#web-manager" aria-expanded="false" aria-controls="web-manager">网站管理</span>
					<ul id="web-manager" class="collapse">
						<li>用户资料</li>
						<li>权限分配</li>
					</ul>
				</li>
				<li>
					<span data-toggle="collapse" data-target="#statistical-analysis" aria-expanded="false" aria-controls="statistical-analysis">统计分析</span>
					<ul id="statistical-analysis" class="collapse">
						<li>aaa</li>
						<li>bbb</li>
					</ul>
				</li>
				<%
					}
				%>
			</ul>
		</div><!-- ./manager left -->
		
		<!-- manager right -->
		<div class="manager-right">
			<!-- manager right nav -->
			<div class="manager-right-nav">
				
			</div><!-- ./manager right nav -->
			<!-- 使用ajax加载信息页面 -->
			<div class="manager-content">
				
			</div>
			<!-- copyright -->
			<div class="manager-copyright">&copy;&nbsp;2014-2015&nbsp;视界网络新媒体社团</div>
		</div><!-- ./manager right -->
	</div><!-- ./manager main -->
</div><!-- ./manager page -->

<script src="../global-js/jquery.min.js"></script>
<script src="../global-js/bootstrap.min.js"></script>
<script src="jquery.timeTo.min.js"></script>
<script>
$(document).ready(function(){
	//点击菜单栏的向下图标后出现导航栏
	$("#manager-nav-down").click(function(){
		$("#manager-nav-down").hide();
		$("#manager-nav-up").show().css("color","#fff");
		$("#manager-nav").slideDown();
		$(".manager-right").animate({top:'200px'})
		$(".manager-left").animate({top:'200px'})
	})
	//点击菜单栏的向上图标后隐藏导航栏
	$("#manager-nav-up").click(function(){
		$("#manager-nav-up").hide();
		$("#manager-nav-down").show();
		$("#manager-nav").slideUp();
		$(".manager-right").animate({top:'0'})
		$(".manager-left").animate({top:'0'})
	})
	
	//导航栏上的时间
	$('#clock').timeTo({
		fontSize: 36,
		theme: "black",
		displayCaptions: true,
		fontFamily: 'pan'
		});
	
	//ajax加载页面
	$("#userInfo").click(function(){
		$(".manager-content").load("personCenter/userInfo.jsp");
	})
	$("#modifyPassword").click(function(){
		$(".manager-content").load("personCenter/modifyPassword.jsp");
	})
})
</script>
</body>
</html>