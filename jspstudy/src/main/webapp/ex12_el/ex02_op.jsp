<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연산자</title>
</head>
<body>
<h3>EL에서 연산자 사용하기</h3>
	\${5 + 7} = ${ 5+ 7}<br>
	\${8 - 3} = ${8 - 3}<br>
	\${8 * 3} = ${8 * 3}<br>
	
	\${8 / 3} = ${8 / 3}<br>
	\${8 div 3} = ${8 div 3}<br>
	
	\${8 % 3}=${8 % 3}<br>
	\${8 mod 3}=${8 mod 3}<br>

	\${8 == 3}=${8 == 3}<br>
	\${8 eq 3}=${8 eq 3}<br>
	
	\${10 != 9}=${10 != 9}<br>
	\${10 ne 9}=${10 ne 9}<br>
	
	\${10 > 9}=${10 > 9}<br>
	\${10 gt 9}=${10 gt 9}<br>
	
	\${10 >= 9}=${10 >= 9}<br>
	\${10 ge 9}=${10 ge 9}<br>
	
	\${10 < 9}=${10 < 9}<br>
	\${10 lt 9}=${10 lt 9}<br>
	
	\${10 <= 9}=${10 <= 9}<br>
	\${10 le 9}=${10 le 9}<br>
	
	\${5 + 4 == 8 ? 8 : 10}=${5 + 4 == 8 ? 8 : 10}<br>

<h3>EL에서 상수값 출력하기</h3>
	\${10} = ${10}<br>
	\${'test'} = ${'test'}<br>
	\${"test;"} = ${"test"}<br>

<h3>empty 연산자 사용하기</h3>
	\${empty name} = ${empty name}<br>
	<%request.setAttribute("test","");%>
	\${empty test} = ${empty test}<br>
	\${test == null} = ${test == null}<br>

</body>
</html>