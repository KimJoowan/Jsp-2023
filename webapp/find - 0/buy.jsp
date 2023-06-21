<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ProductName = request.getParameter("ProductName");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-md bg-dark navbar-dark"> 
  <div class="collapse navbar-collapse justify-content-start align-items-center" id="collapsibleNavbar">
  <a class="navbar-brand" href="main.jsp">Navbar</a>
    <ul class="navbar-nav ml-auto">
      <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post" style="margin-right: 25px ">
      	<input class="form-control mr-sm-2" type="search" placeholder="검색할 내용" aria-label="Search" name="ProductName">
      	<select class="form-control mr-sm-2">
      		<option class="form-control mr-sm-2">전체</option>
      		<option class="form-control mr-sm-2">Null</option>
      		<option class="form-control mr-sm-2">Null</option>
      	</select>      	
      	<input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="검색" >
       </form>
       
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">게시판</a>
      </li>
      
      <li class="nav-item dropdown ml-auto">
        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">메뉴</a>
        <div class="dropdown-menu dropdown-menu-right">
          <a class="dropdown-item" href="Logout.jsp">로그 아웃</a>
          <a class="dropdown-item" href="MembeRevision.jsp">회원정보수정</a>
          <a class="dropdown-item" href="MemberOut.jsp">탈퇴</a>
        </div>
      </li>    
    </ul>
  </div>  
</nav>
	
<div class="container" id="count">
<h2 style="margin-top:20px ">구매</h2>
  <form action="buyFunction.jsp?ProductName=<%=ProductName%>" class="was-validated" method="post">
    <div class="form-group">
      <label for="id">구매수량</label>
      <input type="number" class="form-control" id="id" placeholder="구매수량" name="count" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">이 필드에 입력하십시오.</div>
    </div>
    <input type="submit" value="구매" class="btn btn-primary">
  </form>
</div>

</body>
</html>