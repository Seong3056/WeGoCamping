<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link href="${pageContext.request.contextPath}/css/join.css" rel="stylesheet">
    </head>
    
<%@ include file="../include/header.jsp" %>

<section>
        <div class="wrap">

            <div class="join">
                <div class="joinBox">
                    <div class="joinUser">
                        <h3> 회원가입</h3>
                    </div>
                    <form action="#">
                        <div class="joinMain">
                            <div class="form-group">
                                <label for="name" class="JName">이름</label> <br>
                                <input type="text" name="userName" id="userName">
                            </div>
                            <div class="form-group">
                            
                                <label for="id" class="JId">아이디</label> <br>
                            <div class="id-box">
                                <input type="text" name="userId" id="userId" placeholder="8~16글자" y>
                            </div>
                                <div class="idCheck">
                                    <button type="button" class="idCheckBtn" id="idCheckBtn">아이디중복체크</button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pw" class="JPw">비밀번호</label> <br>
                                <input type="password" name="userPw" id="userPw"
                                    placeholder="(영 대/소문자, 숫자 조합 8~16자 이상)">

                            </div>
                            <div class="form-group">
                                <label for="pwCheck" class="JPCheck">비밀번호 확인</label><br>
                                <input type="password" name="pwCheck" id="pwCheck" placeholder=" 비밀번호를 한 번 더  입력해주세요">

                            </div>
                            <div class="form-group">
                                <label for="phoneNum" class="JPhone">휴대폰 번호</label> <br>
                                <input type="text" name="phoneNum" id="phoneNum">
                            </div>
                            <div class="form-group">
                                <label for="email" class="JEmail">이메일</label> <br>
                                <input type="text" name="email1" id="email1" class="emailBtn">
                                <select name="email2" id="email2">
                                    <option>@naver.com</option>
                                    <option>@hanmail.net</option>
                                    <option>@gmail.com</option>
                                    <option>@nate.com</option>
                                </select>

                            </div>
                            <div class="mailCheckBox">
                                <input type="text" class="mail-check-input" placeholder="인증번호 6자리를 입력하세요." maxlength="6"
                                    disabled="disabled">

                                <button type="button" id="mail-check-btn" class="checkBoxE">이메일 인증</button>

                            </div>

                            <div class="form-group">
                                <label for="address" class="JAddr">주소</label>
                                <div class="input-group">
                                    <input type="text" name="address" id="address" placeholder="우편번호" readonly>

                                    <button type="button" class="CheckBoxA" onclick="searchAddress()">주소찾기</button>

                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" name="addrBasic" id="addrBasic" placeholder="기본주소">
                            </div>
                            <div class="form-group">
                                <input type="text" name="addrBasic" id="addrDetail" class="addrDetail"
                                    placeholder="상세주소">
                            </div>
                        
                        <div class="bottomBtn">
                            <div class="form-group">
                                <button type="button" id="fixBtn" class="fixBtn">수정완료</button>
                            </div>
                            <div class="form-group">
                                <button type="button" id="goMainBtn" class="goMainBtn">메인으로</button>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    
    <%@ include file="../include/footer.jsp" %>
    