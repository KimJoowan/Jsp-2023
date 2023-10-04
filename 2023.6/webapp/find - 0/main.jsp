<% 
/*==================================================================
작성자 : DIT
작성일 : 2023. 6. 7.
프로그래밍 기능 : 로그인후 화면
===================================================================*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> 
</head>
<!--==================================================================================================================================-->
<body>
<nav class="navbar navbar-expand-md bg-dark navbar-dark"> 
  <div class="collapse navbar-collapse justify-content-start align-items-center" id="collapsibleNavbar">
  <a class="navbar-brand" href="#">Navbar</a>
    <ul class="navbar-nav ml-auto">
      <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post" style="margin-right: 25px ">
      	<input class="form-control mr-sm-2" type="text" placeholder="검색할 내용" aria-label="Search" name="ProductName">
      	<select class="form-control mr-sm-2" >
      		<option class="form-control mr-sm-2">전체
      		<option class="form-control mr-sm-2">Null
      		<option class="form-control mr-sm-2">Null
      	</select>      	
      	<input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="검색" >
       </form>
       
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="buyList.jsp">구매내역</a>
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
</body>
</html>

  