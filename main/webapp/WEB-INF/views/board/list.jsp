<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Popper.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <style>
        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            align-items: center;
            flex-direction: column;
            height: 100vh;
        } 

        header {
            padding: 30px;
            background-color: aliceblue;
        }

        section {
            margin: 20px;
            padding: 20px;
            padding-top: 0px;
            border: 1px black;
            display: flex;
        }

        .column1 {
            float: left;
            width: 15%;
            padding: 10px;
            height: auto;
            border-top: 1px solid black;
        }

        .column2 {
            float: left;
            width: 85%;
            padding: 10px;
            margin: 0 auto 0 auto;
            height: auto;
        }

        footer {
            padding: 10px;
            margin: 10px 0 20px 0;
        }

        .board-meun-container {
            border-top: 2px solid black;
            background-color: #fff;
            display: flex;
        }


        /* Container styles */
        .footer-container {
            background-color: #fff;
            margin: 0 50px 10px 50px;
            padding: 0 20px 20px 20px;
            text-align: center;
            
        }

        /* Pagination styles */
        .pagination{
            justify-content: center;
        }

        .navbar-dark .navbar-nav .nav-link {
            color: black !important;
        }

        input{
            border: 0px;
            border-radius: 10px;
            width: 100%;
            height: 30px;
            margin-bottom: 20px;
        }


        .dropdown:hover .dropdown-menu {
            display: contents;
        }       
    </style>
</head>

<body>
    <header class="navbar navbar-expand-md navbar-dark text-dark">
        <a class="navbar-brand" style="color: black;" href="/main/main">Navbar</a>
        <div class="collapse navbar-collapse justify-content-start align-items-center" id="collapsibleNavbar">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                <li class="nav-item"><a class="nav-link" href="/froduct/list">리스트</a></li>
                <li class="nav-item"><a class="nav-link" href="/board/list">개시판</a></li>
                <li class="nav-item dropdown ml-auto">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">메뉴</a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="/member/logout">로그아웃</a>
                        <a class="dropdown-item" href="/member/get">내정보 수정</a>
                    </div>
                </li>
            </ul>
        </div>
    </header>

    <section>
        <div class="column1">
            <input type="button" value="게시글 작성">
            <input type="button" value="게시글 보기">
            <div class="board-meun-container">
                <ul class="nav flex-column">  
                    <li class="nav-item"><a class="nav-link text-dark"  href="#"><h5>전체글 보기</h6></a></li>
                    <li class="nav-item"><a class="nav-link text-dark"  href="#"><h5>인기글</h5></a></li>
                    <li class="nav-item"><a class="nav-link text-dark"  href="#"><h5>모든글</h5></a></li>
                    <li class="nav-item"><a class="nav-link text-dark"  href="#"><h5>모든글</h5></a></li>
                    <li class="nav-item dropdown" id="1">
                        <a class="nav-link dropdown-toggle text-dark" id="1" href="#">Dropdown</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href="#">Lorem</a>
                          <a class="dropdown-item" href="#">Ipsum</a>
                          <a class="dropdown-item" href="#">Dolor</a>
                        </div>
                    </li>
                    <li class="nav-item"><a class="nav-link text-dark"  href="#"><h5>기타</h5></a></li>
                </ul>
            </div> 
        </div>
        <div class="column2">
            <div class="container"><br>
                <!-- Board information display -->
                <h3>자유 게시판</h3><br>
                <table class="table table-hover">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>아이디</th>
                        <th>작성일</th>
                    </tr>
    
                    <!-- Iterate over dtos and display table rows -->
                    <c:forEach var='dto' items='${list}'>
                        <tr>
                            <td><c:out value="${dto.bcode}"/></td>
                            <td><a href="/board/get?bcode=${dto.bcode}">${dto.title}</a></td>
                            <td><c:out value="${dto.writer}"/></td>
                            <td><fmt:formatDate pattern="yyyy/MM/dd" value="${dto.regdate}" /></td>
                        </tr>
                    </c:forEach>
                </table>

    
                <!-- Page navigation -->
                <ul class="pagination">
                    <!-- Previous page link -->
                    <c:if test="${page.prev}">
                        <li class="page-item">
                            <a class="page-link" href="/board/list?pageNum=${page.startPage-1}">Previous</a>
                        </li>
                    </c:if>

                    <!-- Page links -->
                    <c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
                        <li class="page-item ${page.cri.pageNum == num ? 'active':''}">
                            <a class="page-link" href="/board/list?pageNum=${num}">${num}</a>
                        </li>
                    </c:forEach>

                    <!-- Next page link -->
                    <c:if test="${page.next}">
                        <li class="page-item">
                            <a class="page-link" href="/board/list?pageNum=${page.endPage+1}">Next</a>
                        </li>
                    </c:if>
                </ul>   
            </div>
        </div>
    </section>
    <footer>
        <div class="footer-container">
            <hr><p>Copyright © 2023 tcpschool.co.,Ltd. All rights reserved.</p>
            <address>Contact webmaster for more information. 070-1234-5678</address>
        </div>
    </footer>
</body>

</html>


