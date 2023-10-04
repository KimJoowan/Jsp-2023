<%@ page import="dit.cs.Logindto" %>
<%@ page import="dit.cs.Logindao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
/*==================================================================
작성자 : DIT
작성일 : 2023. 6. 7.
프로그래밍 기능 : 로그인 기능
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
  	String pwd = request.getParameter("pwd");
  
  	Logindto dto = new Logindto(id, pwd);
  	Logindao dao = new Logindao();
  
  	String value = dao.Login(dto);
  	
  	if(value.equals("Ture")){
  	    session.setAttribute("id", id);
  	    response.sendRedirect("main.jsp");
  	}else{
  	    response.sendRedirect("Login.jsp");
  	}
  
%>
	
  	
  
</body>
</html>
