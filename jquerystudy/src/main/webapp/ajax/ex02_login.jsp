<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> <%-- JSTL로 DB의 접근 -->
<%-- DataSource : DataBase와 연결 객체 --%>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" 
    url="jdbc:mariadb://localhost:3306/jspdb"
    user="user" password="4986" />
    <%-- query 실행. 결과: rs --%>
    <sql:query var="rs" dataSource="${conn}">
        select * from member where id=? and pass=?
        <sql:param>${param.id}</sql:param>
        <sql:param>${param.pass}</sql:param>
    </sql:query>
    <c:if test="${!empty rs.rows}"> <%-- DB에 결과가 존재: id, pass가 맞는 레코드 존재 --%>
        <h1>반갑습니다 ${rs.rows[0].name}님</h1> <%-- 클라이언트 전송 메시지 --%>
    </c:if>
    <c:if test="${empty rs.rows}"> <%-- DB에 결과가 없음: id, pass가 맞는 레코드 없음 --%>
        <h1><font color="red">아이디 또는 비밀번호가 틀립니다</font></h1> <%-- 클라이언트 전송 메시지 --%>
</c:if>