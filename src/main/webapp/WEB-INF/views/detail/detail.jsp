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
    
   
    
    
    <title>Detail</title>


 <%@ include file="../include/header.jsp" %>
<article class="detail">
    
    <h1>캠핑장 상세보기</h1>
    <div class="container">
    <div class="item"><img src="${pageContext.request.contextPath}/img/cam1.jpg" alt="detailcam1"></div>
    
    <div class="item"><h2>캠핑장명</h2>
    
    <p class="detailinfo">상세정보 가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하</p>

    <div class="weather"><h3>날씨 정보</h3> <input id="demo" type="text" name="daterange" value="01/01/2018 - 01/31/2018" /></div>
    
    </div>
    </div>
    <button class="btn1">목록</button>
    <button class="btn2">예약하기</button>
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
}, function(start, end, label) {
console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
});
      </script>