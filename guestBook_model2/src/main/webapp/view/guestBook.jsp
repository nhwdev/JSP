<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
   방명록 등록하기
   1. 데이터베이스에 book 테이블 생성하기
   2. bookwrite 에서 book 테이블에 입력된 내용을 등록하고 결과를 화면에 출력하기
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" >
</head>
<body>
<form action="bookWrite" method="post" 
      onsubmit="return inputcheck(this)">
<table><caption>방명록 쓰기</caption>
	<tr><td>방문자</td><td><input type="text" name="writer"></td></tr>
	<tr><td>제목</td><td><input type="text" name="title"></td></tr>
	<tr><td>내용</td>
    <td><textarea rows="5" cols="30" name="content"></textarea></td></tr>
	<tr><td align="center">
    	<input type="submit" value="글쓰기"></td>
    	<td><input type="button" onclick="location.href='bookList'" value="목록 보기"></td></tr>
</table>
</form>
<script type="text/javascript">
   function inputcheck(f) {
       if(f.writer.value == '') {
		   alert("방문자를 입력하세요");
		   f.writer.focus();
		   return false;
       }
       if(f.title.value == '') {
		   alert("제목 입력하세요");
		   f.title.focus();
		   return false;
       }
       if(f.content.value == '') {
		   alert("내용 입력하세요");
		   f.content.focus();
		   return false;
       }
       return true;
   }
</script>
</body>
</html>