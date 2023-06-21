<%@page import="dit.cs.Buydao"%>
<%@page import="dit.cs.Buydto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ProductName = request.getParameter("ProductName");
	int counts = Integer.parseInt(request.getParameter("counts"));
	Buydto dto = new Buydto(ProductName,counts);
	Buydao dao = new Buydao();
	dto = dao.getOne(dto);
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
        	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">메뉴</a>
        	<div class="dropdown-menu dropdown-menu-right">
          		<a class="dropdown-item" href="Login.jsp">로그인</a>
          		<a class="dropdown-item" href="member.jsp">회원가입</a>
        	</div>
      	</li>
  </ul>
  </div>  
</nav>

 <div class="container" id="Login">
  <h2>환불</h2>
  <form action="lIstD.jsp" class="was-validated" method="post">
    <div class="form-group">
     <label for="psw"><b>제품이름</b></label>
    <input type="text" placeholder="제품이름" name="ProductName" value="<%=dto.getProductName()%>">
    </div>
    
    <div class="form-group">
      <label for="psw-repeat"><b>구매개수</b></label>
      <input type="number" placeholder="구매개수" name="counts" value="<%=dto.getCounts()%>">
    </div>
    <input type="submit" value="환붛" class="btn btn-primary">
  </form>
</div> 
  
  
  
  

</body>
</html>