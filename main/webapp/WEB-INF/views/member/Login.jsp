<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .login-container {
            background-color: #fff;
            padding: 40px;
            padding-bottom: 150px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        .login-container h2 {
            text-align: center;
            color: #333;
        }

        .login-form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-size: 14px;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group input[name="submit"]  {
            width: 80px;
            margin: 10px auto 0; /*특정 여백을 설정하고 수평으로 가운데 맞춤*/
            display: block; /* 이 선을 추가하여 마진 속성이 작동하는지 확인합니다 */
            padding: 10px; /* 내부여백 */
            background-color: #4caf50;  /*바탕색*/
            color: #000; /*글자색*/
            border: none; /*테두리 제거*/
            border-radius: 4px; /*모서리 굴곡을 설정합니다.*/
            cursor: pointer; /*사용자에게 버튼이 클릭 가능하거나 대화형임을 나타냅니다.*/
            font-size: 16px; /*글자 크기*/
        }
        
    </style>
</head>
<body>
    <div class="login-container">
        <h2>로그인</h2>
        <form action="/member/check" class="login-form" method="post">
            <div class="form-group">
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" required>
            </div>
            <div class="form-group">
                <label for="pwd">비밀번호</label>
                <input type="password" id="pwd" name="pwd" required>
            </div>
            <div class="form-group">
                <input type="submit" value="로그인" name="submit">
            </div>
        </form>
    </div>
</body>
</html>