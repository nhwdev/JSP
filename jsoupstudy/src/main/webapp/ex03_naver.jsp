<%@ page import="org.jsoup.nodes.Document"%>
<%@ page import="org.jsoup.Jsoup"%>
<%@ page import="org.jsoup.select.Elements"%>
<%@ page import="org.jsoup.nodes.Element"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String url = "https://finance.naver.com/marketindex/";
String line = "";
Document doc = null;
try {
	doc = Jsoup.connect(url).get();
	Elements hlist = doc.select("div.head_info"); // 환율외
	Elements htitle = doc.select("h3.h_lst");     // 통화코드
	for (int i = 0; i < hlist.size(); i++) {
		Element tag = hlist.get(i);
		Element title = htitle.get(i);
		System.out.println(tag);
		System.out.println(title);
		System.out.println("===================");
		String name = title.selectFirst("span.blind").html();
		out.print(name + ":");
		String value = tag.selectFirst("span.value").html(); // 환율정보
		out.print(value + "&nbsp;&nbsp;");
		String change = tag.selectFirst("span.change").html(); // 변동금액
		out.print(change + "&nbsp;&nbsp;");
		Elements blinds = tag.select("span.blind"); // 원, 하락
		Element blind = blinds.get(blinds.size() - 1); // 하락
		out.print(blind + "<br>");
		double d = 0;
		System.out.println(blind + "================");
		if (blind.toString().trim().contains("하락")) {
	d = Double.parseDouble(change.replace(",", "")) * -1; // 하락금액을 음수 표현
		} else {
	d = Double.parseDouble(change.replace(",", "")); // 상승 금액
		}
		out.print(d + "&nbsp;&nbsp;");
		out.print(blind + "<br>");
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>