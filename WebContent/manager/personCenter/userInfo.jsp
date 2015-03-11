<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--页面样式 --%>
<style>
.userInfo{
	margin-left:100px;
	border:none;
	color:#000;
}
.userInfo th{
	color:#666;
	width:100px;
}
</style>  
<%@ page import="javabean.User" %>
<%@ page import="javabean.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	User user = (User)session.getAttribute("user");
	//根据用户id来查询用户的所有信息
	Connection conn = DBUtil.getConnection();
	String sql = "select * from dbo.T_Users where Id = ?";
	try{
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1,user.getId());
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
%>
			<%--输出页面 --%>
			<h2 class="text-center">个人资料</h2>
			<h4>基本信息</h4>
			<table class="userInfo">
				<tr>
					<th>昵称：</th>
					<th><%=user.getName() %></th>
				</tr>
				<tr>
					<th>账号：</th>
					<th><%=user.getAccount() %></th>
				</tr>
				<tr>
					<th>身份：</th>
					<th><%=user.getType() %></th>
				</tr>
				<tr>
					<th>性别：</th>
					<th><%=rs.getBoolean("Sex")?"男":"女" %></th>
				</tr>
				<tr>
					<th>个人说明：</th>
					<th><%=(rs.getString("Introducation").isEmpty())?"请填写个人说明":rs.getString("Introducation") %></th>
				</tr>
			</table>
			<h4>学校信息</h4>
			<table class="userInfo">
				<tr>
					<th>姓名：</th>
					<th><%=rs.getString("TrueName") %></th>
				</tr>
				<tr>
					<th>学号：</th>
					<th><%=rs.getString("Number") %></th>
				</tr>
				<tr>
					<th>学院：</th>
					<th><%=rs.getString("Academy") %></th>
				</tr>
			</table>
<%
		}
		rs.close();
		ps.close();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBUtil.closeConnection(conn);
	}
%>