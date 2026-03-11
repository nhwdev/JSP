<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 검색</title>
<link rel="stylesheet" href="../css/main.css">
<style type="text/css">
.able {
	color: green;
	font-size: 15px;
}

.disable {
	color: red;
	font-size: 20px;
}
</style>
</head>
<body>
	<table class="table">
		<tr><td>아이디</td><td>${id}</td></tr>
		<tr><td colspan="2"><div id="msg">${msg}</div></td></tr>
		<tr><td colspan="2"><button onclick="self.close()" class="btn btn-primary">닫기</button></td></tr>
	</table>
	<script>
		// #msg인 div 태그의 class="able" || "disable"
		document.querySelector("#msg").className='${className}';
		if('${className}' == 'disable')
			opener.document.f.id.value=""; // joinForm 페이지의 id의 value="" 설정
	</script>
</body>
</html>