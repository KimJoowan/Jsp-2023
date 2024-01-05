<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <title>Document</title>
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
        }

        section{
            padding: 10px;
        }


/*-------------------------------------------------------------*/
/*그릇 툴*/
/*-------------------------------------------------------------*/
        .Product-update-container { 
            background-color: #fff;
            margin: 30px 50px 10px 50px;
            padding: 10px 20px 10px 20px;
            border-radius: 8px; /*요소의 둥근 모서리*/
            border: 1px solid black;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <header class="navbar navbar-expand-md bg-dark navbar-dark">
        <a class="navbar-brand" href="#">Navbar</a>
        <div class="collapse navbar-collapse justify-content-start align-items-center" id="collapsibleNavbar">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                <li class="nav-item"><a class="nav-link" href="#">제품 목록</a></li>
                <li class="nav-item"><a class="nav-link" href="#">제품 등록</a></li>
                <li class="nav-item dropdown ml-auto">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">메뉴</a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="/member/logout">로그아웃</a>
                    </div>
                </li>
            </ul>
        </div>
    </header>
    <!--========================================================================================================================================-->
  <section>
    <br><h2 class="text-center font-weight-bold">제품 수정및 재고추가</h2>
    <article>
      <div class="Product-update-container">
        <form action="/stakeholder/update" method="post">
          <input type="hidden" name="pcode" value="${dto.pcode}">
    
            <table class="table table-striped table-hover">
              <tr>
                <th>bcode</th><td>${dto.pcode}</td>
                <th></th><td><input type="text" value="${dto.subject}" name="subject"></td>
              </tr>
              <tr>
                <th></th><td><input type="number" value="${dto.count}" name="count"></td>
                <th></th><td>${dto.regdate}</td>
              </tr>
              <tr>
                <th></th><td colspan="3"><textarea rows="15" cols="70" name="content">${dto.content}</textarea></td>	
              </tr>         
              <tr>
                <td colspan="4">
                  <input type="submit" value ="제품 수정" >
                  <input type="button" value ="제품 삭제" onclick ="location.href='/stakeholder/delete?pcode=${dto.pcode}'">
                  <input type="button" value ="제품 목록" onclick ="location.href='/stakeholder/productlist'">
                  <input type="button" value ="제품 등록" onclick ="location.href='/stakeholder/addproduct'">
                </td>
              </tr>
            </table><br><br>
        </form>
      </div>
    </article>
  </section>
</body>
</html>