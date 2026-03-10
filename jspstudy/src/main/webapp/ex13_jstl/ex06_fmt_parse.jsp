<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 형식화 태그 : parse 태그</title>
</head>
<body>
	<%--
		format() : 객체 → 형식화된 문자열 변경
			<fmt:formatNumber ...> : 숫자 → 형식화된 문자열 변경 
			<fmt:formatDate ...> : Date 객체 → 형식화된 문자열로 변경
		parse() : 형식화 된 문자열 → 원래의 객체
			<fmt:parseNumber ...> : 형식화된 문자열 → 숫자
			<fmt:parseDate ...> : Date 객체 → 형식화된 문자열로 변경ㅇ
	--%>
	<h3>Format 된 숫자를 기본 숫자로 변경</h3>
	<h4>var 속성이 있는 경우 : 화면에 출력 ❌</h4>
	<fmt:parseNumber value="20,000" var="num1" pattern="##,###"/>
	<fmt:parseNumber value="10,000" var="num2" pattern="##,###"/>
	합: ${num1} + ${num2} = ${num1 + num2}<br>
	<h4>var 속성이 없는 경우 : 화면에 출력 ⭕</h4>
	<fmt:parseNumber value="20,000" pattern="##,###"/><br>
	<fmt:parseNumber value="10,000" pattern="##,###"/><br>
	<p>num1, num2 변수를 이용하여 20,000 + 10,000 = 30,000</p>
	<fmt:formatNumber value="${num1}" pattern="##,###"/> +
	<fmt:formatNumber value="${num2}" pattern="##,###"/> =
	<fmt:formatNumber value="${num1 + num2}" pattern="##,###"/> <br>
	<hr>
	<fmt:formatNumber value="${num1}" pattern="##,###" var="snum1"/>
	<fmt:formatNumber value="${num2}" pattern="##,###" var="snum2"/>
	<fmt:formatNumber value="${num1 + num2}" pattern="##,###" var="snum3"/>
	${snum1} + ${snum2} = ${snum3} <br>
</body>
</html>