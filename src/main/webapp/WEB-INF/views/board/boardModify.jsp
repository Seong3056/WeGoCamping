<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<title>게시글 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/boardDetail.css">

<%@ include file="../include/header.jsp" %>

<div class="wrap">
    <div class="headBox">
        <h3>수정하기</h3>
    </div>
    <form action="${pageContext.request.contextPath}/board/update" method="post" name="updateForm">

        <div class="titleBox">
            <select name="cls">
                <option value="none" selected hidden>말머리</option>
                <option value=1>캠핑후기</option>
                <option value=2>꿀팁공유</option>
                <option value=3>메이트찾기</option>
                <option value=4>건의사항</option>
            </select>
            <input type="text" name="bno" value="${vo.bno}" hidden>
            <input class="titleM" name="title" value="${vo.title}">
            <input class="IdM" name="idBox" value="${vo.writer}" readonly placeholder="id value 예정">

        </div>
        <div class="contentBox">

            <textarea class="contentM form-control" name="content" id="exampleTextarea">${vo.content}</textarea>
        </div>

        <div class="filebox">
            <label for="file" id="inputFile" style="display: none;">파일첨부</label>
            <input type="file" name="file" id="file" style="display: none;">
        </div>

        <div class="btnBox">
            <button type="button" class="listBtn btn btn-secondary" id="listBtn"
                onclick="location.href='${pageContext.request.contextPath}/board/boardList'">목록</button>
            <button type="button" class="deltBtn btn btn-secondary" id="delBtn"
                onclick="location.href='${pageContext.request.contextPath}/board/delete?bno=${vo.bno}'">삭제</button>
            <button type="submit" class="modifyBtn btn btn-secondary" id="modifyBtn">완료</button>
        </div>

        <select name="rating" class="rating" style="display: none;">
            <option value="none" selected hidden>별점을 주세요!</option>
            <option value="1">⭐</option>
            <option value="2">⭐⭐</option>
            <option value="3">⭐⭐⭐</option>
            <option value="4">⭐⭐⭐⭐</option>
            <option value="5">⭐⭐⭐⭐⭐</option>
        </select>
    </form>
</div>

<%@ include file="../include/footer.jsp" %>

<script>
    const $form = document.updateForm;

    document.getElementById('modifyBtn').onclick = function () {
        if ($form.title.value === '') {
            alert('제목을 입력 해주세요..');
            $form.title.focus();
            return;
        } else if ($form.content.value === '') {
            alert('내용을 입력해주세요..');
            $form.content.focus();
            return;
        } else {
            $form.submit();
        }
    }


    document.getElementById('delBtn').onclick = function () {
        if (confirm('삭제 하시겠습니까?')) {
            $form.setAttribute('action', '${pageContext.request.contextPath}/board/delete');
            $form.submit();
        }
    }

    document.querySelector('select').onclick = () => {
        const inputFile = document.getElementById('inputFile');
        const file = document.getElementById('file');

        if (document.querySelector('select').value == 1) {

            inputFile.style.display = 'block';
            file.style.display = 'block';
            rating.style.display = 'block';
        } else {

            inputFile.style.display = 'none';
            file.style.display = 'none';
            rating.style.display = 'none';
        }
    }
</script>