<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 상세 보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" >
</head>
<body>
	<div class="result-card">
		<h2>방명록 조회</h2>
		<table>
			<tr><th>작성자</th><td>${book.writer}</td></tr>
			<tr><th>제목</th><td>${book.title}</td></tr>
			<tr><th>내용</th><td class="content-box">${book.content}</td></tr>
		</table>
		<div class="btn-group">
			<button type="button" class="btn-list" onclick="location.href='bookList'">목록보기</button>
			<button type="button" class="btn-edit" onclick="location.href='bookUpdateForm?no=${book.no}'">수정하기</button>
			<button type="button" class="btn-delete" onclick="confirmDelete(${book.no})">삭제하기</button>
		</div>
	</div>
	<script>
		function confirmDelete(no) {
			if (confirm("이 게시글을 정말 삭제하시겠습니까?")) {
				location.href = "bookDelete?no=" + ${book.no};
			}
		}
	</script>
</body>
</html>