<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="test" uri="/ELFunctions" %>
<%--
tag lib 디렉티브 : ELFunction, 커스텀태그의 설정 파일을 알려주는 지시자.
prefix="test : 접두어. test 접두어가 있는 함수(태그)의 설정파일은 /ELFunctions uri 값
uri="/ELFunctions" : uri 태그의 내용이 /ELFunctions인 파일을 WEB-INF 폴더의 하위 파일을 검색하여 로드
					 => /WEB-INF/tld/el_function.tld 파일 선택
--%>
<html>
<head>
<meta charset="UTF-8">
<title>EL에서 자바 함수 이용하기</title>
</head>
<body>
<form method="post"> <%-- action 속성이 없는 경우 현재페이지 다시 호출 --%>
	x : <input type="text" name="x" value="${param.x}"><br>
	y : <input type="text" name="y" value="${param.y}"><br>
	<input type="submit" value="더하기">
</form>
<p>
합계 : ${test:add(param.x, param.y)}<br>
</body>
</html>