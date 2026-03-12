<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
/*
* opener : 현재 페이지를 팝업한 윈도우. joinForm.jsp, updateForm.jsp 페이지 의미
*/
img = opener.document.getElementById("pic"); // img 태그
//현재폴더/picture/이미지이름. opener 페이지에 업로드된 이미지가 보여짐
img.src = "../picture/${fname}";
// opner의 문서 중 name="f" 하위에 name="picture"인 태그의 value 값에 파일이름 저장
 //<input type="hideen" name="picture" value="파일이름"> → DB저장에 사용→
opener.document.f.picture.value="${fname}";
self.close(); // 현재페이지 close
</script>