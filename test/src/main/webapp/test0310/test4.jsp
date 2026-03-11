<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test4</title>
</head>
<body>
	이름:${param.name}<br>
	나이:${param.age}<br>
	성별:${param.gender==1?"남":"여"}<br>
	출생연도:${param.year}<br>
	나이:${2026-param.year}<br>
</body>
</html>