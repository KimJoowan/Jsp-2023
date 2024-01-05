<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
/*-------------------------------------------------------------*/
/*전체 툴*/
/*-------------------------------------------------------------*/
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

/*-------------------------------------------------------------*/
/*그릇 툴*/
/*-------------------------------------------------------------*/

        .info-Update-container {
            background-color: #fff;
            padding: 40px;
            padding-bottom: 50px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

/*-------------------------------------------------------------*/
/*세부적인 디자인*/
/*-------------------------------------------------------------*/

        .info-Update-container > h2 {
            text-align: center;
            color: #333;
        }

        .info-Update-form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group > label {
            font-size: 14px;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group > input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group > input[name="submit"]  {
            width: 80px;
            margin: 10px auto 0; /*특정 여백을 설정하고 수평으로 가운데 맞춤*/
            display: block; /* 이 선을 추가하여 마진 속성이 작동하는지 확인합니다 */
            padding: 10px; /* 내부여백 */
            background-color: #4caf50;  /*바탕색*/
            color: #000; /*글자색*/
            border-radius: 4px; /*모서리 굴곡을 설정합니다.*/
            cursor: pointer; /*사용자에게 버튼이 클릭 가능하거나 대화형임을 나타냅니다.*/
            font-size: 16px; /*글자 크기*/
        }
        
    </style>
</head>
<body>
    <div class="info-Update-container">
        <h2>정보 수정</h2>
        <form class="info-Update-form" action="/member/modify" method="post">
            <div class="form-group">
                <label for="username">아이디</label>
                <input type="text" id="username" name="id" value="${Dto.id}" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="pwd" value="${Dto.pwd}" name="pwd" required>
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="text" id="email" value="${Dto.email}" name="email" required>
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" value="${Dto.name}" name="name" required>
            </div>
            <div class="form-group">
                <label for="address">주소</label>
                <input type="text" id="address" value="${Dto.address}" name="address" required>
            </div>
            <div class="form-group">
                <label for="phonenumber">폰 번호</label>
                <input type="text" id="phonenumber" value="${Dto.phonenumber}" name="phonenumber" required>
            </div>
            <a href="/member/unregister"><h5>계정 삭제</h5></a>
            <div class="form-group">
                <input type="submit" value="수정" name="submit">
            </div>
            
        </form>
    </div>
</body>
</html>