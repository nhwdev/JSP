<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" url="jdbc:mariadb://localhost:3306/jspdb" user="user" password="4986"/>
<sql:query var="rs" dataSource="${conn}">
	select * from member where name like ?
	<sql:param>${param.name}%</sql:param>
</sql:query>
<c:if test="${!empty rs.rows}">
<c:forEach var="row" items="${rs.rows}">
<tr>
  <td>${row.id}</td>
  <td>${row.name}</td>
  <td>${row.tel}</td>
  <td>${row.email}</td>
  <td>${(row.gender == 1)?"남자":"여자"}</td>
</tr>
</c:forEach>
</c:if>
<c:if test="${empty rs.rows}">
<tr><td colspan="5">일치하는 이름이 없습니다</td></tr>
</c:if>