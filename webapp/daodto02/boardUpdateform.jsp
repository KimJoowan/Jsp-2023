<%@page import="dit.cs.Boarddao"%>
<%@page import="dit.cs.Boarddto"%>

<% 
/*==================================================================
작성자 : DIT
작성일 : 2023. 5. 23.
프로그래밍 기능 :

===================================================================*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int getBCODE =  Integer.parseInt(request.getParameter("dto.getBCODE()"));
	Boarddao dao = new Boarddao();
	Boarddto dto = new Boarddto();
	dto = dao.getOne(getBCODE);

%>        
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 정보 변경</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<br>
		<h2 class="text-center font-weight-bold">게시판 정보 변경</h2>
		<hr/>
		<form action="boardupdatePro.jsp" method="post">
		<div class="form-group">
	      <label for="Code">SUBJECT:</label>
	      <input type="text" class="form-control" id="SUBJECT" name="Code" value="<%=dto.getBCODE()%>">
	    </div>
		 <div class="form-group">
	      <label for="SUBJECT">SUBJECT:</label>
	      <input type="text" class="form-control" id="SUBJECT" name="SUBJECT" value="<%=dto.getSUBJECT()%>">
	    </div>
	    <div class="form-group">
	      <label for="name">CONTENT:</label>
	      <input type="text" class="form-control" id="CONTENT" name="CONTENT" value="<%=dto.getCONTENT()%>">
	    </div>
	    <br>
	    <div class="text-center">
	    			<input type="submit" value="변경" class="btn btn-secondary">  
					<input type="button" value="삭제" class="btn btn-secondary" onclick="location.href='delete.jsp?id=<%=getBCODE%>'">
					<input type="button" value="목록" class="btn btn-secondary" onclick="location.href='list.jsp'">
			</div>
		</form>
	</div>
</body>
</html>