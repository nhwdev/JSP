<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
 1. session 의 login 정보 제거
 2. loginForm.jsp 페이지 이동
--%>
<%
String id = (String) session.getAttribute("login"); // 로그인 정보
// session.removeAttribute("login"); // login 정보를 session 객체에서 제거. invalidate()가 포함
session.invalidate(); // session을 새로운 객체 변경. 기존객체 삭제. 등록된 모든 속성 정보가 제거
response.sendRedirect("loginForm.jsp");

%>
<script>
alert("<%=id%>님 로그아웃 되었습니다.");
location.href = "loginForm.jsp";
</script>
