<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="javabean.User" %>
    <%
      //此页面必须是已登录状态，所以只有唯一的登录状态
      //获取用户session
      User user = (User)session.getAttribute("user");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>创建 | 统计工具 | 视界</title>
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
<link rel="stylesheet" href="count.css">
</head>
<body>
<!-- navbar -->
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <!-- logo and club name -->
      <a class="navbar-brand" href="../shijie/index.html"><img src="../global-img/logo.png" class="navbar-logo" alt="logo">视界网络新媒体社团</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <!-- 一级菜单，首页 -->
   		<%--获取相应的页面后使其变黑 --%>
        <li><a href="../sjclub/index.jsp">首页</a></li>
        <!-- 一级菜单，社团活动 -->
        <li><a href="../sjclub/active.jsp">社团活动</a></li>
        <!-- 一级菜单，社团列表 -->
        <li><a href="../sjclub/list.jsp">社团列表</a></li>
    	<!-- 一级菜单，实用工具 -->
        <li class="active"><a href="../sjclub/utility.jsp">实用工具</a></li>
        <!-- 一级菜单，关于我们 -->
        <li><a href="../sjclub/about.jsp">关于我们</a></li>
      </ul>

      <!-- 显示用户姓名或帐号 -->
      <ul class="nav navbar-nav navbar-right nav-login">
          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎&nbsp;,&nbsp;
      <%
          //如果用户姓名存在则显示姓名
          if(user.getName() != null){
      %>
            <%=user.getName() %>
      <%
            //用户姓名不存在则显示帐号
          }else if(user.getAccount()  != null){
      %>			
            <%=user.getId() %>
      <%
          }
      %>
          <span class="caret"></span></a>
           <ul class="dropdown-menu" role="menu">
           	<li><a href="../manager/manager.jsp">管理中心</a></li>
            <%--<li><a href=http://sjclub.org/Frame.aspx?uid=<%=user.getId() %>>个人中心</a></li> --%>
            <li><a href="../UserExit">退出登录</a></li>
          </ul>
          </li>
      </ul>

    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav><!-- /.navbar -->

<!-- content -->
<input type="text"><br>
<input type="button" value="添加行" name="add">
<!-- /.content -->

<!-- footer -->
<%@include file="../global-page/footer.jsp" %>

<script src="../global-js/jquery.min.js"></script>
<script src="../global-js/bootstrap.min.js"></script>
<!-- 添加行以及删除行 -->
<script>
$(document).ready(function(){
	var add = $("input[name='add']");
	//点击添加行按钮进行添加操作
	add.click(function(){
		$(this).before("<input type=\"text\"><br>");
	})
	
})
</script>
</body>
</html>