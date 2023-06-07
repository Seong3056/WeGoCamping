<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>카카오페이 결제 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pay.css">
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
  integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
  crossorigin="" />
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
  integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
  crossorigin=""></script>

<%@ include file="../include/header.jsp" %>

<section class="fin">

    <p class="h2">예약이 완료되었습니다.</p>
    <hr>
    <div class="camp-info">
        <img id="info" src="${info.img}" alt="thumbnail">
        <div id="mapid"></div>
    </div>
    <p class="h3">캠핑장명: ${info.itemName}</p>
    
    <p class="line">예약자명: ${info.name}</p>

    <div class="rsvPay line">
        <p>결제번호: ${info.payNum}</p>        
        <p>결제금액: ${info.amount}</p>        
    </div>

    <div class="rsvInfo line">
        <p>날짜: ${info.date}</p>
        <p>인원: ${info.quantity}명</p>
    </div>

    <div class="campInfo line">
        <p> ${info.tel}  </p>
        <p>${info.addr}</p>
    </div>

</section>
<%@ include file="../include/footer.jsp" %>


<script>
    var mymap = L.map("mapid").setView(["${info.mapY}", "${info.mapX}"], 16);
    var maker = L.marker(["${info.mapY}", "${info.mapX}"]).addTo(mymap);
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19,
      attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(mymap);
</script>