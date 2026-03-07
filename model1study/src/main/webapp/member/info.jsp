<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
 1. 로그인 상태 검증
 	로그아웃 상태 : 로그인 메세지, loginForm.jsp 페이지로 이동
 	로그인 상태 : 다른 id 조회❌ 단 관리자는 다른 id 조회가능
 				  내 정보만 조회 가능 메세지 출력. main.jsp 페이지 이동
 2. id 파라미터 조회
 3. id 에 해당하는 레코드를 조회하여 Member 객체에 저장(mem)
--%>
<%
String login = (String) session.getAttribute("login"); // 로그인 정보
String id = request.getParameter("id"); // 파라미터 정보
if (login == null) { // → 로그아웃 상태
%>
<script>
	alert("로그인이 필요합니다");
	location.href = "loginForm.jsp";
</script>
<%
// !id.equals(login) : 파라미터로 입력된 아이디 != 로그인 된 아이디
} else if (!id.equals(login) && !login.equals("admin")) {
%>
<script>
	alert("내 정보만 수정이 가능합니다.");
	location.href = "main.jsp";
</script>
<%-- id : 파라미터값, login : session 에 등록된 login id 값 --%>
<%
} else { // 로그인 된 경우. 자기정보 or 관리자인 경우
%>
<%
// id 값에 해당하는 회원정보를 DB에서 조회하여 Member 객체로 리턴
Member mem = new MemberDao().selectOne(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<table>
		<caption>회원정보</caption>
		<tr>
			<td rowspan="6" width="30%"><img
				src="picture/<%=mem.getPicture()%>" width="200" height="210"></td>
			<th width="20%">아이디</th>
			<td><%=mem.getId()%></td>
		<tr>
			<th>이름</th>
			<td><%=mem.getName()%></td>
		<tr>
			<th>성별</th>
			<td><%=mem.getGender() == 1 ? "남" : "여"%></td>
		<tr>
			<th>전화번호</th>
			<td><%=mem.getTel()%></td>
		<tr>
			<th>이메일</th>
			<td><%=mem.getEmail()%></td>
		</tr>
		<tr>
			<td colspan="2"><a href="updateForm.jsp?id=<%=mem.getId()%>">수정</a>
				<%
				if (!id.equals("admin")) {
				%> <a href="deleteForm.jsp?id=<%=mem.getId()%>">탈퇴</a> <%
 }
 %></td>
		</tr>
	</table>
</body>
</html>
<%
}
%>