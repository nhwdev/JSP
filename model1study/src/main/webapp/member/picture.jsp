<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
1. request 객체로 이미지 업로드 불가 -> cos.jar (request 는 이미지 형식을 못읽음)
2. 이미지 업로드 폴더 : 현재폴더 / picture 설정
3. opener 화면에 이미지 볼 수 있도록 결과 전달 => javascript
4. 현재 화면 close 하기 => javascript
--%>
<%
// application.getRealPath("/") + "member/picture/": 업로드 파일의 위치
String path = application.getRealPath("/") + "member/picture/";
String fname = null;
File f = new File(path);
if (!f.exists())
	f.mkdirs(); // 없으면 업로드 폴더 생성
// 업로드 완료. 같은 이름의 이미지가 업로드 시 이름 변경 안됨. 업로드 파일의 이름 = 원본 파일의 이름이 같다.
MultipartRequest multi = new MultipartRequest(
		request, // 이미지 파일 정보 저장
		path, // 업로드 파일의 위치
		10 * 1024 * 1024, // 10M. 업로드 파일의 최대 크기
		"UTF-8" // 인코딩 설정
);
fname = multi.getFilesystemName("picture"); // 파일의 이름
%>
<script>
/*
* opener : 현재 페이지를 팝업한 윈도우. joinForm.jsp, updateForm.jsp 페이지 의미
*/
img = opener.document.getElementById("pic"); // img 태그
//현재폴더/picture/이미지이름. opener 페이지에 업로드된 이미지가 보여짐
img.src = "picture/<%=fname%>";
// opner의 문서 중 name="f" 하위에 name="picture"인 태그의 value 값에 파일이름 저장
 //<input type="hideen" name="picture" value="파일이름"> → DB저장에 사용→
opener.document.f.picture.value="<%=fname%>";
self.close(); // 현재페이지 close
</script>