<% 
/*==================================================================
작성자 : DIT
작성일 : 2023. 6. 7.
프로그래밍 기능 : 로그인 화면

===================================================================*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <style type="text/css"> 

  h2{
  	margin-top:30px ;
  }
 
  </style>
</head>
<!--=========================================================================================================================================-->
<body>
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
<a class="navbar-brand" href="index.jsp">Navbar</a> 
<div class="collapse navbar-collapse justify-content-start align-items-center" id="collapsibleNavbar"> 
    <ul class="navbar-nav ml-auto">
      	<li class="nav-item">
        	<a class="nav-link" href="#">Link</a>
	  	</li>
	      
      	<li class="nav-item">
        	<a class="nav-link" href="#">Link</a>
      	</li>
      
      	<li class="nav-item">
        	<a class="nav-link" href="#">Link</a>
      	</li>
      
      	<li class="nav-item dropdown ml-auto">
        	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">몌뉴</a>
        		<div class="dropdown-menu dropdown-menu-right">
          			<a class="dropdown-item" href="#">로그인</a>
          			<a class="dropdown-item" href="member.jsp">회원가입</a>
        		</div>
      	</li>
    </ul>
</div>  
</nav>

<div class="container" id="Login">
  <h2>로그인</h2>
  <form action="Login2.jsp" class="was-validated" method="post">
    <div class="form-group">
      <label for="id">아이디:</label>
      <input type="text" class="form-control" id="id" placeholder="이이디" name="id" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">이 필드에 입력하십시오.</div>
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호:</label>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="pwd" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">이 필드에 입력하십시오.</div>
    </div>
    <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember" required> 동의
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">계속하려면 이 확인란을 선택합니다.</div>
      </label>
    </div>
    <input type="submit" value="로그인" class="btn btn-primary">
  </form>
</div>

</body>
</html>