<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<!-- 차트 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<!-- Make sure you put this AFTER Leaflet's CSS -->
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
  integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
  crossorigin=""></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reservep/reserve.css">

<%@ include file="../include/header.jsp" %>

<article class="reservation">
  <form name="payForm" action="${pageContext.request.contextPath}/kakaoPay" class="item" method="post">
    <input type="text" name="itemName" id="" value="${camp.facltNm}">
    <input type="hidden" name="cno" value="${camp.cno}">
    <input name="partnerUserId" type="hidden" value="${login}">
    <div class="container">

      <div class="form-left">
        <h2>오시는 길</h2>
        <div id="mapid"></div>

      </div>

      <div class="form-right">

        <div class="line2">
          <div class="date">
            <h2>예약 날짜</h2>
            <input id="demo" type="text" name="daterange" value="01/01/2018 - 01/31/2018" />
          </div>

          <div class="rsvNum">

            <select name="quantity" id="quantity">
              <option value="0" selected hidden>인원수</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
            </select>
          </div>
        </div>
        <div class="line3">

          <div class="day1 day">

            <h3 id="day1Date">날짜</h3>
            <div class="ta">
              <p>최고기온 </p>
              <p id="day1Max" class="taMax"></p>
            </div>

            <div class="ta">
              <p>최저기온 </p>
              <p id="day1Min" class="taMin"></p>
            </div>

            <p>날씨</p>
            <p></p>
          </div>

          <div class="day3 day">
            <h3 id="day3Date">날짜</h3>
            <div class="ta">
              <p>최고기온 </p>
              <p id="day3Max" class="taMax"></p>
            </div>

            <div class="ta">
              <p>최저기온 </p>
              <p id="day3Min" class="taMin"></p>
            </div>
            
          </div>



        </div>

        <div class="line35">
          <div style="width: 500px; height: 230px;">
            <!--차트가 그려질 부분-->
            <canvas id="myChart"></canvas>
          </div>
        </div>

        <div class="line4">
          <h2>금액: </h2>
          <input type="text" name="amount" value="${camp.amount}" readonly>
          <img id="payBtn" src="${pageContext.request.contextPath}/img/kakao/payment_icon_yellow_small.png" alt="카카오페이">
        </div>

      </div>





    </div>
  </form>
</article>

<%@ include file="../include/footer.jsp" %>
<!-- jQuery -->

<!-- iamport.payment.js -->

<!-- <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script> -->

<script>
  var mymap = L.map("mapid").setView(["${camp.mapY}", "${camp.mapX}"], 16);
  var maker = L.marker(["${camp.mapY}", "${camp.mapX}"]).addTo(mymap);
  L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
  }).addTo(mymap);

  const today = new Date();
  const year = today.getFullYear();
  const month = today.getMonth() + 1;
  const day = today.getDate();

  const date = year + '-' + month + '-' + day;
  const nextDate = year + '-' + month + '-' + (day + 1);


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
    "startDate": date,
    "endDate": nextDate,
    "opens": "right"
  }, function (start, end, label) {
    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') +
      ' (predefined range: ' + label + ')');
  });
  document.getElementById('payBtn').onclick = () => {
    console.log('결제버튼이 눌림');
    const $qtt = document.getElementById('quantity').value;
    console.log($qtt);



    if ($qtt == 0) {
      alert('인원수를 선택해주세요!');
      document.getElementById('quantity').focus();
      return;
    } else if ("${login}" === '') {
      alert('결제를 위해 로그인화면으로 이동합니다.');
      location.href = "${pageContext.request.contextPath}/user/login?cno=${camp.cno}";
    } else document.payForm.submit();
  };

  // document.getElementById('demo').onchange = () => {

  //   let addr = "${camp.addr}";
  //   console.log(addr);
  //   addr = addr.substring(0, addr.indexOf('원') + 1);
  //   console.log(addr);

  //   var xhr = new XMLHttpRequest();
  //   var url = 'http://apis.data.go.kr/1360000/MidFcstInfoService/getMidFcst'; /*URL*/
  //   var queryParams = '?' + encodeURIComponent('serviceKey') + '=' +
  //     'JS7jeuof%2BpwfeEbRwoql%2BWry6jw2GgIJlD3GWpVjjxNvEQSSGIc6HaD90Rg3u48tnw6LVidKVigCK2YAxGc4Hw%3D%3D'; /*Service Key*/
  //   queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
  //   queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
  //   queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('XML'); /**/
  //   queryParams += '&' + encodeURIComponent('regId') + '=' + '11D20501'; /**/
  //   queryParams += '&' + encodeURIComponent('tmFc') + '=' + encodeURIComponent('202306030600'); /**/
  //   var q =
  //     'http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa?serviceKey=JS7jeuof%2BpwfeEbRwoql%2BWry6jw2GgIJlD3GWpVjjxNvEQSSGIc6HaD90Rg3u48tnw6LVidKVigCK2YAxGc4Hw%3D%3D&numOfRows=10&pageNo=1&regId=11D20501&tmFc=202306020600';
  //   xhr.open('GET', q);
  //   xhr.onreadystatechange = function () {
  //     if (this.readyState == 4) {
  //       console.log('Status: ' + this.status);
  //       console.log('nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()));
  //       console.log('nBody: text ' + this.responseText);
  //       console.log('nBody: json ' + this.responseXML);
  //       alert('Status: ' + this.status + 'nHeaders: ' + JSON.stringify(this.getAllResponseHeaders()) + 'nBody: ' +
  //         this.responseText);
  //       document.getElementById('weather').textContent = this.responseText;
  //       var XmlNode = new DOMParser().parseFromString(this.responseText, 'text/xml');
  //       var data = xmlToJson(XmlNode);
  //       console.log(data.response.body.items.item.regId);
  //       // response: 
  //       //     body: 
  //       //         items: 
  //       //             item: regId
  //     }
  //   };
  // }


  /*-----------------------------------카카오 페이---------------------------------------------*/
  // document.getElementById('pay').onclick =()=>{
  //   var IMP = window.IMP; // 생략가능
  //   IMP.init('imp71301643'); 
  //   // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
  //   // ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
  //   IMP.request_pay({
  //     pg: 'kakao',
  //     pay_method: 'card',
  //     merchant_uid: 'merchant_' + new Date().getTime(),
  //     /* 
  //     *  merchant_uid에 경우 
  //     *  https://docs.iamport.kr/implementation/payment
  //     *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
  //     */
  //     name: '${camp.facltNm}',
  //     // 결제창에서 보여질 이름
  //     // name: '주문명 : ${auction.a_title}',
  //     // 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
  //     amount: 44000,
  //     // amount: ${bid.b_bid},
  //     // 가격 
  //     buyer_name: '${login}',
  //     // 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
  //     // 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
  //     buyer_postcode: '123-456',
  //     }, function (rsp) {
  //       console.log(rsp);
  //     if (rsp.success) {
  //       var msg = '결제가 완료되었습니다.';
  //       msg += '결제 금액 : ' + rsp.paid_amount;
  //       // success.submit();
  //       // 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
  //       // 자세한 설명은 구글링으로 보시는게 좋습니다.
  //     } else {
  //       var msg = '결제에 실패하였습니다.';
  //       msg += '에러내용 : ' + rsp.error_msg;
  //     }
  //     alert(msg);
  //   });
  // }
</script>


<script type="text/javascript">
  document.getElementById('demo').onchange = () => {
    const now = new Date();
    const date = document.getElementById('demo').value;
    const start = date.substring(0, 10);
    console.log("날짜분해" + parseInt(start.substring(0, 5)),
      parseInt(start.substring(6, 9)) - 1,
      parseInt(start.substring(8)));
    const startDate = new Date(
      parseInt(start.substring(0, 5)),
      parseInt(start.substring(6, 9)) - 1,
      parseInt(start.substring(8)));

    const end = date.substring(13, 23);
    const endDate = new Date(
      parseInt(end.substring(0, 5)),
      parseInt(end.substring(6, 9)) - 1,
      parseInt(end.substring(8)));
    const d = new Date(now.getFullYear(), now.getMonth(), now.getDate());
    console.log("몇년몇월몇일: " + start);
    console.log(end);

    const getDateDiff = (d1, d2) => {
      const date1 = new Date(d1);
      const date2 = new Date(d2);

      const diffDate = date1.getTime() - date2.getTime();

      return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
    }


    console.log("출발: " + startDate + "도착: " + endDate);
    fetch('${pageContext.request.contextPath}/weather/${camp.cno}')
      .then(rs => rs.json())
      .then(data => {

        const taMin = [
          data[0].taMin3,
          data[0].taMin4,
          data[0].taMin5,
          data[0].taMin6,
          data[0].taMin7,
          data[0].taMin8,
          data[0].taMin9,
          data[0].taMin10
        ];
        const taMax = [
          data[0].taMax3,
          data[0].taMax4,
          data[0].taMax5,
          data[0].taMax6,
          data[0].taMax7,
          data[0].taMax8,
          data[0].taMax9,
          data[0].taMax10
        ];

        
         



        const putTa = (d1, d2, day) => {
          
          const d = parseInt(getDateDiff(d1, d2));
          console.log("날짜차이:" + d);
          
          if (d - 3 < 0 || d > 10) return;
          console.log("최고기온 " + taMax[d - 3]);
          if (day === 'day1') {
            document.getElementById('day1Date').textContent = start.substring(5);
            document.getElementById('day1Max').textContent = taMax[d - 3] + '℃';
            document.getElementById('day1Min').textContent = taMin[d - 3] + '℃';
          } else if (day === 'day3') {
            document.getElementById('day3Date').textContent = end.substring(5);
            document.getElementById('day3Max').textContent = taMax[d - 3] + '℃';
            document.getElementById('day3Min').textContent = taMin[d - 3] + '℃';
          }

        }
        putTa(startDate, new Date(), 'day1');
        putTa(endDate, new Date(), 'day3');
         /*---------------------------------------------------------------------------*/
          //그래프 영역
          
          
          const DATA_COUNT = getDateDiff(startDate,endDate);
          const DATA_CALC = getDateDiff(new Date(),startDate);
          if(DATA_CALC > 10) return;
          // console.log(DATA_COUNT - 3 < 0 || DATA_COUNT > 10);
          // console.log(getDateDiff(startDate,endDate));
          const labels = [];
          document.getElementById('')
          for (let i = 0; i < DATA_COUNT; ++i) {
        	  let fromTOdate = new Date(startDate.setDate(startDate.getDate()+1))
              console.log("from "+fromTOdate);
              let StringDate = (fromTOdate.getMonth()+1) + '/' + fromTOdate.getDate()
              console.log("String "+StringDate);
              labels.push(StringDate);
          }
          
          const dataMax = [];
          const dataMin = [];
          for (let i = 0; i < DATA_COUNT; i++) {
            if(DATA_CALC+i<2){
              dataMax.push(NaN);
              dataMin.push(NaN);
            }else{
              dataMax.push(taMax[i]);
              dataMin.push(taMin[i]);
            }
            
          }
          console.log("최고기온 배열값:" + taMax);
          const datad = {
            labels: labels,
            datasets: [{
              label: '최고기온',
              data: dataMax,
              borderColor: 'rgb(224, 92, 92)',
              fill: false
              
            }, {
              label: '최저기온',
              data: dataMin,
              borderColor: 'rgb(135, 135, 240)',
              fill: false
              
            }]
          };
          const config = {
            type: 'line',
            data: datad,
            options: {
              responsive: true,
              plugins: {
                title: {
                  display: true,
                  text: 'Chart.js Line Chart - Cubic interpolation mode'
                },
              },
              interaction: {
                intersect: false,
              },
              scales: {
                'y': {
                  type: 'linear',
                  display: true,
                  position: 'left'
                }
                
              
              }
            },
          };
          var context = document.getElementById('myChart').getContext('2d');
          var myChart = new Chart(context, config);
          /*---------------------------------------------------------------------------*/






      });
  }
</script>