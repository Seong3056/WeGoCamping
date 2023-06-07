<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>WeGoCamping</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/main.css">

<%@ include file="../include/header.jsp" %>
<article class="mainpage">
  <div class="today">오늘의 캠핑장</div>
  <div class="autoplay">
    <c:forEach var="camp" items="${campList}">
      <a href="${pageContext.request.contextPath}/detail/${camp.cno}" class="detail">
        <div class="box">

          <img src="${camp.firstImageUrl}" alt="camp${camp.cno}"
            onerror="this.src='${pageContext.request.contextPath}/img/campsiteOnerror.jpg'">
          <h2 class="name">${camp.facltNm}</h2>
          <p class="oneline">${camp.lineIntro}</p>
        </div>
      </a>
    </c:forEach>
  </div>

 <!--   <br><br><br>

 <h1>날씨</h1>

  <div class="weather"><a href="#">오늘 날씨</a></div>
  <div class="weather"><a href="#">이번주 날씨</a></div>
  <div class="weather"><a href="#">이번달 날씨</a></div>
  <div class="clearfix"></div>
  <div class="weatherInfo">날씨정보</div>
  <span><a href="#">더보기</a></span>
  <div class="clearfix"></div> -->
</article>

<%@ include file="../include/footer.jsp" %>