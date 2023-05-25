<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/header-style.css" rel="stylesheet">
</head>
<body>
    <header>
        <div class="section">
            <img class="logo" src="${pageContext.request.contextPath}/img/logo.png" alt="logo">
            <div class="title" class="clearfix">Camping</div>

            <div class="menu clearfix">
                <div class="menu-down">
                    <a href="#" class="in-menu" id="reservation">예약하기</a>                    
                </div>                
                <div class="menu-down"><a href="#" class="in-menu" id="view">캠핑장 둘러보기</a></div>
                <div class="menu-down"><a href="#" class="in-menu" id="board">게시판</a></div>
                
                
                
                <!-- <div class="in-menu" id="reservation">예약하기</div>
                <div class="in-menu" id="view">캠핑장 둘러보기</div>
                <div class="in-menu" id="board">게시판</div> -->
            </div>
            <div class="header-right">
                <input type="text" class="search clearfix" placeholder="검색어를 입력하세요.">
                <div class="profile">
                    <img class="profile-img" src="${pageContext.request.contextPath}/img/profile.png" alt="profile">
                    <a href="#" class="user">홍길동님</a>
                </div>
            </div>
        </div>
        <div class="section-dropdown">

        </div>
        <div></div>
    </header>
</body>
</html>