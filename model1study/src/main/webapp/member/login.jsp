<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
 1. 파라미터값을 조회(아이디, 비밀번호)
 2. DB에서 입력된 아이디에 해당하는 레코드를 읽어서 Member 객체에 저장
 3. DB에서 조회된 내용과 입력된 내용을 비교
 	- 아이디 존재? : 없는 경우 → 아이디 없음 메세지 출력. loginForm.jsp 페이지로 이동
 					 있는 경우 → 비밀번호를 비교
 	- 비밀번호 비교 :
 		불일치 →비밀번호 오류 loginForm.jsp 페이지 이동
 		일치 → session 로그인 정보 등록. main.jsp 페이지 이동 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%
	// 1. 파라미터값을 조회(아아디, 비밀번호)
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	// 2. DB에서 입력된 아이디에 해당하는 레코드를 읽어서 Member 객체에 저장
	Member mem = new MemberDao().selectOne(id);
	// mem : DB에 저장된 회원 정보 저장
	// 3. DB에서 조회된 내용과 입력된 내용을 비교
	String msg = null;
	String url = "loginForm.jsp";
	if (mem == null) { // id에 해당하는 회원가입 정보 없음
		msg = "아이디를 확인하세요.";
	} else { // id에 해당하는 회원가입 정보 있음. 비밀번호 검증
		if (pass.equals(mem.getPass())) {
			// pass : 입력된 비밀번호
			// mem.getPass() : DB에 등록된 비밀번호
			session.setAttribute("login", id); // 세션객체에 로그인정보 저장
			msg = mem.getName() + "님이 로그인 하셨습니다.";
			url = "main.jsp";
		} else { // 비밀번호 불일치
			msg = "비밀번호가 틀립니다.";
		}
	}
	%>
	<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
	</script>
</body>
</html>