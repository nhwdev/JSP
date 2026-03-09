<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
1. id 파라미터
2. id 를 이용하여 DB에서 조회
3. DB에서 조회 안되는 경우 : 사용가능한 아이디 입니다. 초록색 화면 출력
   DB에서 조회 되는 경우 : 사용 중인 아이디 입니다. 빨강색 화면 출력. 등록된 아이디를 초기화
4. 닫기 버튼 클릭되면 화면 닫기
--%>
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
	<%
	String id = request.getParameter("id");
	Member mem = new MemberDao().selectOne(id);
	String msg = null;
	String className = null;
	if (mem == null){ // DB에 등록되지 않은 아이디. 사용가능
		msg = "사용가능한 아이디 입니다.";
		className = "able";
	} else { // DB에 등록된 아이디. 사용불가 아이디
		msg = "사용 중인 아이디 입니다.";
		className = "disable";
	}
	%>
	<table class="table">
		<tr><td>아이디</td><td><%=id%></td></tr>
		<tr><td colspan="2"><div id="msg"><%=msg%></div></td></tr>
		<tr><td colspan="2"><button onclick="self.close()" class="btn btn-primary">닫기</button></td></tr>
	</table>
	<script>
		// #msg인 div 태그의 class="able" || "disable"
		document.querySelector("#msg").className='<%=className%>';
		if('<%=className%>' == 'disable')
			opener.document.f.id.value=""; // joinForm.jsp 페이지의 id의 value="" 설정
	</script>
</body>
</html>