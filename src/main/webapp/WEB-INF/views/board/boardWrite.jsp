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
            <select name="cls">
                <option value="none" selected hidden>말머리</option>
                <option value=1>캠핑후기</option>
                <option value=2>꿀팁공유</option>
                <option value=3>메이트찾기</option>
                <option value=4>건의사항</option>
            </select>
            <input class="title" type="text" name="title" placeholder="제목을 입력하세요">
        </div>
        <textarea name="content" id="content" placeholder="내용은 최대 2000자 까지 가능합니다."></textarea>
        <div class="formBottom">
            <input name="write" type="text"  id="userId" placeholder="임시 id 작성">
            <button class="submit" type="submit" id="submit">글 올리기</button>
        </div>
    </form>
    
</body>

<%@ include file="../include/footer.jsp" %>

<<<<<<< HEAD
<script>
=======


<script>

document.getElementById('submit').addEventListener('click', e=> {

    const $title = document.getElementById('.title');
    const $content = document.getElementById('.content');

    if($title === '' && $content === '') {
        alert('내용과 제목은 필수입니다.');
        return;
    }

});



>>>>>>> 57878001a23ad814d3f894fa3ad26501c23f15b3
    document.getElementById('regist').onclick = () =>{
        console.log(document.querySelector('.title').textContent);
        if(document.querySelector('.title').textContent ==='') {
            console.log('버튼이 클릭됨');
            alert('제목이 비었습니다 !');
            return;
        }
    }
</script>