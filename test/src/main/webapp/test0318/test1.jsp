<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int[] arr = new int[10];
for (int i = 0; i < arr.length; i++) {
	arr[i] = (int) Math.floor((Math.random() * 99));
}
String result = "";
for (int i = 0; i < arr.length; i++) {
	result += (i == 0 ? "[ " : "") + arr[i] + ((i == arr.length - 1) ? " ]" : ", ");
}
out.print(result);
%>