<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/css/header-style.css" rel="stylesheet">



    <header>
        <div class="section">
            <img class="logo" src="${pageContext.request.contextPath}/img/logo.png" alt="logo">
            <a href="${pageContext.request.contextPath}/" class="title" class="clearfix">Camping</a>

            <div class="menu clearfix">
                <div class="menu-down">
                    <a href="${pageContext.request.contextPath}/around" class="in-menu" id="reservation">예약하기</a>
                    <div class="dropdown">
                        <a  href="#">지역검색</a>
                        <a  href="#">테마검색</a>
                        <a  href="#">날짜검색</a>
                    </div>
                </div>
                <div class="menu-down">
                    <a href="${pageContext.request.contextPath}/board/boardList" class="in-menu" id="board">게시판</a>
                    <div class="dropdown">
                        <a  href="${pageContext.request.contextPath}/board/content/1">캠핑후기</a>
                        <a  href="${pageContext.request.contextPath}/board/content/2">꿀팁공유</a>
                        <a  href="${pageContext.request.contextPath}/board/content/3">메이트찾기</a>
                        <a  href="${pageContext.request.contextPath}/board/content/4">건의사항</a>
                    </div>
                </div>                
            </div>
            <div class="header-right">
                <input type="text" class="search clearfix" placeholder="검색어를 입력하세요.">
                
                <div id="login" style="display: none;">
                    <img class="profile-img" src="${pageContext.request.contextPath}/img/profile.png" alt="profile">
                    <a href="${pageContext.request.contextPath}/mypage" class="user">홍길동님</a>
                    <button id="logout" onclick="location.href='${pageContext.request.contextPath}/user/logout'">로그아웃</button>                    
                </div>
                
                <div id="notLogin" >
                    <button id="loginH" onclick="location.href='${pageContext.request.contextPath}/user/login'">로그인</button>
                </div>
            </div>
            
        </div>
        <div class="section-dropdown">

        

        </div>
    </header>
<script>
    
       window.onload = () => {
            console.log("${login}");
            if("${login}" !== '') {
                document.getElementById('login').style.display = 'block';
                document.getElementById('notLogin').style.display = 'none';
            }
            else {
                document.getElementById('login').style.display = 'none';
                document.getElementById('notLogin').style.display = 'block';
            }
       }
       
    
</script>