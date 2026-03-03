<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
	1. "jspstudy" Dynamic WebProject 프로젝트 생성
	2. /src/webapp폴더에 ex01_directive 폴더 생성하기
	3. ex01_pageDirective.jsp jsp 파일 생성하기
    	
	/src/webapp/ex01_directive/ex01_pageDirective.jsp 
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageDirecetive</title>
</head>
<body>
	<%--
		Directive(지시어)
		<%@ 지시어 속성="속성값" ... %>
		1) page : jsp 페이지의 특징 설정 기능
		2) include : 다른 페이지를 include 하는 기능
		3) taglib : 커스텀태그 사용시 설정ㅇ. JSTL사용시 설명
	--%>
	<%
	// 스크립트릿 : 자바의 영역. 
	Date today = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	%>
	<h3>
		현재일시:
		<%=sf.format(today)%>
	</h3>
	<h3>page Directive : 지시자, 지시어</h3>
	<ul>
		<li>page의 정보를 설정하는 기능</li>
		<li>형식: &lt;%@ page 속성1="속성값1" 속성2="속성값2" ...%></li>
	</ul>
	<h3>page Directive 속성</h3>
	<ul>
		<li>contentType: 반드시 구현. 필수 속성. 현재 페이지의 종류 MIME 타입(text/html)으로
			설정함</li>
		<li>import: 패키지명을 생략 할수 있돌고 설정. 유일하게 여러번 설정이 가능</li>
		<li>pageEncoding : 인코딩 방식 설정. 생략 가능함. contentType의 charSet과 동일</li>
		<li>isErrorPage="true|false": 기본값이 false<br> true 인 경우 현재
			페이지가 오류 페이지로 설정
		</li>
	</ul>
</body>
</html>