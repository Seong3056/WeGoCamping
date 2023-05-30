<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<<<<<<< HEAD
    <!-- 웹폰트 적용 -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
    
=======
>>>>>>> 1eae4cfb07bfe5a11338befcdd408c46cd828d83
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<<<<<<< HEAD
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/main.css">
=======
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainp/main.css">
>>>>>>> 1eae4cfb07bfe5a11338befcdd408c46cd828d83
       
        <title>main</title>
       <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
 <script src="${pageContext.request.contextPath}/js/slide.js"></script> 

 
    </head>
  <%@ include file="../include/header.jsp" %>
        <article class="mainpage">
        <div class="autoplay">
            <div class="box"><img src="${pageContext.request.contextPath}/img/cam1.jpg" alt="cam1"></div>
            <div class="box"><img src="${pageContext.request.contextPath}/img/cam1.jpg" alt="cam2"></div>
            <div class="box"><img src="${pageContext.request.contextPath}/img/cam1.jpg" alt="cam3"></div>
            <div class="box"><img src="${pageContext.request.contextPath}/img/cam1.jpg" alt="cam4"></div>
            <div class="box"><img src="${pageContext.request.contextPath}/img/cam1.jpg" alt="cam5"></div>
            <div class="box"><img src="${pageContext.request.contextPath}/img/cam1.jpg" alt="cam6"></div>
            <div class="box"><img src="${pageContext.request.contextPath}/img/cam1.jpg" alt="cam7"></div>
            <div class="box"><img src="${pageContext.request.contextPath}/img/cam1.jpg" alt="cam8"></div>
            <div class="box"><img src="${pageContext.request.contextPath}/img/cam1.jpg" alt="cam9"></div>

        </div>
        <br><br><br>

        <h1>날씨</h1>

        <div class ="weather"><a href="#">오늘 날씨</a></div>
        <div class ="weather"><a href="#">이번주 날씨</a></div>
        <div class ="weather"><a href="#">이번달 날씨</a></div>
        <div class ="clearfix"></div>
        <div class="weatherInfo">날씨정보</div>
        <span><a href="#">더보기</a></span>
        <div class ="clearfix"></div>
    </article>
    

<%@ include file="../include/footer.jsp" %>



