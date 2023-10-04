<%@page import="dit.cs.Productdto"%>
<%@page import="dit.cs.Productdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String item = request.getParameter("item");
	String ProductName = request.getParameter("ProductName");
	Productdto dto = new Productdto();
	Productdao dao = new Productdao();
	dto = dao.list(ProductName, item);















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
  <a class="navbar-brand" href="#">Navbar</a>
  <div class="collapse navbar-collapse justify-content-start align-items-center" id="collapsibleNavbar"> <!-- Modified collapsible content -->
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
          		<a class="dropdown-item" href="Login.jsp">로그인</a>
          		<a class="dropdown-item" href="member.jsp">회원가입</a>
        	</div>
      	</li>
  </ul>
  </div>  
</nav>. 
<div class="container" style="margin-top: 10px">
  <h2>Bordered Table</h2>
  <p>The .table-bordered class adds borders on all sides of the table and the cells:</p>            
  <table class="table table-bordered">
  
    <thead>
      <tr>
        <th>재품이름</th>
        <th>가격</th>
      </tr>
    </thead>
    <c:if var="dto" test="value">
    <tbody>
      <tr>
        <td><%=dto.getProductName()%></td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
    </tbody>
    </c:if>
  </table>
</div>	
</body>
</html>