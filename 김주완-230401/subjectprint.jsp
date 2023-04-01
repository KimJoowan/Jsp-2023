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
	 	int Kor  = Integer.parseInt(request.getParameter("Kor"));
		int Eng  = Integer.parseInt(request.getParameter("Eng"));
		int Math = Integer.parseInt(request.getParameter("Math"));
		int Sum = Kor + Eng + Math;
		out.print("국어 : "+Kor+"점<br>");
		out.print("영어 : "+Eng+"점<br>");
		out.print("수학 : "+Math+"점<br>");
		out.print("총점 : "+Sum+"점<br>");
		out.print("평균 : "+String.format("%.2f",Sum/3.0)+"점<br>");

	%>
</body>
</html>