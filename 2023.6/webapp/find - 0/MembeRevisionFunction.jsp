<%@page import="dit.cs.Logindto"%>
<%@page import="dit.cs.Logindao"%>
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
	String youid = (String)session.getAttribute ("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	
	Logindto dto = new Logindto(youid,name,pwd,phone,email);
	Logindao dao = new Logindao();
	dao.update(dto);
	response.sendRedirect("main.jsp");
 
%>
</body>
</html>