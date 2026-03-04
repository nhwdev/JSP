<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- errorPage="ex04_errorPage.jsp": 현재페이지에서 오류가 있으면 ex04_errorPage.jsp 페이지 호출 --%>
<%@ page errorPage="ex04_errorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 발생 페이지</title>
</head>
<body>
	<% int num = Integer.parseInt("abc"); %>
</body>
</html>