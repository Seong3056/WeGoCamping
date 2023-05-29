<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/boardWrite.css">
</head>
<%@ include file="../include/header.jsp" %>
<body>
    
   <article class="board">
    <div class="title">${vo.title}</div>
    <div class="content">${vo.content}</div>
   </article>
   

</body>

<%@ include file="../include/footer.jsp" %>