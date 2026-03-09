<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
1. 2개의 파라미터 정보 변수 저장
2. 로그인 정보 검증
	- 로그아웃 상태 : 로그인하세요. loginForm.jsp로 이동
	- 본인만 탈퇴가능(관리자 제외) : 본인만 탈퇴 가능합니다. main.jsp 이동
	- 관리자가 탈퇴는 불가 : 관리자는 탈퇴❌. list.jsp로 페이지 이동
3. 비밀번호 검증
	- 로그인 정보로 비밀번호 검증.
	- 비밀번호 불일치 : 비밀번호 오류 메세지 출력. deleteForm.jsp로 이동
4. DB에서 id 에 해당하는 회원정보 삭제하기
   boolean MemberDao.delete(id)
   탈퇴 성공
   	- 일반 사용자 : 로그아웃 실행. 탈퇴 메시지 출력, loginForm.jsp로 이동
   	- 관리자	  : 탈퇴 메시지 출력. list.jsp로 이동
   탈퇴 실패
    - 일반 사용자 : 탈퇴 실패 메시지 출력. main.jsp로 이동
    - 관리자	  : 탈퇴 실패 메시지 출력. list.jsp로 이동
--%>
<%
// 1. 2개의 파라미터 정보 변수 저장
String id = request.getParameter("id");
String pass = request.getParameter("pass");
// 2. 로그인 정보 검증
String login = (String) session.getAttribute("login");
String msg = null;
String url = null;
if (login == null) { // 로그아웃 상태
	msg = "로그인 하세요";
	url = "loginForm.jsp";
} else if (!id.equals(login) && !login.equals("admin")) { // 본인 검증
	msg = "본인만 탈퇴 가능합니다.";
	url = "main.jsp";
} else if (id.equals("admin")) { // 관리자 탈퇴 불가
	msg = "관리자는 탈퇴할 수 없습니다.";
	url = "list.jsp";
} else {
	// 3. 비밀번호 검증
	MemberDao dao = new MemberDao();
	Member dbMem = dao.selectOne(login); // 로그인 정보에 해당하는 데이터 조회
	// pass : 입력된 비밀번호
	// dbMem.getPass() : 로그인 아이디의 DB에 저장된 비밀번호
	if (pass.equals(dbMem.getPass())) { // 비밀번호 일치
		if (login.equals("admin")) {
			url = "list.jsp";
		}
		if (dao.delete(id)) { // id정보를 db에서 삭제
			msg = id + "님 회원이 탈퇴되었습니다.";
			if (!login.equals("admin")) {
				session.invalidate();
				url = "loginForm.jsp";
			}
		} else { // 삭제 실패
			msg = id + "님 탈퇴에 실패하였습니다.";
			if (!login.equals("admin")) {
				url = "main.jsp";
			}
		}
	} else { // 비밀번호 오류
		msg = "비밀번호가 틀립니다.";
		url = "deleteForm.jsp?id=" + id;
	}
}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>
