<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include</title>
</head>
<body>
	<h3>ex03_include.jsp 에서 출력되는 내용 입니다</h3>
	<hr>
	<%
	String msg = "ex03_include1.jsp 페이지의 msg 변수";

	pageContext.setAttribute("msg", msg);
	request.setAttribute("msg", msg);
	pageContext.include("ex03_include2.jsp");
	%>
	<hr>
</body>
</html>