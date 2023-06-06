<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link href="${pageContext.request.contextPath}/css/mypage.css" rel="stylesheet">
    </head>
    
<%@ include file="../include/header.jsp" %>

    <section>
        <div class="wrap">
            <div class="menuBox">   
               <div class="infoKind">
                  <a href="${pageContext.request.contextPath}/user/info" class="privacy">⦁ 개인 정보 수정</a> <br>
                     <a href="${pageContext.request.contextPath}/user/reservation" class="reserInfo">⦁ 예약 정보</a> <br>
                     <a href="${pageContext.request.contextPath}/user/myBoard" class="myText">⦁ 내 게시글</a> <br>
               </div>  
           </div>
            <div class="reservationInfo">
                
                <form action="#">
                    <div class="reservationBox"> 
                       <h3>예약 정보</h3>
                    <img src="../img/co.png" alt="예약한 캠핑장 사진" class="campImg"> <br>
                    
                    <div class="campName">
                        <h2>(캠핑장이름받아오기)</h2>
                    </div>
                    <div class="campInfo">
                        <div class="resDate">예약날짜: </div>
                        <div class="resPlace">장소: </div>
                        <div class="resName">예약자: </div>
                        <div class="resStatus">상태: </div>
                    </div>

                    <div class="go-main-btn">
                        <button type="button" name="goMainBtn" class="goMainBtn">메인으로</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </section>
    
    <%@ include file="../include/footer.jsp" %>