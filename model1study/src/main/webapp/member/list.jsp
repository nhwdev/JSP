<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
1. admin으로 로그인 된 경우만 조회 가능
2. db에서 모든 회원 목록을 조회하여 List<Member> 객체로 리턴
--%>
<%
String login = (String) session.getAttribute("login");
if (login == null || login.equals("")) {
%>
<script>
	alert("관리자로 로그인 하세요");
	location.href = "loginForm.jsp";
</script>
<%
} else if (!login.equals("admin")) {
%>
<script>
	alert("관리자만 거래 가능합니다.");
	location.href = "main.jsp";
</script>
<%
} else { // 관리자로 로그인한 경우
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<table>
		<caption>회원 목록</caption>
		<tr>
			<th>아이디</th>
			<th>사진</th>
			<th>이름</th>
			<th>성별</th>
			<th>전화</th>
			<th>&nbsp;</th>
		</tr>
		<%
		// list : 모든 회원 정보를 저장
		List<Member> list = new MemberDao().list();
		for (Member m : list) {
		%>
		<tr>
			<td><a href="info.jsp?id=<%=m.getId()%>"><%=m.getId()%></a></td>
			<td><img src="picture/<%=m.getPicture()%>" width="30" height="30"></td>
			<td><%=m.getName()%></td>
			<td><%=m.getGender() == 1 ? "남" : "여"%></td>
			<td><%=m.getTel()%></td>
			<td><a href="updateForm.jsp?id=<%=m.getId()%>">수정</a> 
			<%
 			if (!m.getId().equals("admin")) {
 			%> <a href="deleteForm.jsp?id=<%=m.getId()%>">강제탈퇴</a> 
 			<% } %></td>
		</tr>
		<%}%>
	</table>
</body>
</html>
<%}%>