<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 형식화 태그</title>
</head>
<body>
	<h3>숫자 관련 형식 지정</h3>
	<%--
	type="currency" : 현재 지역의 화폐단위 출력
	currencySymbol = "₩" : 지역의 화폐표시 문자 지정
	
	type="percent" : value 의 값을 퍼센트 단위로 출력
	
	pattern="###,###.00" : 사용자가 숫자의 형식을 지정
	--%>
	<fmt:formatNumber value="500000" type="currency" currencySymbol="₩"/>원<br>
	<fmt:formatNumber value="0.15" type="percent"/><br>
	<fmt:formatNumber value="50000.345" pattern="###,###.00"/><br>
	<h3>지역 설정</h3>
	<fmt:setLocale value="en_US"/>
	<fmt:formatNumber value="500000" type="currency"/><br>
	<fmt:setLocale value="ko_KR"/>
	<fmt:formatNumber value="500000" type="currency"/><br>
	<hr>
	<c:set var="today" value="<%=new java.util.Date() %>" />
	년월일 : <fmt:formatDate value="${today}" type="date"/><br>
	시분초 : <fmt:formatDate value="${today}" type="time"/><br>
	년월일시분초 : <fmt:formatDate value="${today}" type="both"/><br>
	년월일시분초-short : <fmt:formatDate value="${today}" type="both" timeStyle="short" dateStyle="short"/><br>
	년월일시분초-long : <fmt:formatDate value="${today}" type="both" timeStyle="long" dateStyle="long"/><br>
	년월일시분초-full : <fmt:formatDate value="${today}" type="both" timeStyle="full" dateStyle="full"/><br>
	년월일시분초-GMT : <fmt:formatDate value="${today}" type="both" timeStyle="full" dateStyle="full" timeZone="GMT"/><br> <%-- timeZone : 국가 시간 설정 --%>
	
	<h3>직접 형식을 지정하여 출력</h3>
	형식 지정 : <fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일 HH:mm:ss a E"/>
	<p>pattern 속성은 SimpleDateFormat에서 사용하는 형식화 문자와 같다</p>
	<%--
	~~Format 클래스
		format() : 객체 → 형식화된 문자열 변경
			<fmt:formatNumber ...> : 숫자 → 형식화된 문자열 변경 
			<fmt:formatDate ...> : Date 객체 → 형식화된 문자열로 변경
		parse() : 형식화 된 문자열 → 원래의 객체
			<fmt:parseNumber ...> : 형식화된 문자열 → 숫자
			<fmt:parseDate ...> : Date 객체 → 형식화된 문자열로 변경ㅇ
	--%>
</body>
</html>