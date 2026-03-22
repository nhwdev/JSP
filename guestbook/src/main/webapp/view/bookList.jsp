<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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
</style>
</head>
<body>
	<div>
		<h2>방명록 목록</h2>
		<h5><button type="button" onclick="location.href='guestBook'">방명록 작성</button></h5>
		<table class="result-card">
			<tr><th>작성자</th><th>제목</th><th>작성된 날짜</th><td></td></tr>
			<c:forEach var="book" items="${books}">
			<tr><td>${book.writer}</td>
				<td><a href="bookInfo?no=${book.no}">${book.title}</a></td>
				<td>${book.regdate}</td>
				<td><a href="bookUpdateForm?no=${book.no}">수정</a><br>
					<a onclick="confirmDelete('${book.no}')">삭제</a></td></tr>
			</c:forEach>
		</table>
	</div>
	<script>
		function confirmDelete(no) {
			if (confirm("이 게시글을 정말 삭제하시겠습니까?")) {
				location.href = "bookDelete?no=" + no;
			}
		}
	</script>
</body>
</html>