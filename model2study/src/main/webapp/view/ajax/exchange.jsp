<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3 class="text-center">수출입환율정보<br>${date}</h3>
<table class="table">
    <tr><th>통화</th><th>기준율</th><th>받으실때</th><th>보내실때</th></tr>
    <c:forEach items="${list}" var="tdlist">
        <tr><td>${tdlist[0]}<br>${tdlist[1]}</td><td>${tdlist[4]}</td><td>${tdlist[2]}</td><td>${tdlist[3]}</td></tr>
    </c:forEach>
</table>