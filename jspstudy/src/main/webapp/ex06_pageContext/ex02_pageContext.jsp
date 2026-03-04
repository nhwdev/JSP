<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContext</title>
</head>
<body>
	<h2>pageContext 객체 : page 영역을 담당하는 객체. 현재 페이지의 자원을 관리한다.</h2>
	<%
	if (request == pageContext.getRequest()) { %>
	request 객체와 pageContext.getrequest()의 리턴 객체는 같은 객체임<br>
	<% } %>
	<%
	if (request == pageContext.getResponse()) { %>
	request 객체와 pageContext.getrequest()의 리턴 객체는 같은 객체임<br>
	<% } %>
	<%
	if (request == pageContext.getSession()) { %>
	request 객체와 pageContext.getrequest()의 리턴 객체는 같은 객체임
	<br>
	<% } %>
	<%
	if(application == pageContext.getServletContext()){ %>
		application 객체와 pageContext.getServletContext()의 리턴 객체는 같은 객체임<br>
	<% } %>
	<%
	if(out == pageContext.getOut()){ %>
		out 객체와 pageContext.getOut()의 리턴 객체는 같은 객체임<br>
	<% } %>
</body>
</html>