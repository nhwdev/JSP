<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forEach 태그를 이용하여 Collection 객체 조회하기</title>
</head>
<body>
	<h3>forEach 태그를 이용하여 Collection 객체 조회하기</h3>
	<%
	List<Integer> list = new ArrayList<>();
	for (int i = 1; i <= 10; i++) {
		list.add(i * 10);
	}
	pageContext.setAttribute("list", list); // [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
	%>
	<%--
	varStatus="s" : items 객체의 상태 값
		s.index : 0부터 시작
		s.count : 1부터 시작
		
	--%>
	<c:forEach var="a" items="${ list }" varStatus="s">
		${ s.index }:${ a }&emsp;&emsp;&emsp;${ s.count }:${ a }<br>
	</c:forEach>
	<%--
	10 20 30 40 50
	60 70 80 90 100
	--%>
	<h3>list 객체를 2줄로 출력하기</h3>
	<c:forEach var="num" items="${ list }" varStatus="status">
		<c:if test="${ status.index==5 }">
			<br>
		</c:if>
		${ num }&emsp;
	</c:forEach>	
	<h3>list 객체를 인덱스를 이용하여 출력하기</h3>
	list[0] = ${ list[0] }<br>
	list[5] = ${ list[5] }<br>
	list[9] = ${ list[9] }<br>
	<hr>
	<c:set var="arr" value="<%=new int[]{10, 20, 30, 40, 50} %>"/>
	<h3>배열 객체를 인덱스를 이용하여 출력</h3>
	arr[0] = ${arr[0]}<br>
	arr[1] = ${arr[1]}<br>
	arr[2] = ${arr[2]}<br>
	arr[3] = ${arr[3]}<br>
	arr[4] = ${arr[4]}<br>
	
	<h3>forEach태그를 이용하여 배열 객체를 출력하기</h3>
	<c:forEach var="a" items="${ arr }" varStatus="stat">
		arr[${ stat.index }] = ${ a }<br> 
	</c:forEach>
	
	<h3>forEach 태그를 이용하여 배열 객체의 2번째 요소로부터 3번째 요소만 출력하기</h3>
	<h4>begin, end 값 : 배열의 인덱스 값</h4>
	<c:forEach var="a" items="${ arr }" varStatus="stat" begin="1" end="2">
		arr[${ stat.index }] = ${ a }<br>
	</c:forEach>
	
	<h3>forEach 태그를 이용하여 배열 객체의 짝수 인덱스의 요소만 출력하기</h3>
	<c:forEach var="a" items="${ arr }" varStatus="stat" step="2">
		arr[${ stat.index }] = ${ a }<br>
	</c:forEach>
	
	<h3>forEach 태그를 이용하여 배열 객체의 홀수 인덱스의 요소만 출력하기</h3>
	<c:forEach var="a" items="${ arr }" varStatus="stat" begin="1" step="2">
		arr[${ stat.index }] = ${ a }<br>
	</c:forEach>
	<hr>
	
	<h3>forEach태그를 이용하여 Map 객체 출력하기</h3>
	<%
	Map<String, Object> map = new HashMap<>();
	map.put("name", "홍길동");
	map.put("today", new Date());
	map.put("age", 20);
	pageContext.setAttribute("map1", map);
	%>
	<c:forEach var="a" items="${ map1 }" varStatus="stat">
		${ stat.count } : ${ a.key } = ${ a.value }<br>
	</c:forEach>
	<h3>Map 객체를 EL을 이용하여 출력하기</h3>
	이름 : ${ map1.name }<br> <%-- ${map1.name} : map1 객체중 key의 이름이 name인 객체의 value 값을 리턴 --%>
	일자 : ${ map1.today }<br>
	나이 : ${ map1.age }<br>
</body>
</html>