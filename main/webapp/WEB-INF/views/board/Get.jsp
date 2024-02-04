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
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
            border: 1px solid black;
        }
        
        .board-content-container {
            text-align: left;
            padding: 30px;
            border: 1px solid black;
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
                    <li class="nav-item"><a class="nav-link text-dark"  href="#"><h5>전체글 보기</h5></a></li>
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
                <c:if test="${BoardDto.id == sessionid}">
                	<form action="/board/modify" method="post">
                    	<input type="hidden" name="bcode" id="bcode" value="${BoardDto.bcode}">
                    	<input type="text" name="title" style="width: 100%;" placeholder="제목을 입력하세요" id="title" value="${BoardDto.title}">
                    	<textarea  style="width: 100%; height: 240px;" name="content" placeholder="내용을 입력하세요">${BoardDto.content}</textarea>                 
                    	<input type="submit" style="width: 10%; padding: 0; position: relative; left: 0%;" value="수정">
                    	<input type="button" style="width: 10%; padding: 0; position: relative; left: 0%;" value="삭제" onclick ="deletePost(${BoardDto.bcode});">
                    	<input type="button" style="width: 10%; padding: 0; position: relative; left: 0%;" value="게시판 이동"><!-- 미구현 -->
                    	<input type="button" style="width: 10%; padding: 0; position: relative; left: 0%;" value="취소" onclick="/board/list" placeholder="내용을 입력하세요">           
                	</form>              
                </c:if>
                <c:if test="${BoardDto.id != sessionid}">
                	<form>
                    	<input type="hidden" name="bcode" id="bcode" value="${BoardDto.bcode}">
                    	<input type="text" name="title" style="width: 100%;" id="title" value="${BoardDto.title}" readonly="readonly">
                    	<textarea  style="width: 100%; height: 240px;"readonly="readonly"><c:out value="${BoardDto.content}"></c:out></textarea>                       
                	</form>              
                </c:if>                                                                                
            </div>
            <div class="board-content-container">
                <h3>댓글작성</h3><hr>
                <input type="text" style="width: 100%; height: 50px;" placeholder="댓글을 입력하세요." id="content" required>
                <input style="width: 5%; height: 50px; background-color: #ffffff; border: 0px; position: relative; left: 95%; top: 10px;" type="button" onclick="contentPost();" value="답글">
            	<table class="table">
    				<thead>
        				<tr>
            				<td>번호</td>
            				<td>제목</td>
            				<td>작성 날짜</td>
        				</tr>
    				</thead>
    				<tbody id="contents">  
        				
    				</tbody>                  	             		
				</table>
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
 
	function deletePost(bcode) {
    	// 폼 요소 생성
    	const form = document.createElement('form');
    		form.style.display = 'none'; // 폼 숨기기
    		form.method = 'post';
    		form.action = '/board/remove';

    	// 게시판 코드를 위한 입력 요소 생성
    	const input = document.createElement('input');
    		input.type = 'hidden';
    		input.name = 'bcode';
    		input.value = bcode;

    	// 입력을 폼에 추가하고 폼을 본문에 추가
    	form.appendChild(input);
    	document.body.appendChild(form);

    	// 폼 제출
    	form.submit();
	}

	function contentPost() {
		let bcode = document.getElementById("bcode").value;
		let content = document.getElementById("content").value;
		
		if(content){
			$.ajax({
				url : '/comment/register',
				data : {
					bcode : bcode,
					content : content
	        	},
	        	type : 'POST',
	        	dataType : 'json',
	        	success : function(data){
	        		console.log('성공:', data);
	        		getLists();
	        		$("#content").val('');
	        	},
	        	error: function(xhr, data, error) {
	                console.error('AJAX request failed:', data, error);
	                // Handle the error (e.g., display a generic error message)
	        	}
	      	});
			
		}else{
			alert('내용을 입력해주세요!');
		}		
	}
	
	/*ajax*/
	function getList() {
	    $.ajax({
	        url: "/comment/list?bcode=" + $('#bcode').val(),
	        type: "GET",
	        dataType: 'json',
	        success: function (value) {  // 이름을 data로 변

	            var str = '';

	            for (const item of value) {
	                str += '<tr><td>' + item.ccode + '</td>';
	                str += '<td>' + item.content + '</td>';
	                str += '<td>' + item.regdate + '</td></tr>';
	            }
	         
	            $("#contents").html(str);
	        },
	        error: function (xhr, status, error) {
	            console.error('AJAX 요청 실패:', status, error);
	        }
	    });
	}
	
	/*fetch*/
	function getLists(){
		
		const bcode = document.getElementById("bcode").value;      
              
        fetch("/comment/list?bcode=" + bcode,{
            method: "get",
            headers:{
                "Content-Type" : "application/json",
            },
            
        })        
        .then(res => {
        	if (!res.ok) {
            	throw new Error(`Network response was not ok: ${res.status}`);
        	}
        	return res.json();
    	})    
        .then(response => {
            let str = '';
            
            for (let item of response) {
                str += '<tr><td>' + item.ccode + '</td>';
                str += '<td>' + item.content + '</td>';
                str += '<td>' + item.regdate + '</td></tr>';
            }
     
            $("#contents").html(str);
        })      
        .catch(error => {
            console.error('Error:', error);
        });
    }
	
    window.onload = function() {getLists()};

</script>
</html>
