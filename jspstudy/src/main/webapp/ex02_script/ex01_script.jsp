<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP_script</title>
</head>
<body>
	<h1>스크립트의 종류</h1>
	<p>Java 코드의 영역</p>
	<ol>
		<li>스크립트릿(scriptlet) : &lt;% ... %> : 자바소스의 영역. 주로 알고리즘 담당</li>
		<li>표현식(expression) : &lt;%= ... %> : 브라우저 화면에 내용 출력</li>
		<li>선언문(declaration) : &lt;%! ... %> : 서블릿의 멤버로 변환됨. 사용안함</li>
	</ol>
	<h1>스크립트릿 : _jspService() 메서드에 설정됨</h1>
	<%
	String msg = "스크립트 예제";
	for (int i = 1; i <= 10; i++) {
	%>
	<%=i + ":" + msg%><br>
	<%
	}
	%>
	<h1>표현식 : 브라우저에 내용 출력하기. out.print(값)</h1>
	<ul>
		<li>문장의 긑에 ; 사용하면 안됨</li>
		<li>값이 존재해야함 : 변수, 수식, 리턴값이 있는 함수</li>
		<%-- <%=Sytem.out.print("Hello")%> --%>
		<li>주석은 여러줄 주석만 가능함. 주석 // : 사용❌, /*...*/ : 사용⭕</li>
		<%=msg /*사용가능*/ %>
	</ul>
	<h1>선언문:jsp 서블릿의 멤버로 설정됨</h1>
	<%=this.msg%><br>
	<%=this.getMsg()%><br>
	<%!String msg = "선언문의 msg 변수";

	String getMsg() {
		return msg;
	}%>
</body>
</html>