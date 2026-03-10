<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core 태그 : forEach 태그</title>
</head>
<body>
	<h2>반복 관련 태그: forEach</h2>
	<h4>1에서 10까지의 숫자 출력하기</h4>
	<c:forEach var="i" begin="1" end="10">
		${ i }&emsp;
	</c:forEach>

	<h4>1에서 10까지의 홀수만 출력하기(1)</h4>
	<c:forEach var="i" begin="1" end="10" step="2">
		${ i }&emsp;
	</c:forEach>

	<h4>1에서 10까지의 홀수만 출력하기(2)</h4>
	<c:forEach var="i" begin="1" end="10" step="2">
		<c:if test="${ i % 2 == 1 }">
			${ i }&emsp;	
		</c:if>
	</c:forEach>

	<h4>1에서 10까지의 짝수만 출력하기(1)</h4>
	<c:forEach var="i" begin="2" end="10" step="2">
		${ i }&emsp;	
	</c:forEach>

	<h4>1에서 10까지의 짝수만 출력하기(2)</h4>
	<c:forEach var="i" begin="1" end="10">
		<c:if test="${ i % 2 == 0 }">
			${ i }&emsp;
		</c:if>
	</c:forEach>

	<h4>1에서 10까지의 합을 출력하기</h4>
	<c:forEach var="i" begin="1" end="10">
		<c:set var="sum" value="${ sum + i }" />
	</c:forEach>
	1에서 10까지의 합: ${ sum }
	<br>

	<c:set var="sum" value="0" />
	<h4>1에서 10까지의 짝수의 합을 출력하기</h4>
	<c:forEach var="i" begin="2" end="10" step="2">
		<c:set var="sum" value="${ sum + i }" />
	</c:forEach>
	1에서 10까지의 합: ${ sum }
	<br>
	<hr>
	<%-- step 값은 양수여야함 
	<h4>10에서 1까지의 숫자 출력하기</h4>
	<c:forEach var="i" begin="10" end="1" step="-1">
		${ i }&emsp;
	</c:forEach> --%>
	
	<h4>10에서 1까지의 숫자 출력하기</h4>
	<c:set var="ii" value="10" />
	<c:forEach begin="1" end="10">
		${ ii }&emsp;
		<c:set var="ii" value="${ ii - 1 }"/>
	</c:forEach>
	<hr>
	
	<h4>forEach 태그를 이용하여 구구단 출력하기</h4>
	<c:forEach var="i" begin="2" end="9">
		${ i }단&emsp;
		<c:forEach var="j" begin="2" end="9">
			${ i } x ${ j } = ${ i * j }&emsp; 
		</c:forEach>
		<br>
	</c:forEach>
</body>
</html>