<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<%
	// 1. JDBC Drvier 클래스 로드
	Class.forName("org.mariadb.jdbc.Driver");
	// 2. DataBase(MariaDB)에 연결
	// DriverManager.getConnection("jdbc:mariaDB://DB서버IP주소:포트번호/DB이름","사용자ID","PW");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/gdjdb", "gduser", "4986");
	// 3. SQL구문을 전달 : statement → PreparedStatement 
	PreparedStatement pstmt = conn.prepareStatement("select * from professor");
	// 4. ResultSet pstmt.excuteQuery() : select 문장을 실행.
	// int		 pstmt.executUpdate(): select 문장 외의 구문 실행. 변경된 레코드의 건수
	ResultSet rs = pstmt.executeQuery();
	// ResultSetMetaData : select 구문을 실행한 결과 정보
	ResultSetMetaData rsmt = rs.getMetaData();
	%>
	<table>
		<tr>
			<%-- 
			 컬럼명 출력
			 rsmt.getColumnCount() : 조회된 컬럼의 갯수
			 rsmt.getColumnName(i) : i 번째의 컬럼 이름. i 는 1부터 시작
			--%>
			<%
			for (int i = 1; i <= rsmt.getColumnCount(); i++) {
			%>
			<th><%=rsmt.getColumnName(i)%></th>
			<%
			}
			%>
		</tr>
		<%-- 
		 데이터 출력
		 rs.getString(i) : i 번째 조회된 데이터를 리턴. i 는 1부터 시작 
		--%>
		<%
		while (rs.next()) {
		%><tr>
			<%
			for (int i = 1; i <= rsmt.getColumnCount(); i++) {
			%>
			<td><%=rs.getString(i)%></td>
			<%
			}
			%>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>