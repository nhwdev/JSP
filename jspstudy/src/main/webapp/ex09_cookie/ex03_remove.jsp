<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>remove</title>
</head>
<body>
	<%
	Cookie cookie = new Cookie("name",""); // 쿠키 생성
	cookie.setMaxAge(0); // 유효기간 만료
	response.addCookie(cookie);
	%>
	<h2>쿠키가 삭제 되었습니다.</h2>
	<a href="ex02_read.jsp">쿠키 조회하기</a>
</body>
</html>