<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
 1. 모든 파라미터를 Member 객체에 저장하기
 2. 입력된 비밀번호와 DB에 저장된 비밀번호 비교.
 	관리자로 로그인 한 경우 관리자 비밀번호로 비교
 	본인 정보 수정시 본인의 비밀번호 비교
 	불일치 : '비밀번호 오류' 메세지 출력후 updateForm.jsp 이동
 3. 비밀번호 일치
 	Member 객체의 내용으로 DB를 수정하기 : boolean MemberDao.update(member)
 	 - 성공 : 회원정보 수정 완료 메시지 출력 후 info.jsp 이동
 	 - 실패 : 회원정보 수정 실패 메시지 출력 후 updateForm.jsp 이동
--%>
<%
// 1. 모든 파라미터를 Member 객체에 저장하기
request.setCharacterEncoding("UTF-8");
Member mem = new Member();
mem.setId(request.getParameter("id"));
mem.setPass(request.getParameter("pass"));
mem.setName(request.getParameter("name"));
mem.setGender(Integer.parseInt(request.getParameter("gender")));
mem.setTel(request.getParameter("tel"));
mem.setEmail(request.getParameter("email"));
mem.setPicture(request.getParameter("picture"));
// 로그인 정보 데이터 조회. 비밀번호 검증.
String login = (String) session.getAttribute("login");
MemberDao dao = new MemberDao();
Member dbMem = dao.selectOne(login);
String msg = "비밀번호 오류";
String url = "updateForm.jsp?id=" + mem.getId();
/*
mem.getPass() : 입력된 비밀번호
dbMem.getPass() : 로그인된 사용자의 비밀번호
*/
if (mem.getPass().equals(dbMem.getPass())) { // 비밀번호 일치
	if (dao.update(mem)) {
		msg = "수정 성공";
		url = "info.jsp?id=" + mem.getId();
	} else { // 비밀번호 불일치
		msg = "수정 실패";
	}
}
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>
