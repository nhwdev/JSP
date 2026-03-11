<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<table>
		<tr><th>아이디</th><td>**${pass.substring(2, pass.length())}</td></tr>
		<tr><td colspan="2"><input type="button" value="닫기" onclick="pwSend('${pass}')"></td></tr>
	</table>
	<script type="text/javascript">
		function pwSend(pass) {
			opener.document.f.pass.value = pass;
			self.close();
		}
	</script>
</body>
</html>
