<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/main.css">
       
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



