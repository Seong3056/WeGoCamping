<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>게시글 상세보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/boardDetail.css">

<%@ include file="../include/header.jsp" %>
<body>
  

<article class="detail">
  <div class="detailB">
    <form action="" method="post" name="detilForm">
      <span id="cls">
        <c:if test="${vo.cls==1}">캠핑후기</c:if>
        <c:if test="${vo.cls==2}">꿀팁공유</c:if>
        <c:if test="${vo.cls==3}">메이트찾기</c:if>
        <c:if test="${vo.cls==4}">건의사항</c:if>
      </span>
      <h3>게시판</h3>
      <article class="board">
        <div class="topBox">

          <div class="title" readonly>${vo.title}</div>
          <div class="id" readonly>작성자: ${vo.writer}</div>
        </div>
        <div class="flexBox">

          <div class="imageBox" id="imageBox">
            <img alt="#" src="${pageContext.request.contextPath}/img/cam3.jpeg"
              onerror="this.src='${pageContext.request.contextPath}/img/campsiteOnerror.jpg'">

            <div class="bGroup">
              <div class="previous"> ◁ </div>
              <div class="next"> ▷ </div>
            </div>
          </div>

          <div class="content" id="content" readonly>${vo.content}</div>
        </div>
        
  
  <div class="btn-group">
    <button type="button" class="listBtn btn btn-secondary" id="listBtn"
      onclick="location.href='${pageContext.request.contextPath}/board/boardList'">목록</button>
    <button type="button" class="regBtn btn btn-secondary" id="regBtn"
      onclick="location.href='${pageContext.request.contextPath}/board/boardModify/${vo.bno}'">수정</button>
  </div>
</div>


</form>
</div>
<!-- 댓글 부분 -->
<div class="reply">
  <label for="reply">댓글(댓글 수)</label>
  <!-- <form action=""> -->
  <div class="replyWrite">
    <textarea name="reply" class="replyInput" id="replyInput" placeholder="댓글을 작성해주세요."></textarea>
    <button type="button" class="registBtn btn btn-secondary" id="registBtn">등록</button>
  </div>
  <!-- </form> -->
  <!-- 댓글 창 -->
  <div id=replyList class="replyContent">
    <div class="replyInfo">
      <div class="replyWriter">이름값</div>&nbsp; &nbsp;
      <div class="replyDate"> 시간값</div>
    </div>
    <div class="replyText">
      <textarea name="replyCnt" id="replyCnt" class="replyCnt" readonly>내용</textarea>
      <div class="replyFix"><a href="#">수정</a>&nbsp;|&nbsp;<a href="#">삭제</a></div>
    </div>
  </div>
  <button type="button" class="form-control" id="moreList" style="display: none;">댓글 더보기</button>
</div>
</article>
</body>
<%@ include file="../include/footer.jsp" %>

<script>




  window.onload = function () {
    if(document.getElementById('cls').textContent.trim() != '꿀팁공유'){
    const imageBox = document.getElementById('imageBox');
    const content = document.getElementById('content');
      console.log(document.getElementById('cls').textContent.trim());

    
    
      imageBox.style.display = 'none';
      content.style.display = 'block';
      content.style.width = '1000px';
      console.log('else 로 빠짐 ^^7');
    

  }

    // 댓글 등록
    document.getElementById('registBtn').onclick = () => {

      const bno = '${vo.bno}'; // 현재 게시글 번호
      const reply = document.getElementById('replyInput').value;
      const userId = '${login}'; // 세션에서 로그인한 사용자 Id 값 가져옴.

      console.log(userId);

      if (reply === '') {
        alert('내용을 입력하세요!');
        return;
      }

      // 요청에 관련된 정보 객체.
      const reqObj = {
        method: 'post',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          'bno': bno,
          'reply': reply,
          'userId': userId,
        })
      };

      fetch('${pageContext.request.contextPath}/reply/regist', reqObj)
        .then(res => res.text())
        .then(data => {
          console.log('통신 성공! : ' + data);
          document.getElementById('replyInput').value = '';
          // 등록 완료 후 댓글 목록 함수를 호출해서 비동기식으로 목록 표현.
          getList(1, true);
        });

    } // 댓글 등록 이벤트 끝.

    // 더보기 버튼 처리(클릭 시 전역 변수 page에 +1 한 값을 요청)
    document.getElementById('moreList').onclick = () => {
      getList(++page, false);
    }

    let page = 1; // 전역 의미로 사용할 페이지 번호
    let strAdd = ''; // 화면에 그려넣을 태그를 문자열의 형태로 추가할 변수
    const $replyList = document.getElementById('replyList');

    // 처음 진입 시 댓글 리스트 불러오기.
    getList(1, true);

    // 댓글 목록을 가져올 함수.
    function getList(pageNum, reset) {
      strAdd = '';

      const bno = '${vo.bno}'; // 게시글 번호

      // get 방식으로 댓글 목록을 요청 (비동기)
      fetch('${pageContext.request.contextPath}/reply/getList/' + bno + '/' + pageNum)
        .then(res => res.json())
        .then(data => {
          console.log(data);

          let total = data.total; // 총 댓글 수
          let replyList = data.list; // 댓글 리스트

          // insert, update, delete 후에는 화면 리셋.
          if (reset) {
            while ($replyList.firstChild) {
              $replyList.firstChild.remove();
              // $replyList.removeChild($replyList.firstChild);
            }
            page = 1;
          }

          // 응답 데이터의 길이가 0과 같거나 더 작으면 함수를 종료.
          if (replyList.length <= 0) return;

          // 댓글 수에 따른 더보기 버튼 조정.
          console.log('현재 페이지 : ' + page);
          if (total <= page * 5) {
            document.getElementById('moreList').style.display = 'none';
          } else {
            document.getElementById('moreList').style.display = 'block';
          }

          // 비동기 요청으로 넘겨받은 댓글 목록을 변수에 추가.
          for (let i = 0; i < replyList.length; i++) {
            strAdd +=
              `    <div class="replyInfo">
      <div class="replyWriter">` + replyList[i].userId + `</div>&nbsp; &nbsp;
      <div class="replyDate">` + (replyList[i].updateDate != null ? parseTime(replyList[i].updateDate) + '(수정됨)' :
                parseTime(replyList[i].replyDate)) + `</div>
    </div>
    <div class="replyText">
      <textarea name="replyCnt" id="replyCnt" class="replyCnt" readonly>` + replyList[i].reply + `</textarea>
      <div class="replyFix">
        <a href='` + replyList[i].rno + `' class='replyModify'>수정</a>&nbsp;|&nbsp;
        <a href='` + replyList[i].rno + `' class='replyDelete'>삭제</a>
      </div>
    </div>`
          }

          // 댓글 영역에 변수에 담긴 모든 댓글을 추가.
          // 리셋 여부에 따라 위치를 조절.
          if (!reset) {
            $replyList.insertAdjacentHTML('beforeend', strAdd);
          } else {
            $replyList.insertAdjacentHTML('afterbegin', strAdd);
          }

        });

    } // end getList();

    // 댓글 수정 or 삭제 이벤트
    document.getElementById('replyList').addEventListener('click', e => {
      e.preventDefault(); // 태그의 고유 기능을 중지.

      // 이벤트가 발생한 target이 a태그가 아니라면 이벤트 종료.
      if (!e.target.matches('a')) {
        return;
      }

      const writer = e.target.parentNode.parentNode.previousElementSibling.firstElementChild.textContent;

      // 현재 로그인한 사용자가 댓글 작성자가 아니라면 종료.
      if ('${login}' !== writer) return;

      // 댓글이 여러 개 -> 수정, 삭제가 발생하는 댓글이 몇 번인지 확인.
      const rno = e.target.getAttribute('href');
      console.log('댓글 번호 : ' + rno);

      //  수정 버튼인지 삭제 버튼인지를 확인하는 조건문.
      if (e.target.classList.contains('replyModify')) {
        // 처음 수정 버튼 클릭 시 내용 입력을 받기 위해 readonly 해제 후 종료.
        if (e.target.parentNode.previousElementSibling.readOnly) {
          e.target.parentNode.previousElementSibling.readOnly = false;
          e.target.parentNode.previousElementSibling.style.border = "1px dotted #eb8787";
          return;
        }
        // 다시 수정 버튼을 클릭하면 댓글 수정 요청.
        else {
          let content = e.target.parentNode.previousElementSibling.value;
          console.log(content);
          if (content === '') {
            alert('수정할 내용을 입력하세요!');
            return;
          } else {
            const reqObj = {
              method: 'put',
              headers: {
                'Content-Type': 'application/json'
              },
              body: JSON.stringify({
                'reply': content,
              })
            };

            fetch('${pageContext.request.contextPath}/reply/' + rno, reqObj)
              .then(res => res.text())
              .then(data => {
                console.log(data);
                if (data === 'updateSuccess') {
                  console.log('댓글 수정 완료! : ' + data);
                  // 댓글 수정 완료 후 댓글 목록 재표현.
                  getList(1, true);
                } else {
                  console.log('댓글 수정 실패.');
                }
              });
          }
        }
      } else {
        if (confirm("정말 삭제하시겠습니까?")) {
          fetch('${pageContext.request.contextPath}/reply/' + rno, {
              method: 'delete'
            })
            .then(res => res.text())
            .then(data => {
              console.log(data);
              if (data === 'deleteSuccess') {
                alert('댓글 삭제가 완료되었습니다.');
                getList(1, true);
              } else {
                console.log('댓글 삭제 실패.');
              }
            });
        }
      }
    }); // 수정 or 삭제 버튼 클릭 이벤트 끝.

    // 댓글 날짜 변환 함수
    function parseTime(regDateTime) {
      let year, month, day, hour, minute, second;
      if (regDateTime.length === 5) {
        [year, month, day, hour, minute] = regDateTime;
        second = 0;
      } else {
        [year, month, day, hour, minute, second] = regDateTime;
      }
      const regTime = new Date(year, month - 1, day, hour, minute, second);
      // console.log(regTime);
      const date = new Date();
      // console.log(date);
      const gap = date.getTime() - regTime.getTime();

      let time;
      if (gap < 60 * 60 * 24 * 1000) {
        if (gap < 60 * 60 * 1000) {
          time = '방금 전';
        } else {
          time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
        }
      } else if (gap < 60 * 60 * 24 * 30 * 1000) {
        time = parseInt(gap / (1000 * 60 * 60 * 24)) + '일 전';
      } else {
        time = `${regTime.getFullYear()}년 ${regTime.getMonth()}월 ${regTime.getDate()}일`;
      }

      return time;
    }

  } // window.onload

  // 이미지 슬라이드 JS 시작-------------
  let imageIndex = 0;
  let postion = 0;
  const IMAGE_WIDTH = 250; // css에서 설정한 width 값과 동일하게 맞춰주세요
  const btnPrevious = document.querySelector(".previous")
  const btnNext = document.querySelector(".next")
  const images = document.querySelector(".images")

  function previous() {
    if (imageIndex > 0) {
      btnNext.removeAttribute("disabled")
      postion += IMAGE_WIDTH;
      images.style.transform = `translateX(${postion}px)`;
      imageIndex = imageIndex - 1;
    }
    if (imageIndex == 0) {
      btnPrevious.setAttribute('disabled', 'true')
    }
  }

  function next() {
    if (imageIndex < 3) {
      btnPrevious.removeAttribute("disabled")
      postion -= IMAGE_WIDTH;
      images.style.transform = `translateX(${postion}px)`;
      imageIndex = imageIndex + 1;
    }
    if (imageIndex == 3) {
      btnNext.setAttribute('disabled', 'true')
    }
  }

  function init() {
    btnPrevious.style.opacity = '0';
    btnPrevious.addEventListener("click", previous)
    btnNext.addEventListener("click", next)
  }
  if (imageIndex == 3) {
    btnNext.setAttribute('disabled', 'true')
  }

  function init() {
    btnPrevious.style.opacity = '0';
    btnPrevious.addEventListener("click", previous)
    btnNext.addEventListener("click", next)
  }

  init();

  // 이미지 스크립트 JS 끝-------------------

  
</script>