<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadResultPage</title>
</head>
<body>
	<%
	String realPath = application.getRealPath("upload"); // 웹어플리케이션폴더/upload 폴더로 설정 →업로드되는 폴더
	File dir = new File(realPath);
	if (!dir.exists())
		dir.mkdirs(); // 폴더 생성. 업로드되는 폴더 생성
	// MultipartRequst : upload 된 파일을 처리하기 위한 클래스. 객체 생성시 파일 업로드 완료
	MultipartRequest multi = new MultipartRequest( // (요청정보, 폴더, 최대 크기, 인코딩, 중복이름);
			request, // 요청정보. 파라미터정보 + 파일정보(파일이름, 파일내용, ...), request.getParameter(파라미터명) 사용불가/ 
			realPath, // 업로드 되는 폴더 설정
			1024 * 1024 * 10, // 10M → 업로드 가능 파일의 최대 크기 설정→
			"UTF-8", // 인코딩 설정
			new DefaultFileRenamePolicy() // 파일의 이름이 중복된 경우 이름을 변경함 → 파일 뒤에 숫자가 추가
			);
	String uploader = multi.getParameter("uploader"); // 파라미터값 조회
	String fileSystemName = multi.getFilesystemName("filename"); // 업로드된 파일 이름
	String originName = multi.getOriginalFileName("filename"); // 원래 파일 이름
	// multi.getFile("") : 업로드 완료된 파일의 정보를 File 객체로 리턴
	File file = multi.getFile("filename");
	String name = file.getName(); // 파일 이름
	String parent = file.getParent(); // 폴더 이름
	String lastModified = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified());
	/*
		file.length() : 파일의 크기. 바이트 단위
		file.length() / 1024 : KB 단위
		
		#,##0 : 패턴 설정. 숫자를 출력시 세자리마다 , 출력되도록 설정
	*/
	String size = new DecimalFormat("#,##0").format(file.length() / 1024 + (file.length() % 1024 == 0 ? 0 : 1));
	%>
	<ul style="list-style-type: circle; font-size: 24px">
		<li>작성자:<%=uploader%></li>
		<li>원본 업로드 파일명: <%=originName%></li>
		<li>저장된 업로드 파일명: <%=fileSystemName%></li>
		<li>파일명: <%=name%></li>
		<li>업로드 폴더 위치: <%=parent%></li>
		<li>최종 수정일: <%=lastModified%></li>
		<li>파일 크기: <%=size%>KB</li>
	</ul>
	<img src="/jspstudy/upload/<%=fileSystemName%>"> %>
</body>
</html>