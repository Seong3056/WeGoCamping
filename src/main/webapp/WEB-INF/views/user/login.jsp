<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">
    </head>
	
    
<%@ include file="../include/header.jsp" %>


    <section>
        <div class="wrap">
            <div class="login">
                <div class="loginAll">
                    <div class="loginLogo">
                        <h3>�α���</h3>
                    </div>
                    <div class="inputBox">
                    <div class="loginMain">
                        <div class="input-group">
                            <input type="text" class="userNameBox" id="userNameBox" placeholder="ID�� �Է����ּ���.">
                        </div>
                        <div class="input-group">
                            <input type="password" class="userPwBox" id="userPwBox" placeholder="��й�ȣ�� �Է����ּ���.">
                        </div>
                    </div>
                        <div class="idRm">
                            <input type="checkbox" class="idRmBox" id="idRmbox">
                            <label for="idRm">���̵� �����ϱ�</label>
                        </div>
                        <div class="choiceBtn">
                            <div class="JoinBox">
                                <button type="button" class="joinBtn" id="joinBtn">
                                    ȸ������
                                </button>
                            </div>
                            <div class="loginBox">
                                <button type="button" class="loginBtn" id="loginBtn">
                                    �α���
                                </button>
                            </div>
                        </div> 
                        <div class="serchBox">   
                            <div class="searchId">
                                <a href="#">���̵� ã��</a>
                            </div>
                            <div class="searchPw">
                                <a href="#">��й�ȣ ã��</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
     <%@ include file="../include/footer.jsp" %>
