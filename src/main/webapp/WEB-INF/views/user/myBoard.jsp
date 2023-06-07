<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<title>내 게시글</title>
<link href="${pageContext.request.contextPath}/css/mypage.css" rel="stylesheet">

<%@ include file="../include/header.jsp" %>

<section>
    <div class="wrap">
        <div class="menuBox">
            <div id="subMenuBox" class="infoKind">
                <form name="menuForm" method="post">
                    <input type="hidden" name="userId" value="${login}" readonly>
                    <a href="info" class="privacy">⦁ 개인 정보 수정</a> <br>
                    <a href="reservation" class="rsvInfo">⦁ 예약 정보</a> <br>
                    <a href="myBoard" class="myText">⦁ 내 게시글</a> <br>
                </form>
            </div>
        </div>

        <div class="myBoard">
            <div class="myBoardBox">
                <h3>내 게시글</h3>
                <div id="clsBox" class="titleBox">
                    <form name="clsForm" method="post">
                        <input type="hidden" name="userId" value="${login}" readonly>
                        <input type="hidden" id="cls" name="cls" readonly>
                        <a href="1">캠핑후기</a> |
                        <a href="2">꿀팁공유</a> |
                        <a href="3">메이트찾기</a> |
                        <a href="4">건의사항</a>
                    </form>
                </div>
                <table class="myBoardList">
                    <th class="head">카테고리</th>
                    <th class="title">제목</th>
                    <th class="regDate">작성일</th>
                    <th class="hit">조회</th>
                    <!-- 게시글 받아오기 -->
                    <c:forEach var="content" items="${list}">
                        <tr>
                            <td>
                                <c:if test="${content.cls==1}">후기</c:if>
                                <c:if test="${content.cls==2}">꿀팁</c:if>
                                <c:if test="${content.cls==3}">메이트찾기</c:if>
                                <c:if test="${content.cls==4}">건의사항</c:if>
                            </td>
                            <td class="title" style="cursor:pointer;">
                                <a
                                    onclick="location.href='${pageContext.request.contextPath}/board/content/${content.bno}'">${content.title}</a>
                            </td>
                            <td>
                                <fmt:parseDate value="${content.regDate}" pattern="yyyy-MM-dd'T'HH:mm"
                                    var="parsedDateTime" type="both" />
                                <fmt:formatDate value="${parsedDateTime}" pattern="yy-MM-dd" />
                            </td>
                            <td>${content.hit}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <!-- 부트스트랩 페이지네이션 -->
            <form action="${pageContext.request.contextPath}/user/myBoard" name="pageForm" method="post">
                <div class="page">
                    <ul id="pagination" class="pagination pagination-sm">
                        <c:if test="${pc.prev}">
                            <li class="page-item">
                                <a class="page-link" href="#" data-pagenum="${pc.beginPage-1}">&laquo;</a>
                            </li>
                        </c:if>
                        <c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
                            <li class="${pc.paging.pageNum == num ? 'page-item active' : ''}">
                                <a class="page-link" href="#" data-pagenum="${num}">${num}</a>
                            </li>
                        </c:forEach>
                        </li>
                        <c:if test="${pc.next}">
                            <li class="page-item">
                                <a class="page-link" href="#" data-pagenum="${pc.endPage+1}">&raquo;</a>
                            </li>
                        </c:if>
                    </ul>
                </div>

                <input type="hidden" name="userId" value="${login}" readonly>
                <input type="hidden" name="cls" value="${pc.paging.cls}">
                <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
                <input type="hidden" name="cpp" value="${pc.paging.cpp}">
                <input type="hidden" name="keyword" value="${pc.paging.keyword}">
                <input type="hidden" name="condition" value="${pc.paging.condition}">
            </form>
            <!-- 페이지 부트스트랩 끝 -->
            <div class="myBoardBtn">
                <div class="button-group">
                    <button type="button" id="boardBtn" class="boardBtn a btn btn-secondary">게시판</button>
                </div>
                <div class="button-group">
                    <button type="button" id="goMainBtn" class="goMainBtn a btn btn-secondary">메인</button>
                </div>
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

    // 카테고리별 게시글 보기 처리
    $clsForm = document.clsForm;

    document.getElementById('clsBox').addEventListener('click', (e) => {
        e.preventDefault();


        if (!e.target.matches('a')) {
            return;
        }

        const cls = e.target.getAttribute('href');

        document.getElementById('cls').value = cls;

        $clsForm.action = '${pageContext.request.contextPath}/user/myBoard';
        $clsForm.submit();
    });
    // 카테고리별 보기 종료.

    // 페이징 버튼 함수
    document.getElementById('pagination').addEventListener('click', e => {
        if (!e.target.matches('a')) {
            return;
        }

        e.preventDefault();

        const pageNum = e.target.dataset.pagenum;

        document.pageForm.pageNum.value = pageNum;
        document.pageForm.submit();
    });
    // 페이징 처리 종료.
</script>