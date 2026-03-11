<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 
<sitemesh:write property="title" /> : title 태그의 내용 
<sitemesh:write property="head" /> : head 태그의 내용. title 태그의 내용은 제외
<sitemesh:write property='body' />
--%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><sitemesh:write property="title" /></title>
<link rel="stylesheet" href="<%=path%>/css/main.css">
<sitemesh:write property="head" />
</head>
<body>
	<table>
		<tr>
			<td colspan="3" style="text-align: right">
				<%
				String login = (String) session.getAttribute("login");
				if (login == null) {
				%> <a href="<%=path%>/member/loginForm">로그인</a> <a
				href="<%=path%>/member/joinForm">회원가입</a> <%
 } else { // 로그인 된 상태
 %> <%=login%>님.<a href="<%=path%>/member/logout">로그아웃</a> <%
 }
 %>
			</td>
		</tr>
		<tr>
			<td width="15%" valign="top"><a href="<%=path%>/member/main">회원관리</a><br></td>
			<td colspan="2" style="text =align: left; vertical-align: top">
				<sitemesh:write property='body' />
			</td>
		</tr>

		<tr>
			<td colspan="3">MVC Model2</td>
		</tr>
	</table>
</body>
</html>