<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
  	<form action="joinprint.jsp" method="get">
  	 id	<input type="text" name="id"><br>
  	 
  비밀번호 <input type="password" name="password"><br>
  
  	이름  <input type="text" name="name"><br>
  	
  	이메일 <input type="text" name="email"><br>
  		
  	성별 	<select name="Gender"><br>
  			<option value="남자">남자
  			<option value="여자">여자  
  				
  		</select><br>
  		
  생년월일 <input type="date" name="day"><br>
  		
  		<input type="submit" value="회원가입">

  	</form>
</body>
</html>