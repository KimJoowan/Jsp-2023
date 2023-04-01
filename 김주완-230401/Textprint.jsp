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
  	String Title = request.getParameter("Title");
  	String WritingText = request.getParameter("WritingText");
  	
  	out.print(" 제목 | "+Title+"<hr><br>"); 
  	out.print(WritingText+"<br>"); 
  %>
</body>
</html>