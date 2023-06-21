<%@page import="java.util.ArrayList"%>
<%@page import="dit.cs.Buydao"%>
<%@page import="dit.cs.Buydto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String id = (String)session.getAttribute ("id");
	Buydao dao = new Buydao();
	ArrayList<Buydto> dtos = dao.list(id); 


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
<div class="container">
  <h2 style="margin:20px ">구매내역</h2>
  <table class="table">
    <thead>
      <tr>
        <th>제품이름</th>
        <th>구매갯수</th>
      </tr>
    </thead>
    <tbody>
      <%for(Buydto dto: dtos){ %>
		<tr>
			<td><a href="buyList2.jsp?ProductName=<%=dto.getProductName()%>&counts=<%=dto.getCounts()%>"><%=dto.getProductName()%></td>
			<td><%=dto.getCounts()%></td>
		</tr>
	<%}%>
    </tbody>
  </table>
</div>

</body>
</html>