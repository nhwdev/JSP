<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 사진등록</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
	<table>
		<tr><td><img id="preview" src=""></td></tr>
		<tr><td><form action="picture" method="post" enctype="multipart/form-data">
				<%--
				MIME 타입 : 문서의 형식 지정. 문서유형/세부종류
					img/* : 이미지 형식 / 모든 이미지 : img/jpec, img/gif, img/png,...
					accept="img/*" : 업로드 시 이미지 형식의 파일만 가능
				--%>
				<input type="file" name="picture" id="imageFile" accept="img/*">
				<input type="submit" value="사진등록"></form></td></tr>
	</table>
	<script type="text/javascript">
		let imageFile = document.querySelector('#imageFile'); // input type="file" 태그
		let preview = document.querySelector('#preview'); // img 태그
		// 미리보기 구현
		// change 이벤트 : 선택된 파일이 변경된 경우 발생되는 이벤트
		imageFile.addEventListener('change', function(e) { // 이벤트 핸들러
			let get_file = e.target.files; // 이벤트 소스가 선택한 파일들 배열
			let reader = new FileReader(); // 데이터 스트림.
			// 직접 호출
			reader.onload = (function(img) {
				return function(e) {
					img.src = e.target.result; // file 태그에서 선택된 파일의 이름
				}
			})(preview);
			if (get_file) {
				reader.readAsDataURL(get_file[0]);
			}
		});
	</script>
</body>
</html>