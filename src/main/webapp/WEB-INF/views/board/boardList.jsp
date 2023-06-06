<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<title>게시판</title>
<link href="${pageContext.request.contextPath}/css/board.css" rel="stylesheet">

<%@ include file="../include/header.jsp" %>

<article class="board">
    <!-- 부트스트랩 -->
    <div id="board-selector" class="btn-group" role="group" aria-label="Basic example">
        <button onclick="location.href='${pageContext.request.contextPath}/board/boardList?cls=1'"
            class="btn btn-secondary">캠핑후기</button>
        <button onclick="location.href='${pageContext.request.contextPath}/board/boardList?cls=2'"
            class="btn btn-secondary">꿀팁공유</button>
        <button onclick="location.href='${pageㅋContext.request.contextPath}/board/boardList?cls=3'"
            class="btn btn-secondary">메이트찾기</button>
        <button onclick="location.href='${pageContext.request.contextPath}/board/boardList?cls=4'"
            class="btn btn-secondary">건의사항</button>
        <button onclick="location.href='${pageContext.request.contextPath}/board/boardList'"
            class="btn btn-secondary">전체
            글 보기</button>
    </div>
    <!-- 부트스트랩끝 -->

    <div class="tab">
        <!-- 부트스트랩 글쓰기 버튼 -->
        <button onclick="location.href='${pageContext.request.contextPath}/board/boardWrite'"
            class="btn btn-secondary">글쓰기</button>
        <!-- 부트스트랩 끝 -->

        <!--  부트스트랩 검색창 시작 -->
        <div class="search-container">
            <form class="item d-flex" action="<c:url value='/board/boardList' />">
                <div class="item form-group">
                    <select name="condition" class="form-select" id="exampleSelect1">
                        <option value="title" ${pc.paging.condition=='title' ? 'selected' : '' }>제목</option>
                        <option value="content" ${pc.paging.condition=='content' ? 'selected' : '' }>내용</option>
                        <option value="writer" ${pc.paging.condition=='writer' ? 'selected' : '' }>작성자</option>
                        <option value="titleContent" ${pc.paging.condition=='titleContent' ? 'selected' : '' }>제목+내용
                        </option>
                    </select>
                </div>
                <div>
                    <input type="text" name="keyword" value="${pc.paging.keyword}" placeholder="검색어를 입력해주세요.">
                    <input type="hidden" name="cls" value="${pc.paging.cls}">
                </div>
                <div><button class="btn btn-secondary my-2 my-sm-0" type="submit"><i class="fa fa-search"
                            aria-hidden="true"></i></button>
                </div>
            </form>
        </div>
        <!-- 부트스트랩 끝 -->
    </div>

    <table id="boardList">

        <th class="head">카테고리</th>
        <th class="title">제목</th>
        <th class="writer">작성자</th>
        <th class="regDate">작성일</th>
        <th class="hit">조회</th>

        <c:forEach var="board" items="${boardList}">
            <tr>
                <td>
                    <c:if test="${board.cls==1}">후기</c:if>
                    <c:if test="${board.cls==2}">꿀팁</c:if>
                    <c:if test="${board.cls==3}">메이트찾기</c:if>
                    <c:if test="${board.cls==4}">건의사항</c:if>
                </td>
                <td class="title" style="cursor:pointer;">
                    <a
                        onclick="location.href='${pageContext.request.contextPath}/board/content/${board.bno}'">${board.title}</a>
                </td>
                <td>${board.writer}</td>
                <td>
                    <fmt:parseDate value="${board.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime"
                        type="both" />
                    <fmt:formatDate value="${parsedDateTime}" pattern="yy-MM-dd" />
                </td>
                <td>${board.hit}</td>
            </tr>
        </c:forEach>


    </table>

    <!-- 부트스트랩 페이지네이션 -->
    <form action="${pageContext.request.contextPath}/board/boardList" name="pageForm">
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


        <input type="hidden" name="cls" value="${pc.paging.cls}">
        <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
        <input type="hidden" name="cpp" value="${pc.paging.cpp}">
        <input type="hidden" name="keyword" value="${pc.paging.keyword}">
        <input type="hidden" name="condition" value="${pc.paging.condition}">

    </form>
    <!-- 부트스트랩 끝 -->

</article>

<%@ include file="../include/footer.jsp" %>

<script>
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

    // 댓글 날짜 변환 함수
    function parseTime(regDateTime) {
        let year, month, day, hour, minute, second;

        if (regDateTime.length === 5) {
            [year, month, day, hour, minute] = regDateTime;
            econd = 0;
        } else {
            [year, month, day, hour, minute, second] = regDateTime;
        }
        // 원하는 날짜로 객체를 생성
        const regTime = new Date(year, month - 1, day, hour, minute, second);
        const date = new Date();
        const gap = date.getTime() - regTime.getTime();

        let time;
        if (gap < 60 * 60 * 24 * 1000) { // 1000은 밀리초라 넣어줌
            if (gap < 60 * 60 * 1000) {
                time = '방금 전';
            } else {
                time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
            }
        } else if (gap < 60 * 60 * 24 * 30 * 1000) {
            time = parseInt(gap / (1000 * 60 * 60 * 24)) + '일 전';
        } else {
            time = `${regTime.getFullYear()}년 ${regTime.getMonth()}월 ${regTime.getDate()}일`;
        }
        return time;
    }
</script>