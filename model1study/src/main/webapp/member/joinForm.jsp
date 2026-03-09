<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<form action="join.jsp" name="f" method="post"
		onsubmit="return input_check(this)">
		<input type="hidden" name="picture" value="">
		<table>
			<tr>
				<td rowspan="4" valign="bottom"><img src="" width="100" height="120" id="pic"><br> <font size="1">
												<a href="javascript:win_upload()">사진등록</a></font></td>
				<th>아이디</th><td><input type="text" name="id"><button type="button" onclick="idchk()">중복검색</button></td></tr>
			<tr><th>비밀번호</th>
				<td><input type="password" name="pass"></td></tr>
			<tr><th>이름</th>
				<td><input type="text" name="name"></td></tr>
			<tr><th>성별</th>
				<td><label for="gender1">남</label> <input type="radio"
					id="gender1" name="gender" value="1" checked> <label
					for="gender2">여</label> <input type="radio" id="gender1"
					name="gender" value="2"></td></tr>
			<tr><th>전화번호</th><td colspan="2"><input type="text" name="tel"></td></tr>
			<tr><th>이메일</th><td colspan="2"><input type="text" name="email"></td></tr>
			<tr><td colspan="3"><button>회원가입</button></td></tr>
		</table>
	</form>
	<script type="text/javascript" src="../js/main.js"></script>
	<script>
		function win_upload() {
			let op = "width=500, height=500, left=50, top=150";
			open("pictureForm.jsp","",op);
		}
		
		function idchk(){
			if(document.f.id.value == ''){
				alert("아이디를 입력하세요");
				document.f.id.focus()
			} else {
				let op = "width=500, height=200, left=50, top=150";
				open("idchk.jsp?id=" + document.f.id.value, "", op);
			}
		}
	</script>
</body>
</html>