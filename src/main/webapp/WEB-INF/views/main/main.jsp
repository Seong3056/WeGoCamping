<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!-- 웹폰트 적용 -->
         <link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
    

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        

       
        <title>WeGoCamping</title>
       <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 

    <title>WeGoCamping</title>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
    <script src="${pageContext.request.contextPath}/js/slide.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/main.css">


</head>
<%@ include file="../include/header.jsp" %>
<article class="mainpage">
  <%-- <c:forEach var="camp" items="${campList}">
          	<div id="${camp.cno}" class="col-md-4">
              <div class="thumbnail">
                <a href="${pageContext.request.contextPath}/detail" class="detail">
                  <img src="${camp.firstImageUrl}" alt="camp1" style="width:100%;height:217px" onerror="this.src='${pageContext.request.contextPath}/img/onerror.jpg'">
                   </a>
                  <div class="caption"> 
                    <h2>${camp.facltNm}</h2>
                    <p>-${camp.lineIntro}</p>
                    <hr>
                    <button>예약하기</button>
                    </div>
                  
                      </div>
                    </div>
                                          
          </c:forEach> --%>
 

 
 
    <div class="today">오늘의 캠핑장</div>
    <div class="autoplay">
    <%-- <c:forEach var="camp" items="${campList}">
    <div class="box">
    <img src="${camp.firstImageUrl}" alt="cam1" onerror="this.src='${pageContext.request.contextPath}/img/onerror.jpg'">
    <h2 class="name">${camp.facltNm}</h2>
    <p class="oneline">${camp.lineIntro}</p>
    </div>
    </c:forEach>  --%>
  
    <c:forEach var="camp" items="${campList}">
    	<div class="box">
    		<img src="${camp.firstImageUrl}" alt="camp${camp.cno}" onerror="this.src='${pageContext.request.contextPath}/img/onerror.jpg'">
    		<h2 class="name">${camp.facltNm}</h2>
    		<p class="oneline">${camp.lineIntro}</p>
    	</div>
    </c:forEach>
           
    </div>
   
    <br><br><br>

    <h1>날씨</h1>

    <div class="weather"><a href="#">오늘 날씨</a></div>
    <div class="weather"><a href="#">이번주 날씨</a></div>
    <div class="weather"><a href="#">이번달 날씨</a></div>
    <div class="clearfix"></div>
    <div class="weatherInfo">날씨정보</div>
    <span><a href="#">더보기</a></span>
    <div class="clearfix"></div>
</article>

<%@ include file="../include/footer.jsp" %>

