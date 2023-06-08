<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>게시글 작성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/boardWrite.css">

<%@ include file="../include/header.jsp" %>

<body>


    <form class="board" name="boardForm" action="${pageContext.request.contextPath}/board/boardWrite" method="post">

        <h3>글쓰기</h3>
        <div class="BPBox">
            <select name="cls" class="form-select" id="exampleSelect1">
                <option value="none" selected hidden>말머리</option>
                <option value=1>캠핑후기</option>
                <option value=2>꿀팁공유</option>
                <option value=3>메이트찾기</option>
                <option value=4>건의사항</option>
            </select>
            <input class="title" id="title" type="text" name="title" placeholder="제목을 입력하세요">
        </div>
        <textarea name="content" class="content" id="content" placeholder="내용은 최대 2000자 까지 가능합니다."></textarea>
        <div class="formBottom">
            <input name="writer" type="text" value="${login}" id="writer" placeholder="임시 id 작성">
            <button class="submit btn btn-secondary" type="button" id="submitBtn">글 올리기</button>
        </div>
        
        <div class="filebox">
            <label for="file" id="inputFile" style="display: none;">파일첨부</label>
            <input type="file" name="file" id="file" style="display: none;">
        </div>
        
        <!-- <select name="rating" class="rating" style="display: none;">
            <option value="none" selected hidden>별점을 주세요!</option>
            <option value="1">⭐</option>
            <option value="2">⭐⭐</option>
            <option value="3">⭐⭐⭐</option>
            <option value="4">⭐⭐⭐⭐</option>
            <option value="5">⭐⭐⭐⭐⭐</option>
          </select> -->
    
    </form>

</body>

<%@ include file="../include/footer.jsp" %>



<script>
    document.getElementById('submitBtn').onclick = () => {

        const $title = document.getElementById('title').value;
        const $content = document.getElementById('content').value;

        if (document.querySelector('select').value === 'none') {
            alert('말머리를 선택해주세요!')
            //말머리 포커스
            //말머리 border 빨간색 2초뒤 사라짐
            return;
        } else if ($title === '' || $content === '') {
            alert('내용과 제목은 필수입니다.');
            return;
        }


        console.log('제목 말머리 내용 모두 있음');
        console.log(document.boardForm);
        document.boardForm.submit();


    };
    
    // 캠핌후기 말머리 클릭 시 바뀌게 틀 바뀌게 하기 + 첨부파일 + 별점
    
    document.querySelector('select').onclick = () => {
        const fileBox = document.querySelector('fileBox');
        const inputFile = document.getElementById('inputFile');
        const file = document.getElementById('file');
        const rating = document.querySelector('.rating');

      
        console.log('select 클림됨!');
        if(document.querySelector('select').value == 1) {
            console.log('value 1 들어옴');
            inputFile.style.display = 'block';
            file.style.display = 'block';
            rating.style.display = 'block';
        }  else {
            console.log('value1이 아님');
            inputFile.style.display = 'none';
            file.style.display = 'none';
            rating.style.display = 'none';
        }

        
    };
    


   
  
  
    
    
</script>