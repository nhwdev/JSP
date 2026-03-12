<%@page import="java.util.List"%>
<%@page import="guestBook.BookDao"%>
<%@page import="guestBook.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%List<Book> books = new BookDao().list();%>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 목록</title>
<link rel="stylesheet" href="style.css">
<style type="text/css">
a{
	text-decoration-line: none;
	color: blue;
	cursor: pointer;
	text-align: center;
}
th:last-child, td:last-child {
    white-space: nowrap;
}
}
</style>
</head>
<body>
	<div>
		<h2>방명록 목록</h2>
		<h5><button type="button" onclick="location.href='guestBook.jsp'">방명록 작성</button></h5>
		<table class="result-card">
			<tr><th>작성자</th><th>제목</th><th>작성된 날짜</th><td></td></tr>
			<%for (Book book : books) {%>
			<tr><td><%=book.getWriter()%></td>
				<td><a href="bookInfo.jsp?no=<%=book.getNo()%>"><%=book.getTitle()%></a></td>
				<td><%=book.getRegdate()%></td>
				<td><a href="bookUpdateForm.jsp?no=<%=book.getNo()%>">수정</a><br>
					<a onclick="confirmDelete('<%=book.getNo()%>')">삭제</a></td></tr>	
			<%}%>
		</table>
	</div>
	<script>
		function confirmDelete(no) {
			if (confirm("이 게시글을 정말 삭제하시겠습니까?")) {
				location.href = "bookDelete.jsp?no=" + no;
			}
		}
	</script>
</body>
</html>