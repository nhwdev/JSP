<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload 화면</title>
</head>
<body>
	<%--
	 enctype="multipart/form-data" : 파일 업로드시 선택된 파일의 내용도 함께 서버로 전송하도록 설정
	 method="post" 필수
	  => 파일 업로드시 : <form enctype="multipart/form-data" method="post" ...>
	  
	 ex01_upload.jsp 페이지에는 파라미터값 + 파일정보(이름, 내용) 전달됨. => request 객체 사용 불가. 다른 유틸리티가 필요 (cos.jar)
	  
	--%>
	<form id="rm_upload" action="ex01_upload.jsp" method="post"
		enctype="multipart/form-data">
		<div>
			<label for="uploader">작성자</label><input type="text" id="uploader"
				name="uploader">
		</div>
		<div>
			<label for="filename">파일첨부 </label><input type="file" id="filename"
				name="filename">
		</div>
		<%-- <button> 태그의 기본 타입은 submit --%>
		<div>
			<button>첨부하기</button>
			<input type="reset" value="다시작성">
		</div>
	</form>
</body>
</html>