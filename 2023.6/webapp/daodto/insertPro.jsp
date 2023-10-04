<%@page import="dit.cs.Logindto"%>
<%@page import="dit.cs.Logindao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%	
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");

	Logindto dto = new Logindto(id,name,pwd);
	
	Logindao dao = new Logindao();
	
	dao.insertLogin(dto);
	
	response.sendRedirect("list.jsp");
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