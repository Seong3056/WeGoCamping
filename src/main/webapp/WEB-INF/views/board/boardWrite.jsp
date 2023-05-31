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
        <h3>글쓰기</h3>
        
        
        
        <div class="BPBox">
            <select name="BP" id="BP">
                <option>캠핑후기</option>
                <option>꿀팁후기</option>
                <option>메이트찾기</option>
                <option>건의사항</option>
            </select>
            <input class="title" type="text" name="title" placeholder="제목을 입력하세요">
        </div>
        <textarea name="content" id="content" class="content" placeholder="내용은 최대 2000자 까지 가능합니다."></textarea>
        <div class="uploadBtn">
        <button class="submit" type="submit" id="submit">글 올리기</button>
        </div>
        <input type="text" class="userId" id="userId" placeholder="임시 id 작성">
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