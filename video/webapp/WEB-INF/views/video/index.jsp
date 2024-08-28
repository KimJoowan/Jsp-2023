<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="../resources/css/index.css" rel="stylesheet" type="text/css">
</head>
<body>
    <header>
        <a href="#"><img src="/resources/img/main.png" alt="Logo"></a>
        <form action="#" method="get" class="Search">
            <input type="text" name="name" placeholder="검색" aria-label="Search">
            <input type="submit" value="Search">
        </form>
        <div>
            <a href="/video/upload"><input type="button" value="업로드"></a>
            <a href="/video/upload"><input type="button" value="계정"></a>
        </div>
    </header>
    <main>
        <section class="image-gallery">
        	<c:forEach var="dto" items="${videoDto}">
    			 <a href="/video/get?acode=${dto.acode}"><img src="/resources/static/upload/${dto.imgName}" alt="Image description"></a>
			</c:forEach>
        </section>
    </main>
</body>
</html>