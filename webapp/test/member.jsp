<%@page import="java.awt.Font"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
   <h1> 신상정보 입력품</h1>	
   <form action="insert.jsp" method="post">
  		학번 : <input type="text" name="number"><br>
  	
  		이름 : <input type="text" name="name"><br>
  	
  		학년 : <input type="radio" name="year" value ="1">1학년
  			  <input type="radio" name="year" value ="2">2학년<br>
  	
  	선택과목 : 
  	<select name="Subject">
  		<option value="java">java</option>
  		<option value="Python">Python</option>
  		<option value="jsp">jsp</option>
  		<option value="c">c</option>
  		<option value="JavaScript">JavaScript</option>
  		
  	</select>
  		<br><button type="submit" name="input" value="입력">선택완료
  	</form>
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  
      
  
  
</body>
</html>