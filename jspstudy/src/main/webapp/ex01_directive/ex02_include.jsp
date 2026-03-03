<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include</title>
</head>
<body>
	<%
	String msg = "ex02_include.jsp 페이지의 msg 변수";
	%>
	<h1>ex02_include.jsp 입니다.</h1>
	<%@ include file="ex02_include2.jsp"%>
	<hr>
	<p>
		ex02_include.jsp 페이지에 ex02_include2.jsp 페이지가 포함되어 출력됩니다.<br>
		2개의 페이지는 같은 서블릿으로 변경되므로 변수의 공유가 가능합니다.
	</p>
</body>
</html>