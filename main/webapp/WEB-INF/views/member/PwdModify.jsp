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
        .main-Container{
            display: block;         
            box-sizing: border-box;
            background-color: #ffffff;
            line-height: 1.6em;   
            margin: 0 auto 10px; padding: 20px;
            width: 100%;
            max-width: 1200px;           
        }

        .MemberPwdModify-wrapper {
            border: 1px solid black;
            border-radius: 10px;
            width: 1000px; height: 80%;
            margin: 10px auto 10px; padding: 20px;

        }

        .title-wrapper {
            width: 90%; 
            margin: 10px auto 20px;      
        }
        
        .form-group {
            margin-bottom: 10px;
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

        .form-group > label {
            font-size: 14px;
            width: 20%;
            margin: 30px 0px 30px 30px;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group > input {
            position: relative;
            width: 70%;
            padding: 10px; margin: 10px 0px 10px 10px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }

        .form-group > input[name="submit"]  {
            justify-content: center;
            width: 20%; height: 20%;
            margin: 10px 10px 10px 10px;
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
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Modal Heading</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    Modal body..
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>
    <main class="main-Container">
        <header class="title-wrapper">
            <hr>
            <h5>비밀번호 변경</h5><h6>개인정보보호를 위해 주기적으로 비밀번호변경을 권장드립니다.</h6>
            <hr>
        </header>
        <div class="MemberPwdModify-wrapper">
        	<form method="post" id="form" action="/member/pwdmodify">
            <div class="form-group">
                <label>현재 비밀번호</label>
                <input type="text" id="pwd" name="pwd">
            </div>
            <div class="form-group">
                <label>새 비밀번호</label>
                <input type="text" id="newpwd" name="newpwd">
            </div>         
            <div class="form-group">
                <input type="submit" id="send" name="submit" value="비밀번호 변경하기"> 
                <input type="button" name="submit" value="다음에 변경하기" onclick="location.href='/main/main'">
            </div>
            </form>
        </div>  
    </main>
</body>
<script type="text/javascript">

	$(document).ready(function(){	
    	checkModal();
	});
	
    function checkModal(){
    	
    	let result = "<c:out value='${result}'/>";
    	console.log(result);
    	 
		if(result ===''){
			return;
			
		}else if(result === 'false'){
			$(".modal-title").html("정보 수정");
			$(".modal-body").html("비밀번호가 틀립니다!");
			
		}else if(result ==='true'){
			$(".modal-title").html("정보 수정");
			$(".modal-body").html("수정 완료");
		}
			
		$("#myModal").modal("show");
	}
</script>
</html>