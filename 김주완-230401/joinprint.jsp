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
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String Gender = request.getParameter("Gender");
		String day = request.getParameter("day");
		out.println("id : "+id+"<br>");
		out.println("password : "+password+"<br>");
		out.println("name : "+name+"<br>");
		out.println("email : "+email+"<br>");
		out.println("Gender : "+Gender+"<br>");
		out.println("day : "+day+"<br>");

	
	%>
  
</body>
</html>