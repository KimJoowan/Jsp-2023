<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 등록</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Popper.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <style>
/*-------------------------------------------------------------*/
/*전체 툴*/
/*-------------------------------------------------------------*/
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
            display: flex;
        }

        section {
            margin: 20px;
            padding: 20px;
            padding-top: 0px;
            display: flex;
        }

        .column1 {
            float: left;
            width: 15%;
            padding: 10px;
            height: auto;
            width: auto;
            border-top: 1px solid black;
        }

        .column2 {
            float: left;
            width: 85%;
            padding: 10px;
            margin: 0 auto 0 auto;
            height: auto;
            overflow: auto;
        }

        footer {
            padding: 10px;
            margin: 10px 0 20px 0;
        }
        
        th,td{
            width: 80%;
            padding: 22px;
           border: red;
        }
/*-------------------------------------------------------------*/
/*그릇 툴*/
/*-------------------------------------------------------------*/
        .board-meun-container {
            border-top: 2px solid black;
            background-color: #fff;
            position: relative;
        }

        .board-add-container {
            text-align: left;
            padding: 30px;
        }


        .footer-container {
            background-color: #fff;
            margin: 0 50px 10px 50px;
            padding: 0 20px 20px 20px;
            text-align: center;
        }

/*-------------------------------------------------------------*/
/*세부적인 디자인*/
/*-------------------------------------------------------------*/

        .navbar-dark .navbar-nav .nav-link {
            color: black !important;
        }

        .dropdown:hover .dropdown-menu {
            display: contents;
        } 

        .menuButton{
            border: 0px;
            border-radius: 10px;
            width: 100%;
            height: 30px;
            margin-bottom: 20px;
        }

    </style>
</head>

<body>
    <header class="navbar navbar-expand-md navbar-dark text-dark">
        <a class="navbar-brand" style="color: black;" href="#"><h3>Google</h3></a>
        <div class="collapse navbar-collapse justify-content-start align-items-center" id="collapsibleNavbar">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                
                <li class="nav-item dropdown ml-auto">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" >메뉴</a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="#">로그인</a>
                        <a class="dropdown-item" href="#">회원가입</a>
                    </div>
                </li>
            </ul>
        </div>
    </header>

    <section> 
        <div class="column1">
            <input type="button" class="menuButton" value="게시글 작성">
            <input type="button" class="menuButton" value="게시글 보기">
            <div class="board-meun-container">
                <ul class="nav flex-column">  
                    <li class="nav-item"><a class="nav-link text-dark"  href="#"><h5>전체글 보기</h6></a></li>
                    <li class="nav-item"><a class="nav-link text-dark"  href="#"><h5>인기글</h5></a></li>
                    <li class="nav-item"><a class="nav-link text-dark"  href="#"><h5>모든글</h5></a></li>
                    <li class="nav-item"><a class="nav-link text-dark"  href="#"><h5>모든글</h5></a></li>
                    <li class="nav-item dropdown">
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
            <div class="board-add-container">
                <h3>작성중</h3><hr>
                <form action="/board/register" method="post">
                    <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
                    <textarea style="width: 100%; height: 240px;" name="content" id="content" placeholder="내용을 입력하세요"></textarea>
                    <input type="submit" style="width: 10%; padding: 0; position: relative; left: 0%;" value="저장">
                    <input type="submit" style="width: 10%; padding: 0; position: relative; left: 0%;" value="취소" placeholder="내용을 입력하세요">
                </form>
            </div>
        </div>

    </section>

    <footer>
        <div class="footer-container">
            <p>Copyright © 2023 tcpschool.co.,Ltd. All rights reserved.</p>
            <address>Contact webmaster for more information. 070-1234-5678</address>
        </div>
    </footer>
</body>

</html>
