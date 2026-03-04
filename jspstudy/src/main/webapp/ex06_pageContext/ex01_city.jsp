<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>city</title>
</head>
<body>
<%
	String city = request.getParameter("city");
	pageContext.forward("ex01_"+city+".jsp");
%>
</body>
</html>