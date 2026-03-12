<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
1. Member 객체 전달.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 전 화면 조회</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<form action="update" method="post"
		onsubmit="return input_check(this)" name="f">
		<input type="hidden" name="picture" value="${mem.picture}">
		<table>
			<caption>회원정보 수정</caption>
			<tr><td rowspan="4" valign="bottom"><img src="../picture/${mem.picture}" width="100" height="120" id="pic"><br>
					<font size="1"><a href="javascript:win_upload()">사진수정</a></font></td>
				<th>아이디</th>
				<td><input type="text" value="${mem.id}" name="id" readonly></td></tr>
			<tr><th>비밀번호</th>
				<td><input type="password" name="pass"></td></tr>
			<tr><th>이름</th>
				<td><input type="text" name="name" value="${mem.name}"></td></tr>
			<tr><th>성별</th>
				<td><input type="radio" name="gender" value="1"
					${mem.gender == 1 ? "checked" : ""}>남 <input
					type="radio" name="gender" value="2"
					${mem.gender == 2 ? "checked" : ""}>여</td></tr>
			<tr><th>전화번호</th>
				<td colspan="2"><input type="text" name="tel"
					value="${mem.tel}"></td></tr>
			<tr><th>이메일</th>
				<td colspan="2"><input type="text" name="email"
					value="${mem.email}"></td></tr>
			<tr><td colspan="3"><button>회원 수정</button> 
				<c:if test="${param.id == sessionScope.login}">
					<button	type="button" onclick="win_passchg()">비밀번호 변경</button>
				</c:if>
				</td></tr>
		</table>
	</form>
	<%-- 회원등록시 검증, 회원수정 검증이 동일 --%>
	<script type="text/javascript" src="../js/main.js"></script>
	<script type="text/javascript">
		function win_passchg() {
			var op = "width=500, height=250, left=50, top=150";
			open("cpForm", "", op);
		}
		function win_upload() {
			var op = "width=500, height=150, left=50, top=150";
			open('pictureForm', "", op);
		}
	</script>
</body>
</html>