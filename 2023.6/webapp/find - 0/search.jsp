<%@page import="java.util.ArrayList"%>
<%@page import="dit.cs.Productdto"%>
<%@page import="dit.cs.Productdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String ProductName = request.getParameter("ProductName");
	Productdao dao = new Productdao();
	ArrayList<Productdto> dtos = dao.list(ProductName);
	
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <style type="text/css">
  h2{
  	margin: 20px
  
  
  
  } 
  </style>
</head>
<body>
<nav class="navbar navbar-expand-md bg-dark navbar-dark"> 
  <div class="collapse navbar-collapse justify-content-start align-items-center" id="collapsibleNavbar">
  <a class="navbar-brand" href="main.jsp">Navbar</a>
    <ul class="navbar-nav ml-auto">
      <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post" style="margin-right: 25px ">
      	<input class="form-control mr-sm-2" type="search" placeholder="검색할 내용" aria-label="Search" name="ProductName">
      	<select class="form-control mr-sm-2">
      		<option class="form-control mr-sm-2"></option>
      		<option class="form-control mr-sm-2"></option>
      		<option class="form-control mr-sm-2"></option>
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
<div class="container">
  <h2>검색결과</h2>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>재품이름</th>
        <th>가격</th>
      </tr>
    </thead>
    <tbody>
    <%for(Productdto  dto: dtos){%>
      <tr>
        <td><a href="buy.jsp?ProductName=<%=dto.getProductName()%>"><%=dto.getProductName()%></td>
        <td><%=dto.getPrice()%></td>
      </tr>
   	<%}%>   
    </tbody>
  </table>
</div>
</body>
</html>