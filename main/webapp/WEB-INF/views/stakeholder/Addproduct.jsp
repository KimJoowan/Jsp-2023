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

        section {
            margin: 20px;
            padding: 20px;
        }
    </style>
</head>
<body>
    <header class="navbar navbar-expand-md bg-dark navbar-dark">
        <a class="navbar-brand" href="/stakeholder/main">Navbar</a>
        <div class="collapse navbar-collapse justify-content-start align-items-center" id="collapsibleNavbar">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                <li class="nav-item"><a class="nav-link" href="#">제품 목록</a></li>
                <li class="nav-item"><a class="nav-link" href="/stakeholder/addproduct">제품 등록</a></li>
                <li class="nav-item dropdown ml-auto">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">메뉴</a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="/member/logout">로그아웃</a>
                    </div>
                </li>
            </ul>
        </div>
    </header>

    <section>
        <div class="container">
            <h2 class="text-center font-weight-bold">제품 등록</h2>
            <hr />
            <!--  enctype="multipart/form-data" -->
            <form action="/stakeholder/register" method="post">
                <div class="form-group">
                    <label for="subject">Subject:</label>
                    <input type="text" class="form-control" id="subject" name="subject">
                </div>
                <div class="form-group">
                    <label for="content">Content:</label><br>
                    <textarea rows="10" cols="150" name="content" id="content"></textarea>
                </div>
                <div class="form-group">
                    <label for="price">가격</label>
                    <input type="number" class="form-control" id="price" name="price">
                </div>
                <div class="form-group">
                    <label for="count">등록 갯수:</label>
                    <input type="number" class="form-control" id="count" name="count">
                </div>                                                                                                                                
                <div class="text-center">
                    <input type="submit" value="등록" class="btn btn-secondary">
                </div>
            </form>
        </div>
    </section>
</body>
</html>