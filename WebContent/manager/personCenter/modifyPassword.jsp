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
	color:#999;
	width:100px;
}
</style>  
<%@ page import="javabean.User" %>
<%@ page import="javabean.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
modifyPassword.jsp