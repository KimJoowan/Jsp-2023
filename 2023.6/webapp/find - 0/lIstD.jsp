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
	String ProductName = request.getParameter("ProductName");
	int counts = Integer.parseInt(request.getParameter("counts"));
	
	Buydto dto = new Buydto(ProductName,counts);
	Buydao dao = new Buydao();
	dao.deletList(dto);
	
	response.sendRedirect("main.jsp");
	
	
	
	%>
</body>
</html>