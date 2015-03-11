<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javabean.User" %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="javabean.DBUtil" %>
    <%
      //用户是否登录的判断变量
      boolean userIsLogin = false;
      //判断用户是否登录
      User user = (User)session.getAttribute("user");
      //如果session中存在用户信息则表示用户已经登录
      if(user != null)
        userIsLogin = true;
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>社团详情 | 视界</title>
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
<!-- 加载提示信息模态框 -->
<%@include file="../global-page/modal.jsp" %>

<!-- navbar -->
<jsp:include page="../global-page/navbar.jsp">
	<jsp:param name="pagename" value="sjclub_list.jsp" />
</jsp:include>

<!-- header img -->
<div class="header-img">
	<img class="img-responsive" src="img/list.jpg">
</div>
<!-- /header img -->

<!-- content -->
<div class="container-fluid content">
	<!-- club detail -->
	<%
    	//获取list.jsp页面传递的社团id
    	String clubId = request.getParameter("clubId");
    	Connection conn = DBUtil.getConnection();
    	String sql = "select * from dbo.T_Club where Id = ?";
    	try{
    		PreparedStatement ps = conn.prepareStatement(sql);
    		ps.setString(1,clubId);
    		ResultSet rs = ps.executeQuery();
    		if(rs.next()){
    %>
	<div class="subfield">
		<%--从社团id中查询社团名 --%>
		<h4>社团详情<small><a onclick="self.location=document.referrer;">Club detail</a>&nbsp;>>&nbsp;<%=rs.getString("ClubName") %></small></h4>
		<hr />
	</div>
	
	<%--加入社团，如果没登录就要求登录，登录后添加则在ClubAndUsers表里添加关系--%>
	<!-- add club -->
	<div class="add-club">
	<%
		if(userIsLogin){
			//如果用户已经登录 
	%>
			<input type="text" id="userId" value=<%=user.getId() %> style="display:none"><input type="text" id="clubId" value=<%=rs.getString("Id") %> style="display:none">
			<button class="btn btn-danger btn-default" id="addClub"><span class="glyphicon glyphicon-plus"></span>&nbsp;加入社团</button>
		
	<%
		}else{
			//如果用户没有登录则弹出登录模态框
	%>
			<button type="button" data-toggle="modal" data-target="#loginModal" class="btn btn-danger btn-default"><span class="glyphicon glyphicon-plus"></span>&nbsp;加入社团</button>
	<%
		}
	%>
		<p>加入社团，参加此社团的活动，了解此社团的更多详情。最多能同时加入三个社团哦。</p>
	</div>
	
	<!-- active detail -->
	<div class="list_detail">
		<h3><%=rs.getString("ClubName") %></h3>
		<%=rs.getString("ClubIntroduction") %>
	</div>
	<%
		//查询结束
    	}
    	rs.close();
    	ps.close();
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally{
    		DBUtil.closeConnection(conn);
    	}
    %>
</div>
<!-- /.content -->

<!-- footer -->
<%@include file="../global-page/footer.jsp" %>

<script src="../global-js/jquery.min.js"></script>
<script src="../global-js/bootstrap.min.js"></script>
<!-- 数据验证 -->
<script src="../global-js/validate.js"></script>
<!-- 加入社团 -->
<script>
$(document).ready(function(){
	//加入社团按钮，当用户登录后可以加入社团
	//但是要判断是否已经是社团的成员了
	$("#addClub").click(function(){
		//获取userId和clubId的值
		var userId = $("#userId").val();
		var clubId = $("#clubId").val();
		$.get("../AddClub?userId="+userId+"&clubId="+clubId+"&"+new Date().getTime(),
			function(data){
				if(data == "userIsClub"){
					$("#messageModal-body").html("您已经是此社团的成员了，可以去加入其它社团哦。");
					$("#messageModal").modal('show');
				}else if(data == "refuse"){
					$("#messageModal-body").html("您已经加入了三个社团了，不能再加入社团了。");
					$("#messageModal").modal('show');
				}else if(data == "ok"){
					$("#messageModal-body").html("加入社团成功！<br>您可以查看此社团更多信息或参加此社团的活动。");
					$("#messageModal").modal('show');
				}
		})
		
	})
})
</script>
</body>
</html>