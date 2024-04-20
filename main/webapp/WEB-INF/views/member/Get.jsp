<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        body, html{
            height: 100%;
            margin: 0 auto 20px;
            padding: 0;
            min-width: 600px;
        }

        body {
            display: block;
            background: #ffffff;
        }

        nav {
            padding: 30px;
            background-color: aliceblue;
            display: flex;
        }

/*-------------------------------------------------------------*/
/*그릇 툴*/
/*-------------------------------------------------------------*/

        .title-Container {
            box-sizing: border-box;
            text-align: center;
            background-color: #ffffff;
            line-height: 1.6em;   
            margin: 14px auto 10px;
            width: 100%;
            max-width: 1000px;           
        }


        .MemberGet-Container {
            display: flex;         
            box-sizing: border-box;
            background-color: #ffffff;
            line-height: 1.6em;   
            margin: 0 auto 10px; padding: 20px;
            width: 100%;
            max-width: 1000px;           
        }

        .meun-wrapperA{
            position: relative; top: 0px; left: 0px;
            margin: 0 10px 0;
            flex: 1 0 auto;
            width: 70%;  height: 550px;
            border-radius: 10px; border: 1px solid black;
        }

        .meun-wrapperB{
            position: relative; top: 0px; left: 0px;

            margin: 0 10px 0;
            flex: 1 0 auto;
            width: 25%; height: 550px;
            border-radius: 10px; border: 1px solid black;
        }

        .form-group {
            margin-bottom: 15px;
        }

/*-------------------------------------------------------------*/
/*세부적인 디자인*/
/*-------------------------------------------------------------*/

        .form-group > label {
            font-size: 14px;
            width: 10%;
            padding: 2px; margin: 30px;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group > input {
            position: relative;
            width: 60%;
            padding: 8px; margin: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group > input[name="submit"]  {
            justify-content: center;
            width: 20%;
            height: 20%;
        }

        .navbar-dark .navbar-nav .nav-link {
            color: black !important;
        }

        .dropdown:hover .dropdown-menu {
            display: contents;
        } 

    </style>
    <title>Document</title>
</head>
<body>
    <nav class="navbar navbar-expand-md navbar-dark text-dark">
        <a class="navbar-brand" style="color: black;" href="/main/main">Navbar</a>
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
    <header class="title-Container">
        <h1>개인 정보</h1>
        <em>다양한 서비스에서 사용되는 나와 내 환경설정에 관한 정보입니다.</em>
    </header>
    
    <main class="MemberGet-Container">
        <aside class="meun-wrapperA">
            <form class="info-Update-form" action="/member/modify" method="post">
            <div class="form-group">
                <label for="username">아이디</label>
                <input type="text" id="username" name="id" value="${Dto.id}" readonly>
            </div>
            <div class="form-group">
                <label for="username">이메일</label>
                <input type="text" id="email" value="${Dto.email}" name="email" required>
            </div>
            <div class="form-group">
                <label for="username">이름</label>
                <input type="text" id="name" value="${Dto.name}" name="name" required>
            </div> 
            <div class="form-group">
                <label for="username">주소</label>
                <input type="text" id="address" value="${Dto.address}" name="address" required>
            </div> 
            <div class="form-group">
                <label for="username">폰번호</label>
                <input type="text" id="phonenumber" value="${Dto.phonenumber}" name="phonenumber" required>
            </div>
            <div class="form-group">
                <input type="submit" name="submit" value="저장">
            </div> 
            </form>

        </aside>

        <article class="meun-wrapperB">
            <br>
            <ul>
                <li><a href="/member/unregister">계정삭제</a></li>
                <li><a href="/member/pwdmodify">비밀번호 번경</a></li>
            </ul>
        </article>
    </main>
</body>
</html>
