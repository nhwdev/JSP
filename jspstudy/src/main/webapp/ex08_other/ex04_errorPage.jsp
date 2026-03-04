<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 현재 페이지가 오류페이지 명시. exception 객체 제공 --%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>errorPage</title>
</head>
<body>
	<h1>입력값을 확인하세요: 숫자만 가능합니다.</h1>
	<p><%=exception.getMessage()%></p>
	<hr>
	<p>
		<%
		exception.printStackTrace(response.getWriter());
		%>
	</p>
</body>
</html>