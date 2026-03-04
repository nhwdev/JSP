<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>client</title>
</head>
<body>
<h3>클라이언트 정보</h3>
로컬 주소 : <%=request.getLocalAddr() %><br>
클라이언트 주소 : <%=request.getRemoteAddr() %><br>
클라이언트 주소 : <%=request.getRemoteHost() %><br>
요청 메서드 : <%=request.getMethod() %><br>
요청URI : <%=request.getRequestURI() %><br>
요청URL : <%=request.getRequestURL() %><br>
웹 어플리케이션 이름: <%=request.getContextPath() %><br>
서버 이름 : <%=request.getServerName() %><br>
서버 포트 : <%=request.getServerPort() %><br>
<%--
	네트워크 IP 주소 표현
	IPv4 : 32비트 표현
	IPv6 : 128비트 표현
--%>
</body>
</html>