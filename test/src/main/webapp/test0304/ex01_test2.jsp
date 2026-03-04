<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01_test2</title>
</head>
<body>
	<h1>주문 내역</h1>
	<h4>[주문 정보]</h4>
	<ul>
		<%
		request.setCharacterEncoding("UTF-8");
		String pizza = request.getParameter("pizza");
		String[] topping = request.getParameterValues("topping");
		String[] side= request.getParameterValues("side");
		String payment = request.getParameter("payment");
		%>
		<li>피자명 : <%=pizza %></li>
		<li>토핑 :
		<% 
		for(int i=0; i<topping.length; i++){
		%>
		<%=topping[i]+((i==topping.length-1)?"":", ") %>
		<% } %>
		</li>
		<li>사이드 :
		<%
		for(int i =0; i< side.length; i++){
		%>
		<%=side[i]+((i==side.length-1)?"":", ") %>
		<% } %>
		</li>
	</ul>
	<h4>위와 같이 주문하셨습니다.</h4>
	<h1>결제방식: <%=payment.equals("card")?"카드":"현금" %></h1>
</body>
</html>