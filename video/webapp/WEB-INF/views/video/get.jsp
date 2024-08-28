<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="../resources/css/get.css" rel="stylesheet" type="text/css">
</head>
<body>
    <header>
        <a href="#"><img src="/resources/img/main.png" alt="Logo"></a>
        <form action="#" method="get" class="Search">
            <input type="text" name="name" placeholder="검색" aria-label="Search">
            <input type="submit" value="Search">
        </form>
        <div>
            <input type="button" value="업로드">
            <input type="button" value="계정">
        </div>
    </header>
    <main>
        <Video controls width="800px"
            src="/resources/static/upload/${videoDto.videoName}">
        </Video>
        <div class="comment">
            <input type="text" placeholder="댓글 추가...">
            <input type="button" value="취소">
            <input type="button" value="댓글">
        </div>    
    </main>
</body>
</html>