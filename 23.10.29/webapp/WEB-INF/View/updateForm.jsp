<%@page import="cs.dit.board.BoardDao"%>
<%@page import="cs.dit.board.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>  
<%@ page import = "java.util.List, java.sql.Date" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<title>게시판</title>
</head> 
<body>  
<div class="container">
	<h2 class="text-center font-weight-bold">상세보기</h2>
	<br/>
	<form action="update.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bcode" value="${dto.bcode}" id="bcode">
		<table class="table table-striped table-hover">
			<tr>
				<th>bcode</th><td>${dto.bcode}</td>
				<th>subject</th><td><input type="text" value="${dto.subject}" name="subject"></td>
			</tr>
			<tr>
				<th>content</th>
				<td colspan="3"><textarea rows="10" cols="80" name="content">${dto.content}</textarea></td>	
			</tr>
			<tr>
				<th>writer</th><td><input type="text" value="${dto.writer}" name="writer"></td>
				<th>regDate</th><td><input type="text" value="${dto.regDate}" name="regDate"></td>
			</tr>
			<tr>
				<th>기준파일</th><td><a download href="uploadfiles/${dto.filename}">${dto.filename}</a></td>
				<th>변경파일</th><td><input type="file" class="form-control" id="filename" name="filename"></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" value ="게시글 수정" >
					<input type="button" value ="게시글 삭제" onclick ="location.href='delete.do?bcode=${dto.bcode}'">
					<input type="button" value ="게시글 목록" onclick ="location.href='list.do'">
					<input type="button" value ="게시글 등록" onclick ="location.href='insertForm.do'">
				</td>
			</tr>
		</table><br>	
	</form>
</div>
<!-- 댓글달기 -->
<div class="container">
	<table class="table" style="text-align: center; border: 1px solid #dddddd; ">
		 <tr>
			<td style="background-color: #fafafa; text-align: center">댓글: </td>
			<td><input class="form-control" type="text" id="comments" size="80"></td>
			<td colspan="2"><button class="btn btn-primary pull-right" onclick="insertComments();">작성</button></td>
		</tr>
	</table>
	<table class="table" style="text-align: center; border:1px solid #dddddd">
		<tbody id="commentsTable">
		</tbody>
	</table>
</div>	
<script type="text/javascript">

		var xhr1 = new  XMLHttpRequest(); // listComments
		var xhr2 = new  XMLHttpRequest(); // insetComments
		var bcode = document.getElementById("bcode").value;
		
		function listComments() {
			var commentsTable = document.getElementById("commentsTable");
			commentsTable.innerHTML = "";
			
			//상태가 변화되었을때 실행하면 이벤트 프로세서
			xhr1.onreadystatechange = function () {
				if(this.readyState == 4 && this.status == 200){
					console.log(this.responseText);

					var json = this.responseText;
					var list = JSON.parse(json); //JSON 형식의 문자열를 자바스크립트 객체로 변환함.
					console.log(list);
					
					for(var i in list){
						var row = commentsTable.insertRow();
						var cell1 = row.insertCell(0);
						var cell2 = row.insertCell(1);
						var cell3 = row.insertCell(2);
						cell1.innerHTML = list[i].ccode;
						cell2.innerHTML = list[i].content;
						cell3.innerHTML = list[i].regdate;
					}
				}		
			};
			
			xhr1.open("POST", "/board-MyBatis/comments/listComments", true);
			xhr1.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr1.send('bcode='+ bcode);	
		}
		
		function insertComments() {
			var comments =  document.getElementById("comments").value;
			
			xhr2.onreadystatechange = function () {
				if(this.readyState == 4 && this.status == 200){
					document.getElementById("comments").value ="";
					listComments();
				}
			};
				
				xhr2.open("POST", "/board-MyBatis/comments/insertCommments", true);
				xhr2.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				var data = 'comments=' + comments + '&bcode='+ bcode;
				xhr2.send(data);
					

		}
		
		//이파일이 실행되자마자 listComments 함수호출
		window.onload = function(){listComments()}; 

	</script>
</body>
</html>