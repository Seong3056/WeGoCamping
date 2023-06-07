<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>내 게시글</title>
<link href="${pageContext.request.contextPath}/css/mypage.css" rel="stylesheet">

<%@ include file="../include/header.jsp" %>

<section>
    <div class="wrap">
        <div class="menuBox">
            <div id="clsBox" class="infoKind">
                <form name="clsForm" method="post">
                    <input type="text" name="userId" value="${login}" readonly hidden>
                    <a href="info" class="privacy">⦁ 개인 정보 수정</a> <br>
                    <a href="reservation" class="rsvInfo">⦁ 예약 정보</a> <br>
                    <a href="myBoard" class="myText">⦁ 내 게시글</a> <br>
                </form>
            </div>
        </div>

        <div class="myBoard">
            <form action="">
                <div class="myBoardBox">
                    <h3>내 게시글</h3>
                    <div class="titleBox">
                        <a href="#">캠핑후기</a> |
                        <a href="#">꿀팁공유</a> |
                        <a href="#">메이트찾기</a> |
                        <a href="#">건의사항</a>
                    </div>
                    <div class="myBoardList">
                        <!-- 게시글 받아오기(어케 적어야할지 고민중..) -->
                    </div>
                </div>
                <div class="myBoardBtn">
                    <div class="button-group">
                        <button type="button" id="boardBtn" class="boardBtn a">게시판</button>
                    </div>
                    <div class="button-group">
                        <button type="button" id="goMainBtn" class="goMainBtn a">메인</button>
                    </div>
                </div>

            </form>
        </div>
</section>

<%@ include file="../include/footer.jsp" %>

<script>

// 카테고리 a 태그 처리 폼
$clsForm = document.clsForm;

document.getElementById('clsBox').addEventListener('click', (e) => {
    e.preventDefault();

    if (!e.target.matches('a')) {
        return;
    }

    const targetLink = e.target.getAttribute('href');

    if(e.target.classList.contains('privacy')) {
        location.href('${pageContext.request.contextPath}/user/info');
    } else {
        $clsForm.action = '${pageContext.request.contextPath}/user/' + targetLink;
        $clsForm.submit();
    }

});

</script>