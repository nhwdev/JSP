<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>redirect</title>
</head>
<body>
<h1>
response 객체는 브라우저에 전달되는 객체<br>
내부에 출력 버퍼를 포함하고 있어, 브라우저에 전달되는 내용을 저장할 수 있음<br>
</h1>
<h3>response 객체는 브라우저에게 다른 페이지를 요청하도록 명령할 수 있음: redirect</h3>
<% response.sendRedirect("ex02_response.jsp"); %>
</body>
</html>