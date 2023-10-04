<%@page import="dit.cs.Logindao"%>
<%@page import="dit.cs.Logindto"%>
<% 
/*==================================================================
작성자 : DIT
작성일 : 2023. 6. 7.
프로그래밍 기능 : 회원가입 

===================================================================*/
%>
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
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String gender = request.getParameter("gender");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	Logindto dto = new Logindto(id,name,pwd,gender,phone,email);
	
	Logindao dao = new Logindao();
	
	dao.insertLogin(dto);
	session.setAttribute("id",id);
	response.sendRedirect("main.jsp");
%>
</body>
</html>