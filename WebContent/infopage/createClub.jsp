<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="../createClub" method="post">
社团邮箱：<input type="text" name="account" />
社团名：<input type="text" name="name" />
是否为十佳：
<input type="radio" name="IsTopTen" value="true">true
<input type="radio" name="IsTopTen" value="false" checked>false
<input type="submit" value="submit"> 
</form>
</body>
</html>