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
            <select name="cls" id="cls">
                <option value="none" hidden>말머리</option>
                <option value=1 ${vo.cls==1 ? 'selected' : '' }>캠핑후기</option>
                <option value=2 ${vo.cls==2 ? 'selected' : '' }>꿀팁공유</option>
                <option value=3 ${vo.cls==3 ? 'selected' : '' }>메이트찾기</option>
                <option value=4 ${vo.cls==4 ? 'selected' : '' }>건의사항</option>
            </select>
            <input type="hidden" name="bno" value="${vo.bno}" readonly>
            <input type="text" class="titleM" name="title" value="${vo.title}">
            <input type="hidden" class="IdM" name="idBox" value="${vo.writer}" readonly>
        </div>

        <div class="contentBox">
            <textarea class="contentM form-control" name="content" id="exampleTextarea">${vo.content}</textarea>
        </div>

        <div class="btnBox">
            <button type="button" class="listBtn btn btn-secondary" id="listBtn"
                onclick="location.href='${pageContext.request.contextPath}/board/boardList'">목록</button>
            <button type="button" class="deltBtn btn btn-secondary" id="delBtn"
                onclick="location.href='${pageContext.request.contextPath}/board/delete?bno=${vo.bno}'">삭제</button>
            <button type="submit" class="modifyBtn btn btn-secondary" id="modifyBtn">완료</button>
        </div>
    </form>
</div>

<%@ include file="../include/footer.jsp" %>

<script>
    const $form = document.updateForm;

    // 말머리 잠그기.
    const $cls = document.getElementById('cls');
    $cls.setAttribute('onFocus', 'this.initialSelect = this.selectedIndex');
    $cls.setAttribute('onChange', 'this.selectedIndex = this.initialSelect');

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
</script>