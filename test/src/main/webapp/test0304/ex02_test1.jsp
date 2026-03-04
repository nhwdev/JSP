<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02_test1</title>
</head>
<body>
	<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초 ");
	Date today = new Date();
	String date = sdf.format(today);
	session.setAttribute("date", date);
	%>
	<h3>현재 날짜를 session 객체에 등록하기</h3>
	등록된날짜 :
	<%=date%><br>
	<a href="ex02_test2.jsp">등록날짜 조회하기</a>

</body>
</html>