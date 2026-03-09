<%@page import="guestBook.BookDao"%>
<%@page import="guestBook.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 수정</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%
	Book book = new BookDao().view(Integer.parseInt(request.getParameter("no")));
	%>
	<div class="result-card">
		<h2>방명록 수정</h2>
		<form action="bookUpdate.jsp" method="post" onsubmit="return inputcheck(this)">
			<input type="hidden" name="no" value="<%=book.getNo()%>">
		<table>
			<tr><th>작성자</th><td><input type="text" name="writer" value="<%=book.getWriter()%>"></td></tr>
			<tr><th>제목</th><td><input type="text" name="title" value="<%=book.getTitle()%>"></td></tr>
			<tr><th>내용</th><td><textarea rows="5" cols="30" name="content"><%=book.getContent()%></textarea></td></tr>
		</table>
		<div class="btn-group">
			<button type="submit" class="btn-edit">수정완료</button>
		</div>
		</form>
	</div>
	<script type="text/javascript">
	   function inputcheck(f) {
	       if(f.writer.value == '') {
			   alert("방문자를 입력하세요");
			   f.writer.focus();
			   return false;
	       }
	       if(f.title.value == '') {
			   alert("제목 입력하세요");
			   f.title.focus();
			   return false;
	       }
	       if(f.content.value == '') {
			   alert("내용 입력하세요");
			   f.content.focus();
			   return false;
	       }
	       return true;
	   }
	</script>
</body>
</html>