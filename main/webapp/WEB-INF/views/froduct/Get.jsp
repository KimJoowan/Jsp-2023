<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<style>
/*-------------------------------------------------------------*/
/*전체 툴*/
/*-------------------------------------------------------------*/
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
            margin: 0 auto 0 auto;
            height: auto; 

            /* Add flexbox styles */
            display: flex;
            justify-content: space-between;
        }

        footer{
            padding: 10px;
            margin: 10px 0 20px 0; 
        }

/*-------------------------------------------------------------*/
/*그릇 툴*/
/*-------------------------------------------------------------*/
        .main-search-container{ 
            background-color: #fff;
            margin: 30px 50px 10px 50px;
            padding: 0px 20px 0 20px;
            border-radius: 8px; /*요소의 둥근 모서리*/
        }

        .main-search-Results-container{
            text-align: center;
            margin: 0 0 100px 0;
            width: 1000px;
            height: 100px;
        }

		.footer-container{
            background-color: #fff;
            margin: 0 50px 10px 50px;
            padding: 20px 20px 20px 20px;
            text-align: center;
        }


/*-------------------------------------------------------------*/
/*세부적인 디자인*/
/*-------------------------------------------------------------*/
        .product-select{
			width: 25px;
			height: 25px;
		}

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
            padding-top: 10px;
            text-align: left;  
        }

        input[type="number"]{
            border-radius: 4px; /*요소의 둥근 모서리*/
            margin-left: 20px ;
        }

        input[class="product-select"]{
            height: 40px;
		}

        input[class="product"]{
            height: 40px;
            width: 200px;
		}

        img{
            width: 300px;
            height: 300px;
            border: 3px solid black;
        }

	</style>

<!--==================================================================================================================================-->
<body>
    <header>
        <div class="main-search-container">
            <form action="/froduct/getlist" method="get" class="main-search">
                <input type="text" name="subject" placeholder="검색어를 입력해주세요">
                <input type="submit" value="검색">
            </form>
        </div>
    </header>
<!--==============================================================================================================-->
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <a class="navbar-brand" href="/main/main">Navbar</a>

    <div class="collapse navbar-collapse justify-content-start align-items-center" id="collapsibleNavbar"> 
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>

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
              </a>
            </li>
        </ul>
    </div>  
</nav>
<!--==============================================================================================================-->
<section>
	<article class="row">
		<!--------------------------------------->
		<div class="column">
		</div>
		<!--------------------------------------->
		<div class="column1">
			<form action="/buy/register" method="post">
				<table class="main-search-Results-container">
				<input type="hidden" name="subject" value="${value.subject}"/>
				<input type="hidden" name="price" value="${value.price}"/>
                <tr>
                    <th rowspan="4"><img src="image/149852.png"></img></th>
                    <td><h1>${value.subject}</h1><hr></td>
                </tr>
                <tr>
                    <td><h5>${value.price}원</h5><hr></td>
                </tr>
                <tr>
                    <td>구매수량<input type="number" name="count" min='1' max='99' step='1'><hr></td>
                </tr>
                <tr>
                    <td><input type="submit" value="구매" class="product"></td>                  
                </tr>                                           
            </table>
			</form>    
		</div>
		<!--------------------------------------->
		<div class="column">

		</div>
		<!--------------------------------------->
	</article>
</section>
<!--========================================================================================================================-->
<footer>
    <div class="footer-container">
        <hr><p>Copyright © 2018 tcpschool.co.,Ltd. All rights reserved.</p>
        <address>Contact webmaster for more information. 070-1234-5678</address>
    </div>
</footer>

</html>