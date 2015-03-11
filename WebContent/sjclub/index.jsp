<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javabean.DBUtil" %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.Statement" %>
    <%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>视界网络新媒体社团</title>
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
	<jsp:param name="pagename" value="sjclub_index.jsp" />
</jsp:include>

<!-- slider -->
<!-- img show on here -->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="img/index-1.jpg" alt="index-1">
    </div>
    <div class="item">
      <img src="img/index-2.jpg" alt="index-2">
    </div>
    <div class="item">
      <img src="img/index-3.jpg" alt="index-3">
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<!-- /.slider -->

<!-- content -->
<div class="container-fluid content">
	<div class="row">
		<!-- content left -->
		<div class="col-md-9 col-xs-12">
			<!-- news -->
			<div class="subfield">
				<h4>最新资讯<small>News</small></h4>
				<hr />
			</div>
			<div class="row">
			<!-- news left -->
				<div class="col-md-6 col-xs-12">
					<div class="row news">
						<div class="col-md-6 col-sm-6">
							<p>江汉大学社团平台正式推出了</p>
						</div>
						<div class="col-md-6 col-sm-6">
							<p>视界网络新媒体社团<small>2014-09-16</small></p>
						</div>
					</div>
					<div class="row news">
						<div class="col-md-6 col-sm-6">
							<p>江汉大学社团平台正式推出了</p>
						</div>
						<div class="col-md-6 col-sm-6">
							<p>视界网络新媒体社团<small>2014-09-16</small></p>
						</div>
					</div>
					<div class="row news">
						<div class="col-md-6 col-sm-6">
							<p>江汉大学社团平台正式推出了</p>
						</div>
						<div class="col-md-6 col-sm-6">
							<p>视界网络新媒体社团<small>2014-09-16</small></p>
						</div>
					</div>
				</div>
				<!-- ./news left -->
				
				<!-- news right -->
				<div class="col-md-6 col-xs-12 news-right">
					<div class="row news">
						<div class="col-md-6 col-sm-6">
							<p>江汉大学社团平台正式推出了</p>
						</div>
						<div class="col-md-6 col-sm-6">
							<p>视界网络新媒体社团<small>2014-09-16</small></p>
						</div>
					</div>
					<div class="row news">
						<div class="col-md-6 col-sm-6">
							<p>江汉大学社团平台正式推出了</p>
						</div>
						<div class="col-md-6 col-sm-6">
							<p>视界网络新媒体社团<small>2014-09-16</small></p>
						</div>
					</div>
					<div class="row news">
						<div class="col-md-6 col-sm-6">
							<p>江汉大学社团平台正式推出了</p>
						</div>
						<div class="col-md-6 col-sm-6">
							<p>视界网络新媒体社团<small>2014-09-16</small></p>
						</div>
					</div>
				</div>
				<!-- ./news right -->
			</div>
			<!-- ./news -->
			
			<!-- top ten outstanding associations -->
			<div class="subfield">
				<h4>校十佳社团<small>Top Ten Outstanding Associations</small></h4>
				<hr />
			</div>
			<%--从数据库中获取十佳社团的logo和社团名 --%>
			<div class="row">
			<%
				Connection conn = DBUtil.getConnection();
		  		String sql = "select * from dbo.T_Club where IsTopTen = 1";
		  		try{
		  			Statement stmt = conn.createStatement();
		  			ResultSet rs = stmt.executeQuery(sql);
		  			while(rs.next()){
		  	%>
		  				<div class="col-md-3 col-sm-4 col-xs-6">
		  					<div class="show-club">
		  						<img src=http://sjclub.org/<%=rs.getString("ClubRoute") %>/ClubLogo/<%=rs.getString("ClubLogo") %>>
		  						<a href=list_detail.jsp?clubId=<%=rs.getString("Id") %>><%=rs.getString("ClubName") %></a>
		  					</div>
		  				</div>
		  	<%
		  			}
		  			rs.close();
		  			stmt.close();
		  		}catch(Exception e){
		  			e.printStackTrace();
		  		}finally{
		  			DBUtil.closeConnection(conn);
		  		}
			%>
			</div>
			<!-- ./top ten outstanding associations -->
			
			<!-- special recommendation -->
			<div class="subfield">
				<h4>特别推荐<small>Special Recommendation</small></h4>
				<hr />
			</div>
			<div>
				aaa
			</div>
			<!-- ./special recommendation -->
		</div>
		<!-- ./content left -->
		
		<!-- content right -->
		<div class="col-md-3 col-xs-12">
			<!-- popularity -->
			<div class="subfield">
				<h4>校园人气榜<small>Popularity</small></h4>
				<hr />
			</div>
			<div>
				bbb
			</div>
			<!-- ./popularity -->
			
			<!-- links -->
			<div class="subfield">
				<h4>友情链接<small>Links</small></h4>
				<hr />
			</div>
			<div>
				<p><a href="http://210.42.72.73:888/jwweb/">江汉大学教务网络管理系统</a></p>
				<p><a href="http://210.42.72.169">江汉大学俱乐部管理系统</a></p>
				<p><a href="http://jhun.tsk.erya100.com/studentLogin">江汉大学尔雅通识课</a></p>
			</div>
			<!-- ./links -->
		</div>
		<!-- ./content right -->
	</div>
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