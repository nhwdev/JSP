<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL ...</title>
</head>
<body>
	<fmt:requestEncoding value="UTF-8"/>
	<form method="post" name="f">
	이름 : <input type="text" name="name" value="${param.name}"><br>
	입사일 : <input type="text" name="hiredate" value="${param.hiredate}"> yyyy-MM-dd 형태로 입력<br>
	급여 : <input type="text" name="salary" value="${param.salary}"><br>
	<%--
	paramValues.job : job 파라미터의 값들을 배열로 리턴
	fn:join(배열, ',') : 배열의 요소를 , 로 연결하여 문자열로 리턴
	--%>
	<c:set var="jobs" value="${fn:join(paramValues.job, ',')}"/>
	담당업무 : <input type="checkbox" name="job" value="서무"
			   <c:if test="${fn:contains(jobs,'서무')}">checked</c:if>>서무 &emsp;
			   <input type="checkbox" name="job" value="개발"
			   <c:if test="${fn:contains(jobs,'개발')}">checked</c:if>>개발 &emsp;
			   <input type="checkbox" name="job" value="비서"
			   <c:if test="${fn:contains(jobs,'비서')}">checked</c:if>>비서 &emsp;
			   <input type="checkbox" name="job" value="운용"
			   <c:if test="${fn:contains(jobs,'운용')}">checked</c:if>>운용 &emsp;
		<input type="submit" value="전송">
	</form>
<hr>
이름 : ${param.name}<br>
입사일 : ${param.hiredate}<br>
급여 : ${param.salary}<br>
담당업무 : <c:forEach items="${paramValues.job}" var="j">${j}&emsp;</c:forEach>
<hr>
<h3>입사일을 yyyy년 MM월 dd일 E요일의 형태로 출력하고, 급여, 연봉을 세자리마다 ,로 넣어서 출력하기</h3>
이름 : ${param.name}<br>

<c:catch var="dateException">
<fmt:parseDate value="${param.hiredate}" pattern="yyyy-MM-dd" var="hiredate"/>
</c:catch>
입사일 : <c:if test="${dateException==null}">
			<fmt:formatDate value="${hiredate}" pattern="yyyy년 MM월 dd일 E요일"/><br>
		 </c:if>
		 <c:if test="${dateException != null}">
		 	입사일은 yyyy-MM-dd 형식으로 입력하세요<br>
		 </c:if>
급여 : <fmt:formatNumber value="${param.salary}" type="currency"/><br>
연봉 : <fmt:formatNumber value="${param.salary * 12}" type="currency"/><br>
</body>
</html>