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
        <div class="titleBox">
            <h3>수정하기</h3>
        </div>
        <form action="">          
            <div class="idBox">
                <label>작성자</label>
                <input class="IdM" name="idBox" value="${article.id}" readonly>
            </div>    
            <div class="titleBox">
                <label>제목</label>
                <input class="titleM" name="title" value="${article.title}">
            </div>
            <div class="contentBox">
                <label>내용</label>
                <textarea class="contentM" name="content">${article.content}</textarea>
            </div>

            <button type="button" class="listBtn" id="listBtn">목록</button>    
            <button type="submit" class="modifyBtn" id="modifyBtn">완료</button>
        </form>
    </div>
    
</body>
<%@ include file="../include/footer.jsp" %>
</html>