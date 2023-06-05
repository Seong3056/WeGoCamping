<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/boardDetail.css">
</head>

<%@ include file="../include/header.jsp" %>
    <div class="detailB">
      
        <form action="" method="post" name="detilForm">
          <h3>## 게시판</h3>
          <article class="board">
              <div class="id" readonly>${vo.writer}</div>
              <div class="title" readonly>${vo.title}</div>
              <div class="flexBox">
                  <div class="imageBox">
                  <img alt="#" src="${pageContext.request.contextPath}/img/cam3.jpeg" onerror="this.src='${pageContext.request.contextPath}/img/campsiteOnerror.jpg'">
          
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
              <button type="button" class="regBtn" id="regBtn" onclick="location.href='${pageContext.request.contextPath}/board/boardModify/${vo.bno}'" >수정</button>
          
          </div>
        </form>
    </div>  
    <!-- 댓글 부분 -->
    <div class="reply">
      <label for="reply">댓글(댓글 수)</label>
      <form action="">
      <div class="replyWrite">
        <textarea name="replyInput" class="replyInput" id="replyInput" placeholder="댓글을 작성해주세요."></textarea>
        <button type="sumit" class="registBtn" id="registBtn">등록</button>
      </div>
      <!-- 댓글 창 -->
    </form>
      <div class="replyContent"> 
        <div class="replyInfo">
          <div class="replyWriter">이름값</div>&nbsp; &nbsp;
          <div class="replyDate"> 시간값</div>
        </div>
        <div class="replyText">
          <textarea name="replyCnt" id="replyCnt" class="replyCnt">내용</textarea>
          <div class="replyFix"><a href="#">수정</a>&nbsp;|&nbsp;<a href="#">삭제</a></div>
        </div>
      </div>
    </div>





    







    
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









</script>