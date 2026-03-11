<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<table>
		<tr><th>아이디</th><td>${id.substring(0, id.length()-2)}**</td></tr>
		<tr><td colspan="2"><input type="button" value="아이디 전송" onclick="idSend('${id}')"></td></tr>
	</table>
	<script type="text/javascript">
		function idSend(id) {
			opener.document.f.id.value = id;
			self.close();
		}
	</script>
</body>
</html>