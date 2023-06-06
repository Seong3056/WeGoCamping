<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<title>로그인</title>
<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">

<%@ include file="../include/header.jsp" %>

<section>
    <div class="wrap">
        <div class="login">
            <div class="loginAll">
                <div class="loginLogo">
                    <h3>로그인</h3>
                </div>


                <form action="${pageContext.request.contextPath}/user/login" name="loginForm" method="post">
                    <div class="loginMain">
                        <div class="input-group">
                            <input name="userId" type="text" id="userId" placeholder="ID를 입력해주세요.">
                        </div>
                        <div class="input-group">
                            <input name="userPw" type="password" id="userPw" placeholder="비밀번호를 입력해주세요.">
                        </div>
                    </div>
                    <div class="idRm">
                        <input type="checkbox" class="idRmBox" id="idRmbox">
                        <label for="idRm">아이디 저장하기</label>
                    </div>
                    <div class="choiceBtn">
                        <div class="JoinBox">
                            <button type="button" class="joinBtn" id="joinBtn">
                                회원가입
                            </button>
                        </div>
                        <div class="loginBox">
                            <button type="button" class="loginBtn" id="loginBtn">
                                로그인
                            </button>
                        </div>
                    </div>
                </form>


                <div class="serchBox">
                    <div class="searchId">
                        <a href="#">아이디 찾기</a>
                    </div>
                    <div class="searchPw">
                        <a href="#">비밀번호 찾기</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>

<%@ include file="../include/footer.jsp" %>

<script>
    /* 로그인창 접속시 헤더 로그인버튼 없애기 */
    window.onload = () => {
        document.getElementById('loginH').style.display = 'none';
    }
    const urlParams = new URL(location.href).searchParams;
    const cno = urlParams.get('cno');
    console.log(cno);

    const msg = '${msg}';
    if (msg === 'joinSuccess') {
        alert('회원 가입 정상 처리되었습니다.');
    } else if (msg === 'loginFail') {
        alert('로그인에 실패했습니다. 아이디와 비밀번호를 확인하세요.');
    }

    document.getElementById('loginBtn').onclick = () => {
        if (document.getElementById('userId').value === '') {
            alert('아이디를 입력해주세요!');
            return;
        }
        if (document.getElementById('userPw').value === '') {
            alert('비밀번호를 작성하세요!');
            return;
        }
        if (cno !== '') {
            document.loginForm.setAttribute('action', '${pageContext.request.contextPath}/user/login?cno=' + cno);
            document.loginForm.submit();
        }

        document.getElementById('joinBtn').onclick = () => {
            console.log('회원가입버튼 클ㄹ');
            location.href = '${pageContext.request.contextPath}/user/join';
        }
    }
</script>