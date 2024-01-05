<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            position: relative;   
        }

        .board-add-container {
            text-align: left;
            padding: 30px;
        }

        .footer-container {
            background-color: #fff;
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
                <h3>수정중</h3><hr>
                <form>
                    <input type="hidden" name="bcode" id="bcode" value="${BoardDto.bcode}">
                    <input type="text" name="title" style="width: 100%;" placeholder="제목을 입력하세요" id="title" value="${BoardDto.title}">
                    <textarea type="text" style="width: 100%; height: 240px;" placeholder="내용을 입력하세요">${BoardDto.content}</textarea>
                    <c:if test="${BoardDto.id == sessionid}">
                        <input type="submit" style="width: 10%; padding: 0; position: relative; left: 0%;" value="수정">
                        <input type="button" style="width: 10%; padding: 0; position: relative; left: 0%;" value="삭제" onclick ="location.href='/board/remove?bcode=${BoardDto.bcode}'">
                        <input type="button" style="width: 10%; padding: 0; position: relative; left: 0%;" value="게시판 이동">
                        <input type="button" style="width: 10%; padding: 0; position: relative; left: 0%;" value="취소" placeholder="내용을 입력하세요">           
                	</c:if>
                </form>
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

<script type="text/javascript">
    function insertComments() {
        $.ajax({
            url: "/comment/register",
            type: "POST",
            contentType: "application/x-www-form-urlencoded", // Set the content type
            data: {
                "content": $('#comment').val(),
                "bcode": $('#bcode').val()
            },
            success: function (data) {
                alert('ok'); 
                  
            },
            error: function () {
                alert('error');
            }
        });
    }
    
    function getComments(){
        $.ajax({
            url: "/comment/list?bcode="+$('#bcode').val(),
            type: "GET",
            anync: true,
            datatype: 'json',
            success: function (data) {
                var str = '';
                for(var i in list){
                    str += '<tr><td>' + data[i].ccode + '</td>';
                    str += '<td>' + data[i].content + '</td>';
                    str += '<td>' + data[i].regdate + '</td></tr>';
                }
                $('#commentsTable').html(str);               
            }
        });
        
        
    }
    
    window.onload = function() {getComments()};                          
</script>

</html>
