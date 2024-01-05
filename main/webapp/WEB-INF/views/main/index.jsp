<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>
		body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            align-items: center;
            flex-direction: column; /* 항목을 세로로 정렬 */
            height: 100vh;
        }

        header{
            padding: 30px;        
        }

        nav{
            padding: 0 30px 30px 30px;
            margin: 0 0 0 0; 

        }

        section{
            text-align: center; 
            
        }

        footer{
            padding: 10px;
            margin: 10px 0 20px 0; 
        }
/*-------------------------------------------------------------*/
/*그릇 툴*/
/*-------------------------------------------------------------*/
		.main-search-container{ 
            background-color: #fff;
            margin: 30px 50px 10px 50px;
            padding: 0 20px 0 20px;
            border-radius: 8px; /*요소의 둥근 모서리*/

        }

        .slideshow-container{ 
            background-color: #fff;
            margin: 0 0 100px 0;
            padding: 0 auto 50px auto;
            border-radius: 8px; /*요소의 둥근 모서리*/
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .footer-container{
            background-color: #fff;
            margin: 0 50px 10px 50px;
            padding: 0 20px 20px 20px;
            text-align: center;
        }

/*-------------------------------------------------------------*/
/*세부적인 디자인*/
/*-------------------------------------------------------------*/		
		.product-select{
			width: 25px;
			height: 25px;
		}

		.main-search{
            text-align: center;
        }

		input[type="text"]{
            margin-right: 20px;
            border-radius: 20px; /*요소의 둥근 모서리*/
            width: 600px;
            height: 50px;
        }

        input[type="submit"]{
            width: 70px;
            height: 50px;
        }

        .mySlides {
            display: none;
        }

        /* Style for the navigation dots */
        .dot {
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

        .active {
            background-color: #717171;
        }

	</style>
</head>
<body>
<header >
        <div class="main-search-container">
            <form class="main-search">
                <input type="text" placeholder="검색어를 입력해주세요">
                <input type="submit" value="검색">
            </form>
        </div>     
    </header>
<!--========================================================================================================================================-->
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  		<a class="navbar-brand" href="#">Navbar</a>
  		<div class="collapse navbar-collapse justify-content-start align-items-center" id="collapsibleNavbar"> 
 		<ul class="navbar-nav ml-auto">
			<li class="nav-item">
				<a class="nav-link" href="#">Link</a>
	  		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="#">Link</a>
      		</li> 
      		<li class="nav-item">
        		<a class="nav-link" href="#">Link</a>
      		</li>  
      		<li class="nav-item">
        		<a class="nav-link" href="#">Link</a>
      		</li>  
      		<li class="nav-item dropdown ml-auto">
        		<a class="nav-link dropdown-toggle" href="#" id="navbardrop"  data-toggle="dropdown">내정보</a>
        		<div class="dropdown-menu dropdown-menu-right">
          			<a class="dropdown-item" href="/member/login">로그인</a>
          			<a class="dropdown-item" href="/member/joinmembership">회원가입</a>
        		</div>
      		</li>
  		</ul>
  		</div>  
	</nav>
<!--========================================================================================================================================-->
    <section>
        <article>
            <div class="slideshow-container">
                <!-- Slides -->
                <div class="mySlides">
                    <img src="https://www.w3schools.com/howto/img_nature_wide.jpg" alt="Slide 1">
                </div>
                
                <div class="mySlides">
                    <img src="https://www.w3schools.com/howto/img_snow_wide.jpg" alt="Slide 2">
                </div>
                
                <div class="mySlides">
                    <img src="https://www.w3schools.com/howto/img_lights_wide.jpg" alt="Slide 3">
                </div>
                
                    <!-- Navigation dots -->
                <div style="text-align: center; margin-top: 20px;">
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                </div>
            </div>
        </article>
    </section>
<!--========================================================================================================================================-->
    <footer>
        <div class="footer-container">
            <hr><p>Copyright © 2018 tcpschool.co.,Ltd. All rights reserved.</p>
            <address>Contact webmaster for more information. 070-1234-5678</address>
        </div>
    </footer> 
<!--========================================================================================================================================-->
<script>
    // JavaScript for the slideshow functionality
    let slideIndex = 0;
    showSlides();

    function showSlides() {
        let i;
        const slides = document.getElementsByClassName("mySlides");
        const dots = document.getElementsByClassName("dot");

        // Hide all slides
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }

        // Increment the slide index
        slideIndex++;

        // Reset the index if it exceeds the number of slides
        if (slideIndex > slides.length) {
            slideIndex = 1;
        }

        // Display the current slide
        slides[slideIndex - 1].style.display = "block";

        // Remove the 'active' class from all dots
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }

        // Add the 'active' class to the current dot
        dots[slideIndex - 1].className += " active";

        // Set the timeout for the next slide
        setTimeout(showSlides, 2000); // Change slide every 2 seconds
    }
</script>

</body>
</html>