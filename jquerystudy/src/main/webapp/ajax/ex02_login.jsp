<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" 
    url="jdbc:mariadb://localhost:3306/jspdb"
    user="user" password="4986" />
<sql:query var="rs" dataSource="${conn}">
    select * from member where id=? and pass=?
    <sql:param>${param.id}</sql:param>
    <sql:param>${param.pass}</sql:param>
</sql:query>
<c:if test="${!empty rs.rows}">
    <h1>반갑습니다 ${rs.rows[0].name}님</h1>
</c:if>
<c:if test="${empty rs.rows}">
    <h1><font color="red">아이디 또는 비밀번호가 틀립니다</font></h1>
</c:if>