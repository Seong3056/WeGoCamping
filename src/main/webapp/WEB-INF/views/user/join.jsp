<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>회원가입</title>
<link href="${pageContext.request.contextPath}/css/join.css" rel="stylesheet">

<%@ include file="../include/header.jsp" %>

<section>
    <div class="wrap">

        <div class="join">
            <div class="joinBox">
                <div class="joinUser">
                    <h3> 회원가입</h3>
                </div>
                <form name="join" action="${pageContext.request.contextPath}/user/join" method="post">
                    <div class="joinMain">
                        <div class="form-group">
                            <label for="name" class="JName">이름</label> <br>
                            <input type="text" name="userName" id="userName">
                        </div>
                        <div class="form-group">

                            <label for="id" class="JId">아이디</label> <br>
                            <div class="id-box">
                                <input type="text" name="userId" id="userId" placeholder="8~16글자">
                            </div>
                            <p class="msg" id="msgId"></p>
                        </div>
                        <div class="form-group">
                            <label for="pw" class="JPw">비밀번호</label> <br>
                            <input type="password" name="userPw" id="userPw" placeholder="(영 대/소문자, 숫자 조합 8~16자 이상)">
                            <p class="msg" id="msgPw"></p>
                        </div>

                        <div class="form-group">
                            <label for="pwCheck" class="JPCheck">비밀번호 확인</label><br>
                            <input type="password" name="pwCheck" id="pwCheck" placeholder=" 비밀번호를 한 번 더  입력해주세요">
                            <p class="msg" id="msgPwCheck"></p>
                        </div>

                        <div class="form-group">
                            <label for="phoneNum" class="JPhone">휴대폰 번호</label> <br>
                            <input type="text" name="userPhone" id="phoneNum">
                        </div>

                        <div class="form-group">
                            <label for="email" class="JEmail">이메일</label> <br>
                            <div class="mailbox">
                                <div class="mailAuth">
                                    <input type="text" name="userEmail1" id="email1" class="emailBtn">
                                    <select name="userEmail2" id="email2">
                                        <option>@naver.com</option>
                                        <option>@hanmail.net</option>
                                        <option>@gmail.com</option>
                                        <option>@nate.com</option>
                                    </select>
                                    <button type="button" id="mailSendBtn">인증번호 전송</button>
                                </div>

                                <div class="mailCheckBox">
                                    <input type="text" id="mailCheckInput" placeholder="인증번호 6자리를 입력하세요." maxlength="6"
                                        disabled="disabled">
                                    <br>
                                    <button type="button" id="mailCheckBtn" class="checkBoxE">이메일 인증</button>
                                </div>
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="address" class="JAddr">주소</label>
                            <div class="addr">
                                <div class="input-group">
                                    <input type="text" name="addrZipNum" id="addrZipNum" placeholder="우편번호" readonly>
                                    <br>
                                    <button type="button" class="CheckBoxA" onclick="findAddr()">주소찾기</button>
                                </div>
                                <input type="text" name="addrBasic" id="addrBasic" placeholder="기본주소">
                                <input type="text" name="addrDetail" id="addrDetail" class="addrDetail"
                                    placeholder="상세주소">
                            </div>
                        </div>
                        <!-- <div class="form-group">
                            
                        </div>
                        <div class="form-group">
                            
                        </div> -->

                        <div class="bottomBtn">
                            <div class="form-group">
                                <button type="submit" id="joinBtn" class="fixBtn">회원가입</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<%@ include file="../include/footer.jsp" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    document.getElementById('joinBtn').onclick = () => {
        console.log('회원가입 버튼이 클릭됨');

        //id 중복 검사
        idCheck();
        //pw 유효성 검사

    }
    /* ----------------------------아이디 유효성검사---------------------------*/
    document.getElementById('userId').onkeyup = function () {
        // console.log(document.getElementById('userId').value.length);
        const regEx = /^[A-Za-z0-9]{6,12}$/;
        if (regEx.test(document.getElementById('userId').value)) {

            /* ----아이디 중복체크----*/
            const reqObj = {
                method: 'post',
                headers: {
                    'Content-Type': 'text/plain'
                },
                body: document.getElementById('userId').value
            };

            fetch('${pageContext.request.contextPath}/user/idCheck', reqObj)
                .then(rs => rs.text())
                .then(data => {
                    if (data === 'duplicated') {
                        console.log('중복된 아이디');
                        document.getElementById('msgId').textContent = '중복된 아이디 입니다.';
                        document.getElementById('userId').style.borderColor = '#ff000030';
                        document.getElementById('userId').style.boxShadow = '1px 1px 5px #ff000030';
                    } else {
                        console.log('사용가능한 아이디');
                        document.getElementById('msgId').textContent = '사용가능한 아이디 입니다.';
                        document.getElementById('userId').style.borderColor = '#0080008a';
                        document.getElementById('userId').style.boxShadow = '1px 1px 5px #0080008a';
                    }
                })
            /* ====아이디 중복체크====*/
        } else {
            if (document.getElementById('userId').value.length < 6)
                document.getElementById('msgId').textContent = '아이디가 너무 짧습니다.';
            else if (document.getElementById('userId').value.length > 12)
                document.getElementById('msgId').textContent = '아이디가 너무 깁니다.';
            document.getElementById('userId').style.border = '1px solid #ff000030';
            document.getElementById('userId').style.boxShadow = '1px 1px 5px #ff000030';
        }


    }
    /*=============================아이디 유효성검사============================*/

    /* --------------------------비밀번호 유효성검사---------------------------*/
    document.getElementById('userPw').onkeyup = function () {
        const regEx = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$/;
        if (regEx.test(document.getElementById('userPw').value)) {
            document.getElementById('msgPw').textContent = '사용가능한 비밀번호 입니다.';
            document.getElementById('userPw').style.borderColor = '#0080008a';
            document.getElementById('userPw').style.boxShadow = '1px 1px 5px #0080008a';

        } else {
            document.getElementById('msgPw').textContent = '올바르지 않은 비밀번호입니다.';
            document.getElementById('userPw').style.border = '1px solid #ff000030';
            document.getElementById('userPw').style.boxShadow = '1px 1px 5px #ff000030';
        }
    }
    /* --------------------------비밀번호 유효성검사---------------------------*/

    /* =============================비밀번호 확인==============================*/
    document.getElementById('pwCheck').onkeyup = function () {

        if (document.getElementById('userPw').value ===
            document.getElementById('pwCheck').value) {
            document.getElementById('msgPwCheck').textContent = '비밀번호가 일치합니다.';
            document.getElementById('pwCheck').style.borderColor = '#0080008a';
            document.getElementById('pwCheck').style.boxShadow = '1px 1px 5px #0080008a';

        } else {
            document.getElementById('msgPwCheck').textContent = '비밀번호가 일치하지 않습니다.';
            document.getElementById('pwCheck').style.border = '1px solid #ff000030';
            document.getElementById('pwCheck').style.boxShadow = '1px 1px 5px #ff000030';
        }
    }
    /* ==============================비밀번호 확인================================*/


    /*-------------------------------이메일 인증-------------------------------*/
    document.getElementById('mailSendBtn').onclick = () => {
        if (document.getElementById('email1').value === '') {
            return;
        }
        const reqObj = {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                "userId": document.getElementById('userId').value,
                'userEmail1': document.getElementById('email1').value,
                'userEmail2': document.getElementById('email2').value
            }),

        }
        document.getElementById('mailCheckInput').removeAttribute('disabled');
        fetch('${pageContext.request.contextPath}/user/authMail', reqObj)
            .then(rs => rs.text())
            .then(data => {
                console.log("인증번호: " + data);
                document.getElementById('mailCheckBtn').onclick = () => {
                    if (document.getElementById('mailCheckInput').value === data) {
                        alert('이메일 인증이 완료되었습니다.');
                        document.getElementById('mailCheckInput').disabled = true;
                        document.getElementById('mailCheckBtn').disabled = true;
                        document.getElementById('email1').readOnly = true;
                        document.getElementById('email2').readOnly = true;
                    } else {
                        alert('인증번호가 다릅니다.');
                    }
                }

            })
    }
    /*===============================이메일 인증===============================*/
    function findAddr() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('addrZipNum').value = data.zonecode;
                document.getElementById('addrBasic').value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addrDetail').focus();
            }
        }).open();
    } //주소찾기 api 끝.
</script>