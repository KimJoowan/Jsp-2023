<%@page import="dit.cs.Boarddao"%>
<%@page import="java.sql.Date"%>
<%@page import="dit.cs.Boarddto"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="java.time.*"%>

<% 
/*==================================================================
작성자 : DIT
작성일 : 2023. 5. 23.
프로그래밍 기능 :

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
	String SUBJECT = request.getParameter("SUBJECT");
	String CONTENT = request.getParameter("CONTENT");
	String WRITER = request.getParameter("WRITER");
	
	LocalDate currentDate = LocalDate.now();
	Date REGDATE = Date.valueOf(currentDate);
	
	
	Boarddto dto = new Boarddto(SUBJECT, CONTENT, WRITER, REGDATE);
		
	Boarddao dao = new Boarddao();
		
	dao.insertboaro(dto);
		
	response.sendRedirect("boardList.jsp");
	
%>


</body>
</html>