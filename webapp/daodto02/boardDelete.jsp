<%@page import="dit.cs.Boarddao"%>
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
	int BCODE = Integer.parseInt(request.getParameter("BCODE"));
  	Boarddao dao = new Boarddao();
  	dao.Deletes(BCODE);
%>
	<script>
		let ans = alert("변경되었습니다!");
		if (!ans){
			location.href='boardList.jsp';
		}
	</script>
</body>
</html>