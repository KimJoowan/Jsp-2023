<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>Document</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            align-items: center;
            flex-direction: column; /* 항목을 세로로 정렬 */
            height: 100vh;
        }

        header{
            padding: 30px;
            
        }

        nav{
            padding: 30px;
            margin: 10px 0 0 0; 
            
        }

        section{
            margin: 0 0 0 0; 
        }

        .column{
            overflow: hidden;
            float: left;
            width: 15%;
            padding: 10px;
            height: auto; 
        }

        .column1{
            overflow: hidden;
            float: left;
            width: 70%;
            padding: 10px;
            margin: 20px auto 0 auto;
            height: auto; 
        }

        footer{
            padding: 0 10 10 10;
            margin: 0 0 20px 0; 
            
        }

/*-------------------------------------------------------------*/
/*그릇 툴*/
/*-------------------------------------------------------------*/
        .main-search-container{ 
            background-color: #fff;
            margin: 30px 50px 10px 50px;
            padding: 0 20px 0 20px;
        }

        .main-search-Results-container{
            border: 1px solid black;
            text-align: left;
            margin: auto 20px auto 0px;
            width: 1000px;
            height: 50px;
        }

        .main-search-Results-page-container{
            text-align: center;
            margin: auto;
            margin-top: 30px;
            width: 1000px;
            height: 50px;
        }

        .footer-container{
            background-color: #fff;
            margin: 0 50px 10px 50px;
            padding: 30px 20px 20px 20px;
            text-align: center;
        }

/*-------------------------------------------------------------*/
/*세부적인 디자인*/
/*-------------------------------------------------------------*/
        .main-search{
            text-align: center;
        }
        
        input[type="text"]{
            border-radius: 20px; /*요소의 둥근 모서리*/
            width: 600px;
            height: 50px;
            margin-right: 20px;
        }

        input[type="submit"]{
            width: 70px;
            height: 50px;
        }

        .row{
            margin: 0;
        }

        th, td {
            border: 1px solid #444444;
        }

        img{
            width: 75px;
            height: 75px;
            margin-right: -50px; 
        }

    </style>
</head>
<!--========================================================================================================================================-->
<body>
    <header>
        <div class="main-search-container">
            <form action="/froduct/getlist" method="get" class="main-search">
                <input type="text" name="subject" placeholder="검색어를 입력해주세요">
                <input type="submit" value="검색">
            </form>
        </div>
    </header>
<!--========================================================================================================================================-->
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <a class="navbar-brand" href="/main/main">Navbar</a>
    <div class="collapse navbar-collapse justify-content-start align-items-center" id="collapsibleNavbar"> 
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li> 
        <li class="nav-item">
          <a class="nav-link" href="/froduct/list">리스트</a>
        </li>  
        <li class="nav-item">
          <a class="nav-link" href="/board/list">개시판</a>
        </li>  
        <li class="nav-item dropdown ml-auto">
          <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">메뉴</a>
            <div class="dropdown-menu dropdown-menu-right">
              <a class="dropdown-item" href="/member/logout">로그아웃</a>
                <a class="dropdown-item" href="/member/get">내정보 수정</a>
            </div>
        </li>
      </ul>
    </div>
</nav>
<!--========================================================================================================================================-->
    <section>
        <article class="row">
            <!--------------------------------------->
            <div class="column">

            </div>
            <!--------------------------------------->
            <div class="column1">
                <table class="main-search-Results-container table">                            
                	<c:forEach var="item" items="${list}">
	                    <tr >   
                            <td rowspan="2"><img src=""></td>                                     
                            <td>${item.subject}</td>
                       	</tr>
                        <tr>
                            <td>${item.price}원</td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="main-search-Results-page-container">
                    <div class="d-flex justify-content-center">
						<ul class="pagination">
							<c:if test="${page.prev}">
								<li class="page-item">
									<a class="page-link" href="href="/froduct/list?pageNum=${page.startPage-1 }">Previous</a>
								</li>
							</c:if>
							<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
								<li class="page-item ${page.cri.pageNum == num ? 'active':''}">
									<a class="page-link" href="/froduct/list?pageNum=${num}">${num}</a>
								</li>
							</c:forEach>
								<c:if test="${page.next}">
									<li class="page-item">
										<a class="page-link" href="/froduct/list?pageNum=${page.endPage+1 }">Next</a>
									</li>
								</c:if>
						</ul>
					</div>
                </div>
            </div>
            <!--------------------------------------->
            <div class="column">

            </div>
            <!--------------------------------------->
        </article>
    </section>
<!--========================================================================================================================================-->
    <footer>
        <div class="footer-container">
            <hr><p>Copyright © 2018 tcpschool.co.,Ltd. All rights reserved.</p>
            <address>Contact webmaster for more information. 070-1234-5678</address>
        </div>
    </footer>
</body>
</html>