<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page import="java.io.IOException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
1. 브라우저에서 수출입은행 사이트 방문하기
    : 업무안내 > 환율정보 선택하기
      환율정보 URL : https://www.koreaexim.go.kr/wg/HPHKWG057M01

      웹스크래핑(크롤링) : 인터넷에서 제공되는 정보를 가져오기
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수출입은행 환율 정보 조회</title>
    <style type="text/css">
        table {border-collapse: collapse;}
        table, td {border : 2px solid grey;}
    </style>
</head>
<body>
<%
    String url = "https://www.koreaexim.go.kr/wg/HPHKWG057M01";
    String line = "";
    Document doc = null;
    try {
        doc =Jsoup.connect(url).get();
        Elements e1 = doc.select("table"); //table 태그. .class 속성값, #id 속성값
        for(Element e2 : e1){
        	// e2 : table 태그 1개
        	// e2.html() : html text 내용
            String temp = e2.html();
            System.out.println(temp);
            line += temp;
        }
    }catch(IOException e){
    	e.printStackTrace();
    }
%>
<table><%=line %></table>
</body>
</html>