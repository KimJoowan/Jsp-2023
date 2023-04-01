<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
  <form action="Textprint.jsp" method="post">
  	<% out.println("게시판 글쓰기"+"<br>"); %>
  	
  	제목: <input type="text"name="Title"><br><hr>
  	글: <input type="text"name="WritingText"><br>
  	
  	<input type="submit" type="확인">
  	
  </form>
</body>
</html>