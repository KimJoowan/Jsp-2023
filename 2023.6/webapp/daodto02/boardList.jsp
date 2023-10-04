<% 
/*==================================================================
작성자 : DIT
작성일 : 2023. 5. 23.
프로그래밍 기능 :

===================================================================*/
%>
<%@page import="dit.cs.Boarddao"%>
<%@page import="dit.cs.Boarddto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	Boarddao dao = new Boarddao();
	ArrayList<Boarddto> dtos = dao.list();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 목록</title>
	<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<br>
		<h1 class="text-center font-weight-bold">사용자 정보</h1>
		<br>
		<table class="table table-hover">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
			</tr>
			<%
				for(Boarddto dto: dtos){
			%>	
			<tr>
				<td><a href="boardUpdateform.jsp?BCODE=<%=dto.getBCODE()%>"><%=dto.getBCODE()%></a></td>
				<td><%=dto.getSUBJECT()%></td>
				<td><%=dto.getWRITER()%></td>
				<td><%=dto.getREGDATE()%></td>
			</tr>
				<%}%>
		</table>
	</div>
</body>
</html>