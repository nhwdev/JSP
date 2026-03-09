<%@page import="guestBook.BookDao"%>
<%@page import="guestBook.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.getParameter("no");
new BookDao().delete(request.getParameter("no"));
response.sendRedirect("bookList.jsp");
%>