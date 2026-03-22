<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.jsoup.Jsoup" %>
<%@page import="org.jsoup.select.Elements" %>
<%@page import="org.jsoup.nodes.Element" %>
<%@page import="java.io.IOException" %>
<%@page import="org.jsoup.nodes.Document" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Arrays" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style type="text/css">
        table {
            border-collapse: collapse;
        }

        table, td {
            border: 2px solid grey;
        }
    </style>
</head>
<body>
<%
    String url = "https://www.koreaexim.go.kr/wg/HPHKWG057M01";
    String line = "";
    Document doc = null; // 접속한 인터넷페이지의 html 문서 객체
    // trlist : List를 요소로 가지고 있는 List 객체
    List<List<String>> trlist = new ArrayList<List<String>>();
    List<String> title = Arrays.asList("전신환받으실때", "전신환보내실때", "매매기준율", "장부가격", "중개매매기준율", "중개장부가격");
    try {
        doc = Jsoup.connect(url).get();
        // Elements : Element를 여러개 가지고 있는 객체
        Elements trs = doc.select("tr"); // 모든 tr 객체들
        for (Element tr : trs) {
            // tr : tr 태그 1개
            List<String> tdlist = new ArrayList<String>(); // [AED, 아랍에미리트 디르함, 400.51, 408.6, 404.56, ...]
            Elements tds = tr.select("td"); // td 태그들. 하나의 tr 태그에 속한 td 태그들
            for (Element td : tds) {
                // td : td 태그 1개
                tdlist.add(td.html()); // td.html() : td태그 내부의 값. 통화코드, 통화명, 환율데이터
            }
            trlist.add(tdlist);
        }
    } catch (IOException e) {
        e.printStackTrace();
    }
    pageContext.setAttribute("trlist", trlist); // el, jstl 사용하도록 속성 등록
    pageContext.setAttribute("title", title); //el, jstl 사용하도록 속성 등록
%>
<table>
    <c:forEach items="${trlist}" var="tdlist">
        <c:forEach items="${tdlist}" var="td" varStatus="stat">
            <c:choose>
                <c:when test="${stat.index % 8 == 0}"> <%-- 1번째 td 태그의 내용 : 통화코드 --%>
                    <tr><td rowspan="6">${td}</td>
                </c:when>
                <c:when test="${stat.index % 8 == 1}"> <%-- 2번째 td 태그의 내용 : 통화명 --%>
                    <td rowspan="6">${td}</td>
                </c:when>
                <c:when test="${stat.index % 8 == 2}"> <%-- 3번째 td 태그의 내용 : 전신환받으실 때 환율 데이터 --%>
                    <td>${title[0]}</td>
                    <td>${td}</td></tr>
                </c:when>
                <c:otherwise>
                    <tr><td>${title[stat.index - 2]}</td>
                        <td>${td}</td></tr>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:forEach>
</table>
</body>
</html>