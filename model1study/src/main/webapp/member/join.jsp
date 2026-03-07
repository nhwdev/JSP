<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
 joinForm.jsp에서 입력된 값을 member 테이블에 저장하기
  1. 파라미터 값을 Member 클래스의 객체에 저장하기
  2. Member 객체의 값을 DB의 MEMBER TABLE 에 저장하기
  3. 회원가입 성공 : loginForm.jsp 페이지로 이동
  	 회원가입 실패 : joinForm.jsp 페이지로 이동
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	Member mem = new Member(); // DTO 클래스. 데이터 전달을 위한 객체. Bean 클래스
	mem.setId(request.getParameter("id"));
	mem.setPass(request.getParameter("pass"));
	mem.setName(request.getParameter("name"));
	mem.setGender(Integer.parseInt(request.getParameter("gender")));
	mem.setTel(request.getParameter("tel"));
	mem.setEmail(request.getParameter("email"));
	mem.setPicture(request.getParameter("picture"));
	// mem 객체 : 화면에서 입력받은 데이터 저장하는 객체
	MemberDao dao = new MemberDao(); // Model 클래스
	String msg = "회원가입 실패";
	String url = "joinForm.jsp";
	if(dao.insert(mem)){
		msg = "회원가입 성공";
		url = "loginForm.jsp";
	}
	%>
	<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
	</script>
</body>
</html>