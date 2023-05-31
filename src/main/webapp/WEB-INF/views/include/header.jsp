<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/header-style.css" rel="stylesheet">



    <header>
        <div class="section">
            <img class="logo" src="${pageContext.request.contextPath}/img/logo.png" alt="logo">
            <a href="${pageContext.request.contextPath}/main" class="title" class="clearfix">Camping</a>

            <div class="menu clearfix">
                <div class="menu-down">
                    <a href="${pageContext.request.contextPath}/detail" class="in-menu" id="reservation">예약하기</a>
                    <div class="dropdown">
                        <a  href="#">지역검색</a>
                        <a  href="#">테마검색</a>
                        <a  href="#">날짜검색</a>
                    </div>
                </div>
                <div class="menu-down">
                    <a href="${pageContext.request.contextPath}/board/boardList" class="in-menu" id="board">게시판</a>
                    <div class="dropdown">
                        <a  href="#">캠핑후기</a>
                        <a  href="#">꿀팁공유</a>
                        <a  href="#">메이트찾기</a>
                        <a  href="#">건의사항</a>
                    </div>
                </div>
                <div class="menu-down">
                    <a href="${pageContext.request.contextPath}/around" class="in-menu" id="view">둘러보기</a>
                    <!-- <div class="dropdown">
                        <a  href="#">둘러보기</a>
                    </div> -->
                </div>
            </div>
            <div class="header-right">
                <input type="text" class="search clearfix" placeholder="검색어를 입력하세요.">
                <div class="profile">
                    <img class="profile-img" src="${pageContext.request.contextPath}/img/profile.png" alt="profile">
                    <a href="${pageContext.request.contextPath}/user/login" class="user">홍길동님</a>
                </div>
            </div>
        </div>
        <div class="section-dropdown">

        

        </div>
    </header>
<script>
    document.querySelector('.header-right').onclick = () =>{
        
    }
</script>