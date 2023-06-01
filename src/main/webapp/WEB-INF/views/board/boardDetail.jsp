<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/boardDetail.css">
</head>
<%@ include file="../include/header.jsp" %>
<body>

    <div class="detailB">
        <h3>## 게시판</h3>
        <article class="board">
            <div class="id" readonly>${vo.writer}</div>
            <div class="title" readonly>${vo.title}</div>
            <div class="flexBox">
                <div class="imageBox">
                <img alt="#" src="${pageContext.request.contextPath}/img/cam3.png">                
				
				
                <div class="bGroup">
                    <button class="previous"> ◁ </button>
                    <button class="next"> ▷ </button>
                </div>
                </div>
                <div class="content" readonly>${vo.content}</div>
            </div>
        </article>
        <div class="btn-group">
            <button type="button" class="listBtn" id="listBtn" onclick="location.href='${pageContext.request.contextPath}/board/boardList'">목록</button>
            <button type="button" class="regBtn" id="regBtn" onclick="location.href='${pageContext.request.contextPath}/board/boardModify'">수정</button>
            <button type="button" class="deltBtn" id="deltBtn">삭제</button>
        </div>
    </div>  


</body>

<%@ include file="../include/footer.jsp" %>


<script>



// 이미지 슬라이드 JS 시작-------------

let imageIndex = 0;
let postion = 0;
const IMAGE_WIDTH = 250;  // css에서 설정한 width 값과 동일하게 맞춰주세요
const btnPrevious = document.querySelector(".previous")
const btnNext = document.querySelector(".next")
const images = document.querySelector(".images")
 
function previous(){
  if(imageIndex > 0){
    btnNext.removeAttribute("disabled")
    postion += IMAGE_WIDTH;
    images.style.transform = `translateX(${postion}px)`;
    imageIndex = imageIndex - 1;
  }
  if(imageIndex == 0){
    btnPrevious.setAttribute('disabled', 'true')
  }
}
function next(){
  if(imageIndex < 3){
    btnPrevious.removeAttribute("disabled")
    postion -= IMAGE_WIDTH;
    images.style.transform = `translateX(${postion}px)`;
    imageIndex = imageIndex + 1;
  }
  if(imageIndex == 3){
    btnNext.setAttribute('disabled', 'true')
  }
}
 
function init(){
  btnPrevious.style.opacity = '0';
  btnPrevious.addEventListener("click", previous)
  btnNext.addEventListener("click", next)
}
 
init();

// 이미지 스크립트 JS 끝-------------------

document.getElementById('')


</script>