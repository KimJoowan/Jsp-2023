<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 탈퇴</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 100px 50px 150px 50px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        p {
            color: #666;
        }

        input {
            background-color: #e44d26;
            color: #fff;
            border: none;
            padding: 10px 20px;
            margin: 20px 10px 0px 10px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>회원 탈퇴</h1>
        <p>정말로 탈퇴하시겠습니까?</p>       
        <input type="button" value="취소" onclick='location.href="/member/get"' >
        <input type="button" value="탈퇴" onclick='location.href="/member/remove"' >
    </div>
</body>
</html>
    