<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="javabean.DBUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>活动详情 | 视界</title>
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
	<jsp:param name="pagename" value="sjclub_active.jsp" />
</jsp:include>

<!-- header img -->
<div class="header-img">
	<img class="img-responsive" src="img/active.jpg">
</div>
<!-- /.header img -->

<!-- content -->
<div class="container-fluid content">
	<div class="row">
		<!-- content left -->
		<div class="col-md-9 col-sm-12 col-xs-12">
		<%
    		//获取active.jsp页面传递的活动id和所属的社团id
		    String activeId =request.getParameter("activeId");
		    String clubId = request.getParameter("clubId");
		    Connection conn = DBUtil.getConnection();
		    String sql = "select * from dbo.T_ClubActive where Id = ?";
		    try{
		    	PreparedStatement ps = conn.prepareStatement(sql);
		    	ps.setString(1,activeId);
		    	ResultSet rs = ps.executeQuery();
		    	if(rs.next()){
		    %>
			<!-- club activities -->
			<div class="subfield">
				<%--从活动id中查询活动名 --%>
				<h4>社团活动<small><a onclick="self.location=document.referrer;">Club Activities</a>&nbsp;>>&nbsp;<%=rs.getString("ActiveHead") %></small></h4>
				<hr />
			</div>
			
			<!-- active detail -->
			<div class="active_content">
				<h3><%=rs.getString("ActiveHead") %></h3>
				<%=rs.getString("ActiveContent") %>
			</div>
		</div>
		<!-- /.content left -->
		<%
			//结束第一次查询，活动内容区查询完毕
    		}
    		rs.close();
    		ps.close();
    	%>
    	
		<!-- content right -->
		<div class="col-md-3 col-sm-12 col-xs-12">
			<!-- other active -->
			<div class="subfield">
				<h4>其他活动<small>Others Active</small></h4>
				<hr />
			</div>
			<%--查询此社团其他的活动 --%>
			<%
				sql = "select * from dbo.T_ClubActive where ClubId = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1,clubId);
				rs = ps.executeQuery();
				while(rs.next()){
					//排除已经显示的活动
					if(!rs.getString("Id").equals(activeId)){
			%>
					<p><a href=active_detail.jsp?activeId=<%=rs.getString("Id") %>&clubId=<%=clubId %>><%=rs.getString("ActiveHead") %></a></p>
			<%	
					}
				}
			%>
		</div>
		<% 
			//结束所有查询
	    	}catch(Exception e){
	    		e.printStackTrace();
	    	}finally{
	    		DBUtil.closeConnection(conn);
	    	}
    	%>
	</div>
</div>
<!-- /.content -->

<!-- footer -->
<%@include file="../global-page/footer.jsp" %>

<script src="../global-js/jquery.min.js"></script>
<script src="../global-js/bootstrap.min.js"></script>
<!-- 数据验证 -->
<script src="../global-js/validate.js"></script>
</body>
</html>