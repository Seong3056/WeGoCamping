<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


    <meta charset="UTF-8">
    <title>Insert title here</title>
    
    <!-- 웹폰트 적용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
  
    
    <!-- 부트스트랩 -->
<script src="https://kit.fontawesome.com/a2baf29734.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lumen/bootstrap.min.css" integrity="sha384-GzaBcW6yPIfhF+6VpKMjxbTx6tvR/yRd/yJub90CqoIn2Tz4rRXlSpTFYMKHCifX" crossorigin="anonymous">
<!-- 부트스트랩 끝 -->
 <link href="${pageContext.request.contextPath}/css/board.css" rel="stylesheet">



<%@ include file="../include/header.jsp" %>

<article class="board">
   <!--  <div id="board-selector"> -->
    <!-- 부트스트랩 -->
    <div class="btn-group" role="group" aria-label="Basic example">
  <button onclick="location.href='${pageContext.request.contextPath}/board/1'" class="btn btn-secondary">캠핑후기</button>
  <button onclick="location.href='${pageContext.request.contextPath}/board/2'" class="btn btn-secondary">꿀팁공유</button>
  <button onclick="location.href='${pageContext.request.contextPath}/board/3'" class="btn btn-secondary">메이트찾기</button>
  <button onclick="location.href='${pageContext.request.contextPath}/board/4'" class="btn btn-secondary">건의사항</button>
</div>
    <!-- 부트스트랩끝 -->
       <!--  <a id="1" href="${pageContext.request.contextPath}/board/1">캠핑후기</a>
        <a id="2" href="${pageContext.request.contextPath}/board/2">꿀팁공유</a>
        <a id="3" href="${pageContext.request.contextPath}/board/3">메이트찾기</a>
        <a id="4" href="${pageContext.request.contextPath}/board/4">건의사항</a> 
    </div> -->
    <div class="tab">
    
    <!-- 부트스트랩 글쓰기 버튼 -->
        <button onclick="location.href='${pageContext.request.contextPath}/board/boardWrite'" class="btn btn-secondary">글쓰기</button>
	<!-- 부트스트랩 끝 -->
	
      <form action="<c:url value='/board/boardList' />"></form>
       
        
      <!--  부트스트랩 검색창 시작 -->
     <div class="search-container">
      <div class="item form-group"> 
      <select class="form-select" id="exampleSelect1">
        <option value="title" ${pc.paging.condition=='title' ? 'selected' : '' }>제목</option>
        <option value="content" ${pc.paging.condition=='content' ? 'selected' : '' }>내용</option>
        <option value="writer" ${pc.paging.condition=='writer' ? 'selected' : '' }>작성자</option>
        <option value="titleContent" ${pc.paging.condition=='titleContent' ? 'selected' : '' }>제목+내용</option>
      </select>
      </div>
      <div>
        <form class="item d-flex">
        <input class="form-control me-sm-2" type="search" placeholder="검색어를 입력해주세요">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
      </form>
      </div>
      
    </div>
       </div>
        
    <!-- 부트스트랩 끝 -->
         <%-- <select name="condition" class="form-control search-select">
                <option value="title" ${pc.paging.condition=='title' ? 'selected' : '' }>제목</option>
                <option value="content" ${pc.paging.condition=='content' ? 'selected' : '' }>내용</option>
                <option value="writer" ${pc.paging.condition=='writer' ? 'selected' : '' }>작성자</option>
                <option value="titleContent" ${pc.paging.condition=='titleContent' ? 'selected' : '' }>제목+내용</option>
            </select>
            <input type="text" placeholder="검색어를 입력해주세요">
            <button type="menu">검색</button>
       </div>
        </div>
  --%>
    <table id="boardList">

        <th class="head">카테고리</th>
        <th class="title">제목</th>
        <th class="writer">작성자</th>
        <th class="regDate">작성일</th>
        <th class="hit">조회</th>
        <!-- <tr>
            <td>후기</td>
            <td>너무 좋아요</td>
            <td>캠핑초보</td>
            <td>23-05-24</td>
            <td>23</td>
        </tr>
 -->
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

    <!-- <div class="page">
        <div>이전</div>
        <div>1</div>
        <div>2</div>
        <div>3</div>
        <div>4</div>
        <div>5</div>
        <div>다음</div>
    </div> -->
    
    <%-- <form action="${pageContext.request.contextPath}/board/boardList" name="pageForm">
        <div class="page">
            <hr>
            <ul id="pagination" class="pagination pagination-sm">
                <c:if test="${pc.prev}">
                    <li><a href="#" data-pagenum="${pc.beginPage-1}">이전</a></li>
                </c:if>

                <c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
                    <li class="${pc.paging.pageNum == num ? 'active' : ''}">
                        <a href="#" data-pagenum="${num}">${num}</a>
                    </li>
                </c:forEach>

                <c:if test="${pc.next}">
                    <li><a href="#" data-pagenum="${pc.endPage+1}">다음</a></li>
                </c:if>
            </ul>
            <button type="button" class="btn btn-info"
                onclick="location.href='${pageContext.request.contextPath}/freeboard/regist'">글쓰기</button>
        </div>
        
        <input type="hidden" name="cls" value="${pc.paging.cls}">
        <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
        <input type="hidden" name="cpp" value="${pc.paging.cpp}">
        <input type="hidden" name="keyword" value="${pc.paging.keyword}">
        <input type="hidden" name="condition" value="${pc.paging.condition}">

    </form> --%>
    
    <!-- 부트스트랩 페이지네이션 -->
    <form action="${pageContext.request.contextPath}/board/boardList" name="pageForm">
     <div class="page">
  <ul id="pagination" class="pagination pagination-sm">
     <c:if test="${pc.prev}">
    <li class="page-item" >
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
    // document.getElementById('board-selector').addEventListener('click', e => {
    //     if(!e.target.matches('a')) return;
    //     console.log('게시판클릭');
    //     const $list = document.getElementById('boardList')
    //     $list.replaceChildren();
    //     const cls = e.target.getAttribute('id');
    //     console.log(cls);
    //     $list.innerHTML = ` <th class="head"></th>
    //                         <th class="title">제목</th>
    //                         <th class="writer">작성자</th>
    //                         <th class="regDate">작성일</th>
    //                         <th class="hit">조회</th>`;
    //     fetch('${pageContext.request.contextPath}/board/cls/' + cls)
    //         .then(rs => rs.json())
    //         .then(data => {
    //             console.log(data[0].regDate);
    //             console.log(data);
    //             for (var i = 0; i < data.length; i++) {
    //                 const $frag = document.createDocumentFragment;
    //                 const $tr = document.createElement('tr');
    //                 const $cls =  document.createElement('td');
    //                 switch(data[i].cls){
    //                     case 1:
    //                         $cls.textContent = '캠핑후기';
    //                     break;
    //                     case 2:
    //                         $cls.textContent = '꿀팁공유';
    //                     break;
    //                     case 3:
    //                         $cls.textContent = '메이트찾기';
    //                     break;
    //                     case 4:
    //                         $cls.textContent = '건의사항';
    //                     break;
    //                 }

    //                 const $title = document.createElement('td');
    //                 const $a = document.createElement('a');
    //                 $a.textContent = data[i].title;
    //                 $a.setAttribute('onclick',"location.href='${pageContext.request.contextPath}/board/content/"+data[i].bno+"'");
    //                 $title.appendChild($a);


    //                 const $writer = document.createElement('td');
    //                 $writer.textContent = data[i].writer;
    //                 const $date = document.createElement('td');


    //                 $date.textContent = data[i].regDate[0]-2000 + '-' + 
    //                 (data[i].regDate[1]>10? data[i].regDate[1]:('0'+data[i].regDate[1]))+ '-' + 
    //                 (data[i].regDate[2]>10? data[i].regDate[2]:('0'+data[i].regDate[2]));
    //                 const $hit = document.createElement('td');
    //                 $hit.textContent = data[i].hit;

    //                 $tr.appendChild($cls);
    //                 $tr.appendChild($title);
    //                 $tr.appendChild($writer);
    //                 $tr.appendChild($date);
    //                 $tr.appendChild($hit);

    //                 $list.appendChild($tr);

    //             }
    //         })




    // })

    window.onload = function () {

        document.getElementById('pagination').addEventListener('click', e => {
            if (!e.target.matches('a')) {
                return;
            }

            e.preventDefault();

            const value = e.target.dataset.pagenum;

            document.pageForm.pageNum.value = value;
            document.pageForm.submit();

        });

    }

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