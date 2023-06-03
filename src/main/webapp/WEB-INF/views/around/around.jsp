<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 웹폰트 적용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/around/basic.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
  src="https://ajax.googlehttps://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.cssapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"
  defer /></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" defer></script>



<title>캠핑장 둘러보기</title>




<%@ include file="../include/header.jsp" %>

<article class="around">

  <h1>캠핑장 둘러보기</h1>
  <select class="sel1">
    <option value="0">지역</option>
    <option value="1">서울</option>
    <option value="2">경기</option>
    <option value="3">강원</option>
    <option value="4">충청</option>
    <option value="5">전라</option>
    <option value="6">경상</option>
    <option value="6">제주</option>
  </select>
  
  <select class="sel2">
    <option value="0">테마</option>
    <option value="1">일반야영장</option>
    <option value="2">글램핑</option>
    <option value="3">카라반</option>
    <option value="4">자동차야영장</option>
  </select>


  <c:forEach var="camp" items="${campList}">
    <div id="${camp.cno}" class="col-md-4">
      <div class="thumbnail">
        <a href="${pageContext.request.contextPath}/detail/${camp.cno}" class="detail">
          <img src="${camp.firstImageUrl}" alt="camp${camp.cno}" style="height:217px;"
            onerror="this.src='${pageContext.request.contextPath}/img/onerror.jpg'">
        </a>
        <div class="caption">
          <h2>${camp.facltNm}</h2>
          <p>${camp.lineIntro}</p>
          <hr>
          <button>예약하기</button>
        </div>

      </div>
    </div>



  </c:forEach>





  <!--     <div class="page">
        <div>이전</div>
        <div>1</div>
        <div>2</div>
        <div>3</div>
        <div>4</div>
        <div>5</div>
        <div>다음</div>
    </div>
     -->
</article>

<%@ include file="../include/footer.jsp" %>