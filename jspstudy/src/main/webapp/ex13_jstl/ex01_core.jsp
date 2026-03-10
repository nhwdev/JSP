<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core 태그</title>
</head>
<body>
<h3>속성 관련 태그 : set, remove, out 태그</h3>
<ul>
<li>set 태그 : 영역에 속성을 등록, scope 속성에 영역을 표시함. (page, request, session, application)<br>
			   scope 속성이 생략되면 page 영역에 속성이 등록됨</li>
<li>out 태그 : 화면에 출력. EL과 같음. 내부에 사용된 태그를 무시할 수 있음(escapeXml).EL보다 보안성이 좋음</li>
<li>remove 태그 : 등록된 속성을 제거. removeAttribute 함수와 기능이 같음</li>
</ul>
	<%session.setAttribute("test", "Hello JSTL"); %>
	1. test 속성 : ${sessionScope.test}<br>
	2. test 속성 : <c:out value="${test}" /><br>
	   <c:set var="test1" value="${'core:set 태그로 등록'}" scope="session"/>
	3. test1 속성 : ${test1}<br>
	4. test1 속성 : <c:out value="${test1}"/><br>
	5. test1 속성 : ${pageScope.test1}<br>
	6. test1 속성 : <c:out value="${pageScope.test1}" /><br>
	   <c:remove var="test1"/>
	7. test1 속성 : ${test1}<br>
	8. test1 속성 : <c:out value="${test1}"/><br>
</body>
</html>