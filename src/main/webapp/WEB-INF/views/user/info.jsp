<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>마이 페이지</title>
<link href="${pageContext.request.contextPath}/css/mypage.css" rel="stylesheet">

<%@ include file="../include/header.jsp" %>

<!-- 정보수정창 -->
<section>
    <div class="wrap">
        <div class="menuBox">
            <div id="subMenuBox" class="infoKind">
                <form name="menuForm" method="post">
                    <input type="text" name="userId" value="${login}" readonly hidden>
                    <a href="info" class="privacy">⦁ 개인 정보 수정</a> <br>
                    <a href="reservation" class="rsvInfo">⦁ 예약 정보</a> <br>
                    <a href="myBoard" class="myText">⦁ 내 게시글</a> <br>
                </form>
            </div>
        </div>

        <div class="privacyFix">
            <div class="fixBox">
                <h3> 개인 정보 수정</h3>
                <p class="tip">* 이름과 아이디는 변경 불가능합니다.</p>
                <form name="updateForm" action="${pageContext.request.contextPath}/user/update" method="post">
                    <div class="form-group">
                        <label for="name" class="lName">이름</label> <br>
                        <input type="text" name="userName" id="userName" value="${info.userName}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="id" class="lId">아이디</label> <br>
                        <input type="text" name="userId" id="userId" value="${info.userId}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="pw" class="lPw">변경 비밀번호</label> <br>
                        <input type="password" name="userPw" id="userPw" placeholder="(영 대/소문자, 숫자 조합 8~16자 이상)">
                        <p class="msg" id="msgPw"></p>
                    </div>
                    <div class="form-group">
                        <label for="pwCheck" class="lPCheck">비밀번호 확인</label><br>
                        <input type="password" name="pwCheck" id="pwCheck" placeholder="변경할 비밀번호를 한 번 더 입력해주세요.">
                        <p class="msg" id="msgPwCheck"></p>
                    </div>
                    <div class="form-group">
                        <label for="phoneNum" class="lPhone">휴대폰 번호</label> <br>
                        <input type="text" name="userPhone" id="phoneNum" value="${info.userPhone}">
                    </div>
                    <div class="form-group">
                        <label for="email" class="lEmail">이메일</label> <br>
                        <input type="text" name="userEmail1" id="email1" class="emailBtn" value="${info.userEmail1}">
                        <select name="userEmail2" id="email2">
                            <option value="@naver.com" ${info.userEmail2=='@naver.com' ? 'selected' : '' }>@naver.com
                            </option>
                            <option value="@hanmail.net" ${info.userEmail2=='@hanmail.net' ? 'selected' : '' }>
                                @hanmail.net</option>
                            <option value="@gmail.com" ${info.userEmail2=='@gmail.com' ? 'selected' : '' }>@gmail.com
                            </option>
                            <option value="@nate.com" ${info.userEmail2=='@nate.com' ? 'selected' : '' }>@nate.com
                            </option>
                        </select>
                    </div>
                    <div class="mailMsgBox" style="display: none;">
                        <p class="msg" id="msgMail">변경된 메일로 인증을 다시 진행해 주세요!</p>
                    </div>
                    <div class="mailCheckBox">
                        <input type="text" id="mailCheckInput" class="mail-check-input" placeholder="인증번호 6자리를 입력하세요."
                            maxlength="6" disabled="disabled">
                        <button type="button" id="mailCheckBtn" class="checkBoxE btn btn-secondary">이메일 인증</button>
                    </div>
                    <div class="form-group">
                        <label for="address" class="lAddr">주소</label>
                        <div class="input-group">
                            <input type="text" name="addrZipNum" id="addrZipNum" value="${info.addrZipNum}" readonly>
                            <button type="button" class="CheckBoxA btn btn-secondary" onclick="findAddr()">주소찾기</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" name="addrBasic" id="addrBasic" value="${info.addrBasic}" readonly>
                    </div>
                    <div class="form-group">
                        <input type="text" name="addrDetail" id="addrDetail" class="addrDetail"
                            value="${info.addrDetail}" placeholder="상세주소를 입력해주세요.">
                    </div>
                    <div class="bottomBtn">
                        <div class="form-group">
                            <button type="button" id="fixBtn" class="fixBtn btn btn-secondary">수정완료</button>
                        </div>
                        <div class="form-group">
                            <button type="button" id="goMainBtn" class="goMainBtn btn btn-secondary">메인으로</button>
                        </div>
                        <div class="form-group">
                            <button type="button" id=withdrawal class="Withdrawal btn btn-secondary">탈퇴</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- 모달  -->
<div class="infoModal" id="infoModal">
 <div class="bg"></div>
    <div class="reText">
        <p>탈퇴를 원하시면 비밀번호를 입력해주세요.</p>
    </div>
    <div class="pwBox">
        <input type="password" class="inputPw" id="inputPw">
    </div>
    <div class="btnBox">
        <button type="button" class="cancle btn btn-secondary" id="cancle">취소</button>
        <button type="button" class="cplBtn btn btn-secondary" id="cplBtn">완료</button>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    $updateForm = document.updateForm;

    // 비밀번호 일치 여부 확인용 변수
    let pwChk = false;
    // 이메일 체크 변수
    let emailChk = true;
    // 기존 이메일 값 변수에 저장
    const email1 = '${info.userEmail1}';

    // 정보 수정 완료 후 진입 시 알림 처리
    if ('${msg}' === 'updateSuccess') {
        alert('회원 정보 수정이 완료되었습니다!');
    }

    // 마이페이지 메뉴 a 태그 처리
    $menuForm = document.menuForm;

    document.getElementById('subMenuBox').addEventListener('click', (e) => {
        e.preventDefault();

        if (!e.target.matches('a')) {
            return;
        }

        const targetLink = e.target.getAttribute('href');

        if (e.target.classList.contains('privacy')) {
            location.href = '${pageContext.request.contextPath}/user/info';
        } else {
            $menuForm.action = '${pageContext.request.contextPath}/user/' + targetLink;
            $menuForm.submit();
        }
    });
    // 메뉴 처리 끝.

    // 회원 정보 수정 입력값 검증.
    document.getElementById('fixBtn').addEventListener('click', (e) => {
        if(!pwChk || 
        document.getElementById('userPw').value === '' || 
        document.getElementById('pwCheck').value === '') {
            alert('비밀번호를 다시 한번 확인해주세요!');
            return;
        } else if(document.getElementById('email1').value === '' || document.getElementById('email2').value === '') {
            emailChk = false;
            alert('이메일을 확인해 주세요!');
            return;
        } else if(!emailChk) {
            alert('이메일 인증을 다시 진행해 주세요 !');
            return;
        } else {
            $updateForm.submit();
        }
    });

    document.getElementById('email1').addEventListener('input', (e) => {
        console.log(e.target.value);
        if(e.target.value === email1) {
            emailChk = true;
            document.querySelector('.mailMsgBox').style.display = 'none';
        } else {
            emailChk = false;
            document.querySelector('.mailMsgBox').style.display = 'block';
        }
    })

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
            pwChk = true;
            document.getElementById('msgPwCheck').textContent = '비밀번호가 일치합니다.';
            document.getElementById('pwCheck').style.borderColor = '#0080008a';
            document.getElementById('pwCheck').style.boxShadow = '1px 1px 5px #0080008a';
        } else {
            pwChk = false;
            document.getElementById('msgPwCheck').textContent = '비밀번호가 일치하지 않습니다.';
            document.getElementById('pwCheck').style.border = '1px solid #ff000030';
            document.getElementById('pwCheck').style.boxShadow = '1px 1px 5px #ff000030';
        }

    }
    /* ==============================비밀번호 확인================================*/

    /* 회원 탈퇴 진행 */
    document.getElementById('withdrawal').onclick = () => {
        const infoModal = document.getElementById('infoModal');
        const cancle = document.getElementById('cancle');
        const cplBtn = document.getElementById('cplBtn');
        console.log('회원탈퇴 버튼이 클릭됐습니다!');
        let id = "${login}";
        infoModal.style.display = 'block';
    }
    cplBtn.addEventListener('click', function () {
        const chPw = document.getElementById('inputPw').value;
        const withObj = {
            method: 'post',
            headers: {
                'Content-type': 'application/json'
            },
            body: JSON.stringify({
                'userId': "${login}",
                'userPw': chPw
            })
        };
        fetch('${pageContext.request.contextPath}/user/withdrawal', withObj)
            .then(rs => rs.text())
            .then(data => {

                if (data === 'true') {
                    alert('회원 탈퇴가 완료되었습니다. 그동안 감사했습니다.');
                    console.log("탈퇴했는데?");
                    infoModal.style.display = 'none';
                    window.location.href = '${pageContext.request.contextPath}/';
                } else {
                    alert('회원 탈퇴가 정상 처리 되지 않았습니다. 다시 시도해주세요.');
                    infoModal.style.display = 'none';
                    console.log(chPw);
                }
            });
    });
    // 모달 취소 버튼 클릭 시 모달 닫기
    document.getElementById('cancle').addEventListener('click', (e) => {
        infoModal.style.display = 'none';
    });
    /* 회원탈퇴 끝 */

    // 메일 인증
    document.getElementById('mailCheckBtn').onclick = () => {
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
                        emailChk = true;
                        document.querySelector('.msgMailBox').style.display = none;
                        alert('이메일 인증이 완료되었습니다.');
                        document.getElementById('mailCheckInput').disabled = true;
                        document.getElementById('mailCheckBtn').disabled = true;
                        document.getElementById('email1').readOnly = true;
                        const $email2 = document.getElementById('email2');
                        email2.setAttribute('onFocus', 'this.initialSelect = this.selectedIndex');
                        email2.setAttribute('onChange', 'this.selectedIndex = this.initialSelect');
                    } else {
                        emailChk = false;
                        alert('인증번호가 다릅니다.');
                    }
                }

            })
    };

    // 주소 찾기
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
                // api를 통해 주소 정보를 입력받았다면 상세주소를 새로 입력받기 위해 값을 비워줌.
                document.getElementById('addrDetail').value = '';
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addrDetail').focus();
            }
        }).open();
    } //주소찾기 api 끝.
</script>