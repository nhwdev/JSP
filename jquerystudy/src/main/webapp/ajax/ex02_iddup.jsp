<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" 
url="jdbc:mariadb://localhost:3306/jspdb"
user="user" password="4986" />
<sql:query var="rs" dataSource="${conn}">
    select * from member where id=?
    <sql:param>${param.id}</sql:param>
</sql:query>
<c:if test="${!empty rs.rows}">
	<h1 class="find" id="result">${param.id}는 존재하는 아이디 입니다.</h1>
</c:if>
<c:if test="${empty rs.rows}">
    <h1 class="notfind" id="result">사용 가능한 아이디 입니다.</h1>
</c:if>