<%@page import="dit.cs.Logindto"%>
<%@page import="dit.cs.Logindao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute ("id");
	Logindao dao = new Logindao();
	Logindto dto = new Logindto();
	dto = dao.getOne(id);

%>

<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> 
<style>
	body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}	
</style>
</head>
<!--=========================================================================================================================================-->
<body>
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a class="navbar-brand" href="main.jsp">Navbar</a>
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
        	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">Dropdown link</a>
        	<div class="dropdown-menu dropdown-menu-right">
          		<a class="dropdown-item" href="Logout.jsp">로그 아웃</a>
          		<a class="dropdown-item" href="#">정보 수정</a>
          		<a class="dropdown-item" href="MemberOut.jsp">탈퇴</a>
        	</div>
      </li>
    </ul>
  </div> 
</nav>	
  <!--=========================================================================================================================================-->
  
  <form action="MembeRevisionFunction.jsp" style="border:1px solid #ccc" method="post">
  <div class="container">
    <h1>정보수정</h1>
    <hr>

	<label for="psw"><b>이름</b></label>
    <input type="text" placeholder="이름" name="name" value="<%=dto.getName()%>">

    <label for="psw-repeat"><b>비밀번호</b></label>
    <input type="text" placeholder="비밀번호" name="pwd" value="<%=dto.getPwd()%>">
    
    <label for="psw-repeat"><b>폰번호</b></label>
    <input type="text" placeholder="폰번호" name="phone" value="<%=dto.getPhone()%>">
    
    <label for="psw-repeat"><b>이몌일</b></label>
    <input type="text" placeholder="이몌일" name="email" value="<%=dto.getEmail()%>">
    
    <div class="clearfix">
    	<button type="submit" class="signupbtn">수정</button>
      	<button type="button" class="cancelbtn"><a href="main.jsp">취소</a></button>
    </div>
  </div>
</form>

</body>
</html>