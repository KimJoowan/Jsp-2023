<%@page import="dit.cs.Buydao"%>
<%@page import="dit.cs.Buydto"%>
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
	
	String id = (String)session.getAttribute("id");
	String ProductName = request.getParameter("ProductName");
	int count = Integer.parseInt(request.getParameter("count"));
	
	Buydto dto = new Buydto(ProductName,count,id);
	Buydao dao = new Buydao();
	dao.buy(dto);
	
	response.sendRedirect("main.jsp");
	
	
	
%>
</body>
</html>