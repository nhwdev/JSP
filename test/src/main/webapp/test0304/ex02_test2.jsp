<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02_test2</title>
</head>
<body>
	<%
	if (session.getAttribute("date") == null) {
		response.sendRedirect("ex02_test1.jsp");
	}
	%>
	<h3>
		session에 등록된 날짜를 조회하고, session속성에서 제거하기<br> 등록된 날짜가 없는 경우
		ex02_test1.jsp 페이지로 이동하기<br> 등록된 날짜 :
		<%=session.getAttribute("date")%>
		<%
		session.removeAttribute("date");
		%>
	</h3>
</body>
</html>