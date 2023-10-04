<%@page import="dit.cs.Logindao"%>
<%@page import="dit.cs.Logindto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	String id = (String)session.getAttribute ("id");
	session.removeAttribute(id);
	response.sendRedirect("index.jsp");
%>
</body>
</html>