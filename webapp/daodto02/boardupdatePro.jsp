s<%@page import="java.sql.Date"%>
<%@page import="dit.cs.Boarddto"%>
<%@page import="dit.cs.Boarddao"%>
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

	Boarddao dao = new Boarddao();
	
	String getSUBJECT = request.getParameter("getSUBJECT");
	String getCONTENT = request.getParameter("getCONTENT");
	
	LocalDate currentDate = LocalDate.now();
	Date REGDATE = Date.valueOf(currentDate);
	
	int getBCODE = Integer.parseInt(request.getParameter("Code"));
	
	Boarddto dto = new Boarddto(getSUBJECT,getCONTENT,REGDATE,getBCODE);
	dao.update(dto);

%>


	<script>
		let ans = alert("변경되었습니다!");
		if (!ans){
			location.href='boardList.jsp';
		}
	</script>
</body>
</html>