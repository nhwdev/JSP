<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
	<%
	// 세션 유지 시간 설정. 초단위.
	// 톰캣의 경우 기본적인 세션 유지 시간 30분
	session.setMaxInactiveInterval(10);
	%>
	<h3>
		session 정보 : 브라우저별로 session 이 할당<br>
		주요 기능 : 클라이언트의 정보를 저장
	</h3>
	isNew() : <%=session.isNew()%><br> <%-- boolean: 새로운 세션? --%>
	생성시간 : <%=session.getCreationTime()%><br> <%-- session 생성시간. 1970년 이후부터 현재까지 밀리초 --%>
	최종 접속 시간 : <%=session.getLastAccessedTime()%><br> <%--session 최종 접속 시간. 1970년 이후부터 현재까지 밀리초 --%>
	session id : <%=session.getId()%><br> <%-- session ID값. session 별로 다른 ID 값을 가짐 --%>
</body>
</html>