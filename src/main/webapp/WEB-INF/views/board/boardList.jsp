<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link href="${pageContext.request.contextPath}/css/board.css" rel="stylesheet">
    </head>
    
<%@ include file="../include/header.jsp" %>
<article class="board">
    <div class="board-selector">
        <a href="">후기</a>
        <a href="">꿀팁</a>
        <a href="">메이트찾기</a>
        <a href="">건의사항</a>
    </div>
    <table>
        
        <th class="head"></th>
        <th class="title">제목</th>
        <th class="writer">작성자</th>
        <th class="regDate">작성일</th>
        <th class="hit">조회</th>
        <tr>
            <td>후기</td>
            <td>너무 좋아요</td>
            <td>캠핑초보</td>
            <td>23-05-24</td>
            <td>23</td>
        </tr>
        <tr>
            <td>매칭</td>
            <td>같이 노실분?</td>
            <td>심심한사람</td>
            <td>23-05-23</td>
            <td>12</td>
        </tr>

        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        
    </table>
    <div class="page">
        <div>이전</div>
        <div>1</div>
        <div>2</div>
        <div>3</div>
        <div>4</div>
        <div>5</div>
        <div>다음</div>
    </div>
</article>
<%@ include file="../include/footer.jsp" %>
