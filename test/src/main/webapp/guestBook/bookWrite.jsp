<%@page import="guestBook.BookDao"%>
<%@page import="guestBook.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	Book book = new Book();
	book.setWriter(request.getParameter("writer"));
	book.setTitle(request.getParameter("title"));
	book.setContent(request.getParameter("content"));
	BookDao dao = new BookDao();
	int no = dao.insert(book);
	response.sendRedirect("bookInfo.jsp?no="+no);
	%>
	<%-- <div>
		이름:<%=request.getParameter("writer")%><br>
		제목:<%=book.getTitle()%><br>
		내용:<%=book.getContent()%><br>
	</div> --%>
</body>
</html>