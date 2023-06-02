<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 웹폰트 적용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">

<!--달력-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/around/detail.css">




<title>상세보기</title>


<%@ include file="../include/header.jsp" %>
<article class="detail">

  
  <div class="container">
    <div class="campImg">
      <img src="${camp.firstImageUrl}" alt="camp1">
    </div>

    <div class="item">
      <div class="campNm">
        <h2><a href="${camp.homepage}">${camp.facltNm}</a></h2>
        <p class="guide">클릭하면 홈페이지로 이동합니다.</p>
      </div>

      <p class="detailInfo">${camp.intro}</p>
      <!-- <input id="demo" type="text" name="dateRange" value="01/01/2018 - 01/31/2018" /> -->
      <div class="campInfo cc">
        <a class="add">전화번호: ${camp.tel}</a>
        <p class="addr">주소: ${camp.addr}</p>
      </div>

      <div class="campAdd cc">
        <p class="add">테마: ${camp.induty}</p>
        <p class="add">별점: </p>
      </div>    

    </div>
  </div>
  <div class="btnGroup">    
    <button class="btn1">목록</button>
    <button class="btn2">예약하기</button>
  </div>
</article>

<%@ include file="../include/footer.jsp" %>

<script>
  $('#demo').daterangepicker({
    "autoApply": true,
    "locale": {
      "format": "YYYY/MM/DD",
      "separator": " - ",
      "applyLabel": "적용",
      "cancelLabel": "취소",
      "fromLabel": "입실",
      "toLabel": "퇴실",
      "customRangeLabel": "Custom",
      "weekLabel": "W",
      "daysOfWeek": [
        "일",
        "월",
        "화",
        "수",
        "목",
        "금",
        "토"
      ],
      "monthNames": [
        "1월",
        "2월",
        "3월",
        "4월",
        "5월",
        "6월",
        "7월",
        "8월",
        "9월",
        "10월",
        "11월",
        "12월"
      ],
      "firstDay": 1
    },
    "linkedCalendars": false,
    "alwaysShowCalendars": true,
    "startDate": "2023/05/31",
    "endDate": "2023/06/30",
    "opens": "right"
  }, function (start, end, label) {
    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') +
      ' (predefined range: ' + label + ')');
  });
</script>