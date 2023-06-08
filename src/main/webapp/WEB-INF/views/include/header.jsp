<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://kit.fontawesome.com/a2baf29734.js" crossorigin="anonymous"></script>
  <!-- 웹폰트 적용 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">

  <!-- 제이쿼리 -->
  <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>

  <!-- 부트스트랩 -->
  <script src="https://kit.fontawesome.com/a2baf29734.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lumen/bootstrap.min.css"
    integrity="sha384-GzaBcW6yPIfhF+6VpKMjxbTx6tvR/yRd/yJub90CqoIn2Tz4rRXlSpTFYMKHCifX" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
  <script src="${pageContext.request.contextPath}/js/slide.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lumen/bootstrap.min.css"
    integrity="sha384-GzaBcW6yPIfhF+6VpKMjxbTx6tvR/yRd/yJub90CqoIn2Tz4rRXlSpTFYMKHCifX" crossorigin="anonymous">
  <!-- 부트스트랩 끝 -->

  <link href="${pageContext.request.contextPath}/css/header-style.css" rel="stylesheet">
</head>

<header>
  <div class="section">
    <img class="logo" src="${pageContext.request.contextPath}/img/logo.png" alt="logo">
    <a href="${pageContext.request.contextPath}/" class="title" class="clearfix">WeGoCamping</a>
    <div class="menu clearfix">
      <div class="menu-down">
        <a href="${pageContext.request.contextPath}/around?location=&theme=" class="in-menu" id="reservation">예약하기</a>
        <div class="dropdown">
          <a id="locationSearch" href="#" data-toggle="modal">지역검색</a>
          <a id="themeSearch" href="#" data-toggle="m2">테마검색</a>
        </div>
      </div>
      <div class="menu-down">
        <a href="${pageContext.request.contextPath}/board/boardList" class="in-menu" id="board">게시판</a>
        <div class="dropdown">
          <a href="${pageContext.request.contextPath}/board/boardList?cls=1">캠핑후기</a>
          <a href="${pageContext.request.contextPath}/board/boardList?cls=2">꿀팁공유</a>
          <a href="${pageContext.request.contextPath}/board/boardList?cls=3">메이트찾기</a>
          <a href="${pageContext.request.contextPath}/board/boardList?cls=4">건의사항</a>
        </div>
      </div>
    </div>
    <div class="header-right">
      <!--  <input type="text" class="search clearfix" placeholder="검색어를 입력하세요.">
              <a href=#><i class="fa fa-search" aria-hidden="true"></i></a> -->
      <div id="loginA" style="display: none;">
        <div class="profile">
          <img class="profile-img" src="${pageContext.request.contextPath}/img/profile.png" alt="profile">
          <a href="${pageContext.request.contextPath}/user/info" class="user">${name} (${login})님</a>
        </div>
        <button class="btn btn-secondary loginBtn" id="logout"
          onclick="location.href='${pageContext.request.contextPath}/user/logout'">로그아웃</button>
      </div>
      <div id="notLogin">
        <button class="btn btn-secondary loginBtn" id="loginH"
          onclick="location.href='${pageContext.request.contextPath}/user/login'">로그인</button>
      </div>
    </div>
  </div>
  <div class="section-dropdown">
  </div>

  <!-- 모달창 -->
  <div id="location" class="modal hidden">
    <div class="bg"></div>
    <div class="modalBox">
      <h2>지역을 선택해주세요</h2>
      <button onclick='location.href="${pageContext.request.contextPath}/around?location=서울&theme=${theme}"'
        class="btn btn-secondary">서울</button><br>
      <button onclick='location.href="${pageContext.request.contextPath}/around?location=경기&theme=${theme}"'
        class="btn btn-secondary">경기</button><br>
      <button onclick='location.href="${pageContext.request.contextPath}/around?location=강원&theme=${theme}"'
        class="btn btn-secondary">강원</button><br>
      <button onclick='location.href="${pageContext.request.contextPath}/around?location=충청&theme=${theme}"'
        class="btn btn-secondary">충청</button><br>
      <button onclick='location.href="${pageContext.request.contextPath}/around?location=전라&theme=${theme}"'
        class="btn btn-secondary">전라</button><br>
      <button onclick='location.href="${pageContext.request.contextPath}/around?location=경상&theme=${theme}"'
        class="btn btn-secondary">경상</button><br>
      <button onclick='location.href="${pageContext.request.contextPath}/around?location=제주&theme=${theme}"'
        class="btn btn-secondary">제주</button><br>
      <button class="closeBtn btn btn-secondary">✖</button>
    </div>
  </div>

  <div class="m2 h2">
    <div class="bg2"></div>
    <div class="mB2">
      <h2>테마를 선택해주세요</h2>
      <button onclick="location.href='${pageContext.request.contextPath}/around?location=${location}&theme=일반야영장'"
        class="btn btn-secondary">일반 야영장</button><br>
      <button onclick="location.href='${pageContext.request.contextPath}/around?location=${location}&theme=글램핑'"
        class="btn btn-secondary">글램핑</button><br>
      <button onclick="location.href='${pageContext.request.contextPath}/around?location=${location}&theme=카라반'"
        class="btn btn-secondary">카라반</button><br>
      <button onclick="location.href='${pageContext.request.contextPath}/around?location=${location}&theme=자동차야영장'"
        class="btn btn-secondary">자동차 야영장</button><br>
      <button class="cB2 btn btn-secondary">✖</button>
    </div>
  </div>
</header>
<img src="${pageContext.request.contextPath}/img/campillu.png" alt="" id="background-left">
<img src="${pageContext.request.contextPath}/img/left.gif" alt="" id="background-right">
<img src="${pageContext.request.contextPath}/img/moon2.png" alt="" id="moon">
<img src="${pageContext.request.contextPath}/img/hae.png" alt="" id="hae">
<script>
  console.log(" ${login}");
  if ("${login}" !== '') {
    document.getElementById('loginA').style.display = 'flex';
    document.getElementById('notLogin').style.display = 'none';
  } else {
    document.getElementById('loginA').style.display = 'none';
    document.getElementById('notLogin').style.display = 'block';
  };

  // 프로필 구역 누르면 이동 가능하게 처리.
  document.querySelector('.profile').addEventListener('click', (e) => {
    e.preventDefault();

    location.href = document.querySelector('.user').getAttribute('href');
  });

  const open = () => {
    document.querySelector(".modal").classList.remove("hidden");
  };

  const close = () => {
    document.querySelector(".modal").classList.add("hidden");
  };

  document.getElementById("locationSearch").addEventListener("click", open);
  document.querySelector(".closeBtn").addEventListener("click", close);
  document.querySelector(".bg").addEventListener("click", close);

  // <!-- 모달2 -->
  const op2 = () => {
    document.querySelector(".m2").classList.remove("h2");
  };

  const cl2 = () => {
    document.querySelector(".m2").classList.add("h2");
  };

  document.getElementById("themeSearch").addEventListener("click", op2);
  document.querySelector(".cB2").addEventListener("click", cl2);
  document.querySelector(".bg2").addEventListener("click", cl2);

  document.getElementById('location').onclick = (e) => {
    if (!e.target.matches('button')) return;

  }
  document.getElementById('moon').onclick = () => {
    document.getElementById('moon').setAttribute('src', '${pageContext.request.contextPath}/img/moon.png')
  }
</script>