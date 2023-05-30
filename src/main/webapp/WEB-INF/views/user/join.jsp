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
                        <h3> ȸ������</h3>
                    </div>
                    <form action="#">
                        <div class="joinMain">
                            <div class="form-group">
                                <label for="name" class="JName">�̸�</label> <br>
                                <input type="text" name="userName" id="userName">
                            </div>
                            <div class="form-group">
                            
                                <label for="id" class="JId">���̵�</label> <br>
                            <div class="id-box">
                                <input type="text" name="userId" id="userId" placeholder="8~16����" y>
                            </div>
                                <div class="idCheck">
                                    <button type="button" class="idCheckBtn" id="idCheckBtn">���̵��ߺ�üũ</button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pw" class="JPw">��й�ȣ</label> <br>
                                <input type="password" name="userPw" id="userPw"
                                    placeholder="(�� ��/�ҹ���, ���� ���� 8~16�� �̻�)">

                            </div>
                            <div class="form-group">
                                <label for="pwCheck" class="JPCheck">��й�ȣ Ȯ��</label><br>
                                <input type="password" name="pwCheck" id="pwCheck" placeholder=" ��й�ȣ�� �� �� ��  �Է����ּ���">

                            </div>
                            <div class="form-group">
                                <label for="phoneNum" class="JPhone">�޴��� ��ȣ</label> <br>
                                <input type="text" name="phoneNum" id="phoneNum">
                            </div>
                            <div class="form-group">
                                <label for="email" class="JEmail">�̸���</label> <br>
                                <input type="text" name="email1" id="email1" class="emailBtn">
                                <select name="email2" id="email2">
                                    <option>@naver.com</option>
                                    <option>@hanmail.net</option>
                                    <option>@gmail.com</option>
                                    <option>@nate.com</option>
                                </select>

                            </div>
                            <div class="mailCheckBox">
                                <input type="text" class="mail-check-input" placeholder="������ȣ 6�ڸ��� �Է��ϼ���." maxlength="6"
                                    disabled="disabled">

                                <button type="button" id="mail-check-btn" class="checkBoxE">�̸��� ����</button>

                            </div>

                            <div class="form-group">
                                <label for="address" class="JAddr">�ּ�</label>
                                <div class="input-group">
                                    <input type="text" name="address" id="address" placeholder="�����ȣ" readonly>

                                    <button type="button" class="CheckBoxA" onclick="searchAddress()">�ּ�ã��</button>

                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" name="addrBasic" id="addrBasic" placeholder="�⺻�ּ�">
                            </div>
                            <div class="form-group">
                                <input type="text" name="addrBasic" id="addrDetail" class="addrDetail"
                                    placeholder="���ּ�">
                            </div>
                        
                        <div class="bottomBtn">
                            <div class="form-group">
                                <button type="button" id="fixBtn" class="fixBtn">�����Ϸ�</button>
                            </div>
                            <div class="form-group">
                                <button type="button" id="goMainBtn" class="goMainBtn">��������</button>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    
    <%@ include file="../include/footer.jsp" %>
    