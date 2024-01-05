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
            margin: 10px auto 0; /*Ư�� ������ �����ϰ� �������� ��� ����*/
            display: block; /* �� ���� �߰��Ͽ� ���� �Ӽ��� �۵��ϴ��� Ȯ���մϴ� */
            padding: 10px; /* ���ο��� */
            background-color: #4caf50;  /*������*/
            color: #000; /*���ڻ�*/
            border: none; /*�׵θ� ����*/
            border-radius: 4px; /*�𼭸� ������ �����մϴ�.*/
            cursor: pointer; /*����ڿ��� ��ư�� Ŭ�� �����ϰų� ��ȭ������ ��Ÿ���ϴ�.*/
            font-size: 16px; /*���� ũ��*/
        }
        
    </style>
</head>
<body>
    <div class="login-container">
        <h2>�α���</h2>
        <form action="/member/check" class="login-form" method="post">
            <div class="form-group">
                <label for="id">���̵�</label>
                <input type="text" id="id" name="id" required>
            </div>
            <div class="form-group">
                <label for="pwd">��й�ȣ</label>
                <input type="password" id="pwd" name="pwd" required>
            </div>
            <div class="form-group">
                <input type="submit" value="�α���" name="submit">
            </div>
        </form>
    </div>
</body>
</html>