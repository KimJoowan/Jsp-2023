<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            width: 80px; /* 가로 길이 100%로 조정 */
            margin: 10px auto 0; /* 위 아래 여백을 조정 */
            display: block; /* 이 선을 추가하여 마진 속성이 작동하는지 확인합니다 */
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
        <h2>회원 가입</h2>
        <form action="/member/register" class="signup-form" method="post">
            <div class="form-group">
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" required>
                <label id="label1">아이디</label>
            </div>
            <div class="form-group">
                <label for="pwd">비밀번호</label>
                <input type="password" id="pwd" name="pwd" required>
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input  id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="address">주소</label>
                <input type="text" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="phone-number">전화번호</label>
                <input type="text" id="phonenumber" name="phonenumber" required>
            </div> 
            <div class="form-group">
                <input type="submit" value="가입" id="myButton">
            </div>
        </form>
	</div>
</body>

<script type="text/javascript">

	$(document).ready(function() {
    	// ID 중복 확인
    	$("#id").on("focusout", function() {
    		let id = $("#id").val();
    		let ok = false;
        	if(check(id)) { // ID 유효성 검사
        		if(overlappingId(id)){
        			let myButton = document.getElementById('myButton');
        			myButton.addEventListener('click', registerPost);
        			console.log(id);
        		}       			 	
        	}
    	});
	});

	// 아이디 패턴 체크 (문자, 숫자, 특수문자 포함여부 체크)
	function checkIdPattern(str) {
    	let pattern1 = /[0-9]/; // 숫자
    	let pattern2 = /[a-zA-Z]/; // 문자
    	let pattern3 = /[_-]/; // 언더스코어와 하이픈만
    	return pattern1.test(str) && pattern2.test(str) && pattern3.test(str);
	}

	function check(id) {
		
    	if(id == '' || id.length == 0) {
        	$("#label1").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
        	return false;
    	}

    	if(id.length < 4 || id.length > 32){
        	$("#label1").css("color", "red").text("아이디: 5~32자 문자수로 구성하여야 합니다.");
        	return false;
    	}

    	if(!checkIdPattern(id)) {
        	$("#label1").css("color", "red").text("아이디: 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
        	return false;
    	}

    	return true; // ID가 유효한 패턴을 가지고 있다면 true 반환
	}

	function overlappingId(id) {
    	$.ajax({
        	url : '/member/idcheck',
        	data : {
            	id : id
        	},
        	type : 'POST',
        	dataType : 'json',
        	success : function(result) {
            	if (result == true) {
                	$("#label1").css("color", "black").text("사용 가능한 ID 입니다.");
                	return true;	
            	}
            	
            	if (result == false){
                	$("#label1").css("color", "red").text("사용 불가능한 ID 입니다.");
                	$("#id").val('');
                	return false;
            	}
        	}
    	});
	}
	
	function createInput(type,name,value) {
		let input = document.createElement('input'); //input 생성
			input.setAttribute('type', 'text');
			input.setAttribute('name', 'id');
			input.setAttribute('value', id);
		return input
	}
	
	function registerPost() {
		let form = document.createElement('form'); //form 생성
			form.setAttribute('method','post');
			form.setAttribute('action','/member/register');
		
		let types = ['text', 'password', 'email', 'text', 'text', 'text'];
		let names = ['id', 'pwd', 'email', 'name',' address', 'phonenumber'];
		
		for(let i = 0; i<names.length;i++){
			let value = document.getElementById(names[i]).value;
			let input = createInput(types[i], names[i], value);
			form.appendChild(input);
		}
		
		//폼을 본문에 추가
    	document.body.appendChild(form);
		
		// 폼 제출
    	form.submit();
	}		
</script>
</html>
