<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
1. 파라미터(id, email, tel) 저장
2. DB에서 id, email, tel 을 이용하여 pass 값을 리턴
	pass = MemberDao.pwSearch(id, email, tel)
3. 비밀번호 검증
   비밀번호 찾은 경우 : 화면에 앞 2자리는 **로 표시하여 화면에 출력.
   						닫기버튼 클릭시 현재 화면 닫기
   비밀번호 못찾은 경우 : 정보에 맞는 비밀번호를 찾을 수 없습니다.
   						  메시지 출력 후 현재 페이지를 pwForm.jsp로 이동
--%>
<%
String id = request.getParameter("id");
String email = request.getParameter("email");
String tel = request.getParameter("tel");
MemberDao dao = new MemberDao();
String pass = dao.pwSearch(id, email, tel);
if (pass != null) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<table>
		<tr><th>아이디</th><td><%="**" + pass.substring(2, pass.length())%></td></tr>
		<tr><td colspan="2"><input type="button" value="닫기" onclick="pwSend('<%=pass.substring(0, pass.length())%>')"></td></tr>
	</table>
	<script type="text/javascript">
		function pwSend(pass) {
			opener.document.f.pass.value = pass;
			self.close();
		}
	</script>
	<%} else {%>
	<script type="text/javascript">
		alert("정보에 맞는 비밀번호를 찾을 수 없습니다.");
		location.href = "pwForm.jsp";
	</script>
	<%}%>
</body>
</html>
