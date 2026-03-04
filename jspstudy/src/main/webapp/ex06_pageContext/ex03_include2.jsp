<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h4>ex03_include2.jsp 페이지 입니다.</h4>
<p>
	ex03_include1.jsp 페이지에 포함되는 페이지 입니다.<br> 
	include 지시어(Directive)와 다른 점은 하나의 서블릿에 생성되지 않기 때문에 변수의 공유는 불가합니다.<br>
	<%-- 변수 공유 : <%=msg%><br> --%>
	pageContext 속성 : <%=pageContext.getAttribute("msg")%><br>
	request 속성 : <%=request.getAttribute("msg")%><br>
</p>