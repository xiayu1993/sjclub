<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.ResultSet" %>
	<jsp:useBean id="listPage" scope="page" class="javabean.Page" />
    <%! 
    	//数据分页
    	int CountPage = 0;
    	int CurrPage = 1;
    	int PageSize = 24;
    	int CountRow = 0;
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>社团列表 | 视界</title>
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
	<jsp:param name="pagename" value="sjclub_list.jsp" />
</jsp:include>

<!-- header img -->
<div class="header-img">
	<img class="img-responsive" src="img/list.jpg">

</div>
<!-- /header img -->

<!-- content -->
<div class="container-fluid content">
	<!-- club list -->
	<div class="subfield">
		<h4>社团列表<small>Club List</small></h4>
		<hr />
	</div>
	<div class="row">
	<%-- 数据分页 --%>
<%
	//获取当前页面值
	String strPage = request.getParameter("page");
	//如果当前页面为空着赋值为1，不为空则获取改值
	if(strPage == null){
		CurrPage = 1;
	}else{
		CurrPage = Integer.parseInt(strPage);
	}
	//定义查询语句
	String sql = "select * from dbo.T_Club";
	//执行查询结果
	ResultSet rs = listPage.selectSql(sql);
	//获取查询结果集中的记录数
	rs.last();
	CountRow = rs.getRow();
	//计算总的页数
	CountPage = (CountRow-1)/PageSize+1;
	//获取第一条记录
	rs.first();
	int i = 0;
	if(CountRow > 0){
		//指定跳转的页码
		rs.absolute(CurrPage * PageSize - PageSize + 1);
		while(i < PageSize && !rs.isAfterLast()){
%>
			<div class="col-md-2 col-sm-4 col-xs-6">
				<div class="show-club">
					<img src=http://sjclub.org/<%=rs.getString("ClubRoute") %>/ClubLogo/<%=rs.getString("ClubLogo") %>>
					<a href=list_detail.jsp?clubId=<%=rs.getString("Id") %>><%=rs.getString("ClubName") %></a>
				</div>
			</div>
<%
			rs.next();
			i++;
		}
		listPage.closeAll();
	}
%>
	</div>
	
	<!-- paging -->
	<nav class="paging text-center">
	<ul class="pagination pagination-lg">
<%
		//上一页
		if(CurrPage > 1){
%>
			<li><a href="list.jsp?page=<%=CurrPage-1 %>">&laquo;</a></li>
<%
		}
%><%
		//页码
		for(int n=1; n<=CountPage; n++ ){
%>
			<li<%if(n==CurrPage){ %> class="active"<%} %>><a href="list.jsp?page=<%=n %>"><%=n %></a></li>
			
<%
		}
%><%
		//下一页
		if(CurrPage < CountPage){
%>
			<li><a href="list.jsp?page=<%=CurrPage+1 %>">&raquo;</a></li>
<%
		}
%>
	</ul>
	</nav>
	<!-- /paging -->
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