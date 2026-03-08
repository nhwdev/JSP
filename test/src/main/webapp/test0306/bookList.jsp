<%@page import="java.util.List"%>
<%@page import="test0306.BookDao"%>
<%@page import="test0306.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%List<Book> books = new BookDao().list();%>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 목록</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div>
		<h2>방명록 목록</h2>
		<h5><button type="button" onclick="location.href='guestBook.jsp'">방명록 작성</button></h5>
		<table class="result-card">
			<tr><th>작성자</th><th>제목</th><th>작성된 날짜</th></tr>
			<%for (Book book : books) {%>
			<tr><td><%=book.getWriter()%></td><td><a style="text-decoration-line: none" href="bookInfo.jsp?no=<%=book.getNo()%>"><%=book.getTitle()%></a></td><td><%=book.getRegdate()%></td></tr>	
			<%}%>
		</table>
	</div>
</body>
</html>