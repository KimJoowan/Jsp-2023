<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="../resources/css/upload.css" rel="stylesheet" type="text/css">
</head>
<body>
    <header>
        <a href="#"><img src="/resources/img/main.png" alt="Logo"></a>
        <form action="#" method="get" class="Search">
            <input type="text" name="search" placeholder="검색" aria-label="Search">
            <input type="submit" value="검색">
        </form>
        <div>
            <a href="/video/upload"><input type="button" value="업로드"></a>
            <a href="/video/upload"><input type="button" value="계정"></a>        
       </div>
    </header>
    <main>
        <div class="upload">
            <h1>영상 업로드</h1><hr>
            <form action="/video/upload" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" id="title" name="title" placeholder="영상 제목 입력" required>
                </div>
                <div class="form-group">
                    <label for="explanation">설명</label>
                    <input type="text" id="explanation" name="explanation" placeholder="영상 설명 입력" required>
                </div>
                <div class="form-group">
                    <label for="uploadimg">썸네일</label>
                    <input type="file" id="uploadimg" name="uploadimg" accept="image/*" required>
                </div>
                <div class="form-group">
                    <label for="uploadfile">영상 파일</label>
					<input type="file" id="uploadfile" name="uploadfile" accept="video/*" required>
                </div>
                <div class="form-group">
                    <input type="submit" value="업로드">
                </div>
            </form>
        </div>
    </main>
</body>
</html>