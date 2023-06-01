<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 웹폰트 적용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">

<title>예약하기</title>

<!--달력-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<!-- 지도 -->
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
  integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
  crossorigin="" />

<!-- Make sure you put this AFTER Leaflet's CSS -->
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
  integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
  crossorigin=""></script>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reservep/reserve.css">


<%@ include file="../include/header.jsp" %>

<article class="reservation">
  <h1>캠핌장명</h1>
  <div class="container">
    <div class="item">
      <h2>오시는 길</h2>
      <div id="mapid"></div>

    </div>

    <div class="item">
      <h2>예약 날짜</h2>
      <input id="demo" type="text" name="daterange" value="01/01/2018 - 01/31/2018" />


      <div class="weather">날씨</div>


      <div class="number">
        <h2>예약 인원</h2>
      </div>
      <select>
        <option value="0">인원수</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>


      </select>


    </div>


  </div>

  <div class="reservationbtn"><button>예약하기</button></div>



  <script>
    var mymap = L.map("mapid").setView([37.5525301, 126.937759], 17);

    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19,
      attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(mymap);
  </script>

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
</article>

<%@ include file="../include/footer.jsp" %>