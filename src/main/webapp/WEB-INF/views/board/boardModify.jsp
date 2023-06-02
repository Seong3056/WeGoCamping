<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>



<%@ include file="../include/header.jsp" %>

    <title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/boardDetail.css">




    <div class="wrap">
        <div class="headBox">
            <h3>수정하기</h3>
        </div>
        <form action="${pageContext.request.contextPath}/board/update" method="get" name="updateForm">

            <div class="titleBox">
                
                <input type="text" name="bno" value="${vo.bno}" hidden >
                <input class="titleM" name="title" value="${vo.title}">
                <input class="IdM" name="idBox" value="${vo.writer}" readonly placeholder="id value 예정">
                
            </div>
            <div class="contentBox">

                <textarea class="contentM" name="content">${vo.content}</textarea>
            </div>
            <div class="btnBox">
                <button type="button" class="listBtn" id="listBtn"
                    onclick="location.href='${pageContext.request.contextPath}/board/boardList'">목록</button>
                <button type="submit" class="deltBtn" id="delBtn">삭제</button>
                <button type="submit" class="modifyBtn" id="modifyBtn">완료</button>
            </div>
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
</script>