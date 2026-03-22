<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--
<sitemesh:write property="title" /> : title 태그의 내용 
<sitemesh:write property="head" /> : head 태그의 내용. title 태그의 내용은 제외
<sitemesh:write property='body' />
--%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><sitemesh:write property="title" /></title>
<link rel="stylesheet" href="${path}/css/main.css">
<sitemesh:write property="head" />
</head>
<body>
	<table>
		<tr><td id="getimg"></td>
			<td colspan="2" style="text-align: right">
				<c:if test="${empty sessionScope.login}">
					<a href="${path}/member/loginForm">로그인</a>
					<a href="${path}/member/joinForm">회원가입</a>
				</c:if>
				<c:if test="${!empty sessionScope.login}">
					${login}님.<a href="${path}/member/logout">로그아웃</a>
				</c:if></td></tr>
		<tr><td width="15%" valign="top"><a href="${path}/member/main">회원관리</a><br>
		<div id="exchange"></div></td>
			<td colspan="2" style="text-align: left; vertical-align: top">
				<sitemesh:write property='body'/>
			</td></tr>
		<tr><td colspan="3"><div>
					<span id="si">
						<select name="si"  onchange="getText('si')">
							<option value="">시도를 선택하세요</option>
						</select>
					</span>
					<sapn id="gu">
						<select name="gu" onchange="getText('gu')">
							<option value="">구군을 선택하세요</option>
						</select>
					</sapn>
					<span id="dong"><select name="dong">
							<option value="">동리를 선택하세요</option>
						</select></span>
				</div></td></tr>
		<tr><td colspan="3">MVC Model2</td></tr>
	</table>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function (){ // 화면이 로드가 완료되면
			$.ajax({
				url: "${path}/ajax/logo",
				success: function(data) {
					$("#getimg").html(data);
				}
			})
			exchangeRate();
			$.ajax({
				url : "${path}/ajax/select",
				success : function(data) {
					// ["서울특별시", "부산광역시", ... "제주특별자치도"]
					let arr = JSON.parse(data)
					$.each(arr,function(i, item) {
						$("select[name=si]").append(function(){
							return "<option>" + item + "</option>"
						})
					})
				},
				error : function(e) {
					alert("서버오류: " + e.status)
				}
			})
		})
		function getText(name) {
			let city = $("select[name='si']").val()
			let gun = $("select[name='gu']").val()
			let disname
			let toptext='구군을 선택하세요'
			let params = ''
			if(name == 'si') {
				params = "si=" + city.trim()
				disname = "gu"
			} else if (name == 'gu') {
				params = "si=" + city.trim() + "&gu=" + gun.trim()
				disname = "dong"
				toptext = '동리를 선택하세요'
			} else {
				return
			}
			console.log(params)
			$.ajax({
				url : "${path}/ajax/select",
				type : "POST",
				data:params,
				success : function(data){
					let arr = JSON.parse(data)
					$("select[name="+disname+"] option").remove()
					$("select[name="+disname+"]").append(function(){
						return "<option value=''>"+toptext+"</option>"
					})
					$.each(arr,function(i,item){
						$("select[name="+disname+"]").append(function(){
							return "<option>" + item + "</option>"
						})
					})
				},
				error : function(e) {
					alert("서버오류: " + e.status)
				}
			})
		}
		function exchangeRate() {
			$.ajax("${path}/ajax/exchange", {
				success : function(data) {
					$("#exchange").html(data);
				},
				error : function(e) {
					alert("환율 조회 오류: " + e.status);
				}
			})
		}
	</script>
</body>
</html>