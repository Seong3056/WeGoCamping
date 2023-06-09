<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>예약 내역</title>
<link href="${pageContext.request.contextPath}/css/mypage.css" rel="stylesheet">

<%@ include file="../include/header.jsp" %>

<section>
    <div class="wrap">
        <div class="menuBox">
            <div id="subMenuBox" class="infoKind">
                <form name="menuForm" method="post">
                    <input type="text" name="userId" value="${login}" readonly hidden>
                    <a href="info" class="privacy">⦁ 개인 정보 수정</a> <br>
                    <a href="reservation" class="rsvInfo">⦁ 예약 정보</a> <br>
                    <a href="myBoard" class="myText">⦁ 내 게시글</a> <br>
                </form>
            </div>
        </div>

        <div class="reservationInfo">
            
            <div class="payList">
                <table>
                    <th class="pay-num">결제코드</th>
                    <th class="item-name">캠핑장이름</th>
                    <th class="quantity">인원</th>
                    <th class="daterange">날짜</th>
                    <th class="amount">결제금액</th>
                    
                    <c:forEach var="pay" items="${payList}">
                        <tr>
                    
                            <td >${pay.payNum}</td>
                            <td >${pay.itemName}</td>                    
                            <td >${pay.quantity}</td>
                            <td >${pay.daterange}</td>
                            <td >${pay.amount}</td>
                        </tr>          


                    </c:forEach>
                </table>
            </div>

        </div>
    </div>
</section>

<%@ include file="../include/footer.jsp" %>

<script>
    // 마이페이지 메뉴 a 태그 처리
    $menuForm = document.menuForm;

    document.getElementById('subMenuBox').addEventListener('click', (e) => {
        e.preventDefault();

        if (!e.target.matches('a')) {
            return;
        }

        const targetLink = e.target.getAttribute('href');

        if (e.target.classList.contains('privacy')) {
            location.href = '${pageContext.request.contextPath}/user/info';
        } else {
            $menuForm.action = '${pageContext.request.contextPath}/user/' + targetLink;
            $menuForm.submit();
        }
    });
    // 메뉴 처리 끝.
   


</script>