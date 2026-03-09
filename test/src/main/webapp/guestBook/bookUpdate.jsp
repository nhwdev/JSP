<%@page import="guestBook.BookDao"%>
<%@page import="guestBook.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
Book book = new Book();
book.setNo(Integer.parseInt(request.getParameter("no")));
book.setWriter(request.getParameter("writer"));
book.setTitle(request.getParameter("title"));
book.setContent(request.getParameter("content"));
new BookDao().update(book);
response.sendRedirect("bookInfo.jsp?no=" + book.getNo());
%>