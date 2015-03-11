<%--页面的导航条部分 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javabean.User" %>
    <%
      //用户是否登录的判断变量
      boolean userIsLogin = false;
      //判断用户是否登录
      User user = (User)session.getAttribute("user");
      //如果session中存在用户信息则表示用户已经登录
      if(user != null)
        userIsLogin = true;
    %>
    <%
    	//获取当前页面的名字
    	String pageName = request.getParameter("pagename");
    %>
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
        <li<%if(pageName.equals("sjclub_index.jsp")){ //class前要空一格%> class="active"<%} %>><a href="index.jsp">首页</a></li>
        <!-- 一级菜单，社团活动 -->
        <li<%if(pageName.equals("sjclub_active.jsp")){ %> class="active"<%} %>><a href="active.jsp">社团活动</a></li>
        <!-- 一级菜单，社团列表 -->
        <li<%if(pageName.equals("sjclub_list.jsp")){ %> class="active"<%} %>><a href="list.jsp">社团列表</a></li>
    	<!-- 一级菜单，实用工具 -->
        <li<%if(pageName.equals("sjclub_utility.jsp")){ %> class="active"<%} %>><a href="utility.jsp">实用工具</a></li>
        <!-- 一级菜单，关于我们 -->
        <li<%if(pageName.equals("sjclub_about.jsp")){ %> class="active"<%} %>><a href="about.jsp">关于我们</a></li>
      </ul>

      <!-- 登录选项，如果未登录则显示登录，已登录则显示用户姓名或帐号 -->
      <ul class="nav navbar-nav navbar-right nav-login">
      <%
        //如果用户已登录
        if(userIsLogin){
      %>
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
      <%
        //如果用户未登录
        }else{
      %>
          <li><a data-toggle="modal" data-target="#loginModal">登录</a></li>
          <li><a data-toggle="modal" data-target="#registerModal">注册</a></li>
      <%
        }
      %>
      </ul>

    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav><!-- /.navbar -->