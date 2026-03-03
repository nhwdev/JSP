<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include</title>
</head>
<body>
	<p>
		ex02_include2.jsp 페이지 입니다.
		<br> ex02_include.jsp 페이지에서 실행하면, 이 내용이 ex02_include.jsp 페이지에 포함되어 출력됩니다.
		<br> 2개의 페이지는 같은 서블릿으로 생성되므로 변수의 공유가 가능합니다.
		<br> ex02_include.jsp 페이지의 msg: <%=msg%>
	</p>
</body>
</html>