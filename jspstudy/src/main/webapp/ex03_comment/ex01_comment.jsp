<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comment</title>
</head>
<body>
	<h1>JSP에서 사용되는 주석 : 3가지</h1>
	<ol>
		<li>JSP 주석 : &lt;%-- JSP 주석 --%></li>
		<%-- JSP 주석입니다. JSP 페이지가 서블릿으로 변경될 때 제외 됩니다. 서블릿 소스에서 볼 수 없습니다. --%>
		<li>JSP 주석 : &lt;% // JSP 주석 --%>, &lt;% /* Java 주석 */ %><br>
			자바에서 사용되는 주석. 스크립트 내부에서 사용됩니다. 자바의 영역에서 사용되는 주석입니다.<br>
			자바주석은 JSP의 서블릿페이지에서 볼 수 있습니다. 서블릿페이지가 컴파일 될 때 주석으로 처리 됩니다.<br>
		</li>
		<li>HTML 주석 : &lt;!-- HTML 주석 --><br>
			JSP나 서블릿에서는 주석이 아닙니다. 브라우저에서 화면 출력시 주석으로 인식합니다.
			<% String msg = "JSP 주석 페이지"; %>
			<!-- <%=msg %> : 이곳은 HTML 주석입니다. 서블릿까지 주석이 아닙니다.
			HTML 주석은 브라우저의 소스에서 볼 수 있습니다. --></li>
	</ol>
	<%--
		JSP 구성요소
		1. 지시어(Directive)
		  1) <%@ 지시어 속성="속성값" %>
		  2) page : JSP 페이지의 설정
		     include : 다른 페이지를 포함시킬 때 사용
		     taglib : JSTL 사용시 설정
		2. 스크립트(script) : 자바소스의 영역.
		  1) 스크립트릿 : <% ... %>. _jspService() 메서드 내에 자바소스로 설정
		  2) 표현식 : <%= 값 %>. _jspService() 메서드 내에 out.print(값) 형식으로 설정
		  			// , ; : 사용❌	
		  3) 선언문 : <%! --- %> : 서블릿의 멤버로 생성. 사용안함
		3. 주석(Comment) : 처리되지 않는 영역
		  1) JSP 주석 : <%-- ... --%&rt; : JSP 영역에서 사용되는 주석. 서블릿에서 보여 지지 않음
		  2) Java 주석 : 스크립트내에서 사용되는 주석. 서블릿이 컴파일될 때 처리❌
		  3) HTML 주석 : 서버(JSP, 서블릿)에서 주석이 아님. 브라우저에서 소스 보기로 볼수 있음. 
	--%>
</body>
</html>