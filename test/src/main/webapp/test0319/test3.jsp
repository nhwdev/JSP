<%@page import="java.io.IOException" %>
<%@page import="org.jsoup.nodes.Element" %>
<%@page import="org.jsoup.select.Elements" %>
<%@page import="org.jsoup.Jsoup" %>
<%@page import="java.util.Arrays" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="org.jsoup.nodes.Document" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- /webapp/test3.jsp
 수출입은행 환율 정보 중 EUR,JPY(100), CNH,USD 통화만 ex02_exchange.jsp 작성한 형태로
 출력하기 --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>test3</title>
    <style type="text/css">
        table {
            border-collapse: collapse;
        }
        table, td, th {
            border: 2px solid grey;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<%
    String url = "https://finance.naver.com/marketindex/exchangeList.naver";
    Document doc = null;
    List<List<String>> trlist = new ArrayList<>();
    List<String> title = Arrays.asList("통화명", "매매기준율", "현찰 사실때", "현찰 파실때", "송금 보내실때", "송금 받으실때", "미화환산율");
    try {
        doc = Jsoup.connect(url).get();
        Elements trs = doc.select(".tbl_exchange tbody tr");
        List<String> targets = Arrays.asList("EUR", "JPY", "CNY", "USD");
        for (Element tr : trs) {
            if (targets.stream().anyMatch(tr.select("a").html()::contains)) {
                Elements tds = tr.select("td");
                List<String> tdlist = new ArrayList<>();
                for (Element td : tds) {
                    tdlist.add(td.text());
                }
                trlist.add(tdlist);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    pageContext.setAttribute("trlist", trlist);
    pageContext.setAttribute("title", title);
%>
<table>
    <tr><c:forEach var="title" items="${title}">
        <th>${title}
        </th></c:forEach></tr>
    <c:forEach var="tds" items="${trlist}">
        <tr>
        <c:forEach var="td" items="${tds}">
            <td>${td}</td>
        </c:forEach>
        </tr>
    </c:forEach>
</table>
</body>
</html>