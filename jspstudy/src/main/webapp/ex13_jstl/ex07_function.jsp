<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL function</title>
</head>
<body>
	<c:set var="str1" value="Functions <태그>를 사용합니다."		/>
	<c:set var="str1" value="사용"/>
	<c:set var="tokens" value="1, 2, 3, 4, 5, 6, 7, 8, 9, 10"/>
	length(str1) = ${fn:length(str1)} : str1의 문자열의 길이<br>
	toUpperCase(str1) = ${fn:toUpperCase(str1)} : str1의 문자열을 대문자로 변경<br>
	toLowerCase(str1) = ${fn:toLowerCase(str1)} : str1의 문자열을 소문자로 변경<br>
	substring(str1, 3, 6) = ${fn:substring(str1, 3, 6)} : str1의 3 ~ 5인덱스 부분 문자열<br>
	substringAfter(str1, str2) = ${fn:substringAfter(str1, str2)} : str1에서 str2 부분 이후에 부분문자열<br>
	substringBefore(str1, str2) = ${fn:substringBefore(str1, str2)} : str1에서 str2 부분 이전에 부분문자열<br>
	<hr>
	contains(str1, str2) = ${fn:contains(str1, str2)} : str1 문자열 내에 str2 문자열이 존재?<br>
	trim(str1) = ${fn:trim(str1)} : 양쪽 공백 제거<br>
	replace(str1, " ", "-") = ${fn:replace(str1, " ", "-")} : str1 문자열의 공백을 '-'로 변경
	<hr>
	startsWith(str1, "Func") = ${fn:startsWith(str1, "Func")} : str1 문자열이 Func로 시작하니?<br>
	endsWith(str1, "합니다") = ${fn:endsWith(str1, "Func")} : str1 문자열이 합니다로 종료하니?<br>
	<hr>
	split(tokens, ",") = ${fn:split(tokens, ",")}<br>
	<c:set var="arr" value="${fn:split(tokens,', ')}"/>
	<c:forEach var="i" items="${arr}" >${i}&nbsp;&nbsp;</c:forEach><br>
	join(arr, " - ") = ${fn:join(arr, " - ")} : 배열을 하나의 문자열로 연결<br>
	endsWith(str1, "합니다.") = ${fn:endsWith(fn:trim(str1), "합니다.")} : str1 문자열이 "합니다." 로 종료하니?<br>
</body>
</html>