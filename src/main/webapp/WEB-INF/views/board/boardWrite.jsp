<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/boardWrite.css">
</head>
<%@ include file="../include/header.jsp" %>
<body>
    

    <form class="board" action="${pageContext.request.contextPath}/board/boardWrite" method="post" >
        <div>
            <input class="title" type="text" name="title" placeholder="제목을 입력하세요" textarea required>
            <input class="write" type="text" name="id">
        </div>
        <input class="content" type="text" name="content" rows="30" maxlength="2000">

        <button id="regist" class="submit" type="submit">글 올리기</button>
    </form>

</body>

<%@ include file="../include/footer.jsp" %>

<script>
    document.getElementById('regist').onclick = () =>{
        console.log(document.querySelector('.title').textContent);
        if(document.querySelector('.title').textContent ==='') {
            console.log('버튼이 클릭됨');
            alert('제목이 비었습니다 !');
            return;
        }
    }
</script>