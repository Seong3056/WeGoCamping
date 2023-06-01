<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/boardDetail.css">
</head>
<%@ include file="../include/header.jsp" %>

    <body>
        
            <div class="wrap">
            <div class="headBox">
                <h3>수정하기</h3>
            </div>
            <form action="${pageContext.request.contextPath}/board/boardUpdate" method="post">
                
                <div class="titleBox">
                    
                    <input class="titleM" name="title" value="">
                    <input class="IdM" name="idBox" value="" readonly placeholder="id value 예정">
                </div>
                <div class="contentBox">
                    
                    <textarea class="contentM" name="content"></textarea>
                </div>
                <div class="btnBox">
                    <button type="button" class="listBtn" id="listBtn" onclick="location.href='${pageContext.request.contextPath}/board/boardList'">목록</button>
                    <button type="submit" class="modifyBtn" id="modifyBtn" onclick="location.href='${pageContext.request.contextPath}/board/content/${bno}'">완료</button>
                </div>
            </form>
        </div>
        
    </body>
    </html>
    <%@ include file="../include/footer.jsp" %>

