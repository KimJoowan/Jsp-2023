<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Page</title>
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

        .signup-container { 
            background-color: #fff;
            padding: 40px;
            padding-bottom: 50px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        .signup-container h2 {
            text-align: center;
            color: #333;
        }

        .signup-form {
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

        .form-group input{
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group input[name="addmember"] {
            width: 80px; /* ���� ���� 100%�� ���� */
            margin: 10px auto 0; /* �� �Ʒ� ������ ���� */
            display: block; /* �� ���� �߰��Ͽ� ���� �Ӽ��� �۵��ϴ��� Ȯ���մϴ� */
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

    </style>
</head>
<body>
    <div class="signup-container">
        <h2>ȸ�� ����</h2>
        <form action="/member/regiseter" class="signup-form" method="post">
            <div class="form-group">
                <label for="id">���̵�</label>
                <input type="text" id="id" name="id" required>
            </div>
            <div class="form-group">
                <label for="pwd">��й�ȣ</label>
                <input type="password" id="pwd" name="pwd" required>
            </div>
            <div class="form-group">
                <label for="email">�̸���</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="name">�̸�</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="address">�ּ�</label>
                <input type="text" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="phone-number">��ȭ��ȣ</label>
                <input type="text" id="phonenumber" name="phonenumber" required>
            </div> 
            <div class="form-group">
                <input type="submit" name="addmember" value="����">
            </div>
        </form>
    </div>
</body>
</html>
