<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pay.css">
 
    <%@ include file="../include/header.jsp" %>

    <section class="fin">

        <h2>예약이 완료되었습니다.</h2>
        <hr>
        <p>예약자명: </p>
 
        <div class="rsvInfo line">
            <p>날짜: </p>
            <p>몇명 ${info.quantity}</p>
        </div>
 
        <div class="rsvPay line">
            <p>결제번호: </p> <p>${info.partner_order_id}</p>
            <p>결제금액: </p> <p>${info.amount.total}</p>
        </div>
 
        <h3>캠핑장명: ${info.item_name}</h3>
 
        <div class="campInfo line">
            <p>주소</p>
            <p>전화번호</p>
        </div>
 
     </section>
    <%@ include file="../include/footer.jsp" %>