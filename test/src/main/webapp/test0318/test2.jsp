<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String data = request.getParameter("data");
    String num = request.getParameter("num");

    int result = 0;
    try {
        int number = Integer.parseInt(num);
        switch (data) {
            case "0":
                for (int i = 0; i < number; i++) {
                    result += i;
                }
                break;
            case "1":
                for (int i = 0; i < number; i += 2) {
                    result += i;
                }
                break;

            case "2":
                for (int i = 1; i < number; i += 2) {
                    result += i;
                }
                break;
        }
        out.print(result);
    } catch (Exception e) {
        out.print("숫자를 입력하세요.");
    }
%>
