<%@ page import="java.math.BigInteger" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String contextPath = request.getContextPath();

    String clientId = "e8WGcOTLKR6mfuHWudqi";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8081/login/naver", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
%>
<main class="th-layout-main ">
    <!-- [S]bloomcity-N10 -->
    <div class="bloomcity-N10" data-bid="WnLvN6Jz4C">
        <div class="content-container">
            <div class="form-wrap">
                <div class="form-header">
                    <h3 class="form-tit">LOGIN</h3>
                </div>
                <div class="form-body">
                    <form method="post" action="login">
                        <div class="tabset tabset-fluid border-bottom">
                            <ul class="tabset-list tabset-lg">
                                <li class="tabset-item">
                                    <a class="tabset-link active" href="javascript:void(0)">
                                        <span>회원 로그인</span>
                                    </a>
                                </li>

                            </ul>
                        </div>
                        <div class="inputset inputset-line inputset-lg">
                            <input type="text" class="inputset-input form-control" placeholder="아이디" aria-label="ID" name="customerId">
                        </div>
                        <div class="inputset inputset-line inputset-lg">
                            <input type="password" class="inputset-input form-control" placeholder="비밀번호" aria-label="Password" name="password">
                        </div>

                        <ul class="contents-list d-flex justify-content-center">
                            <li class="contents-item">
                                <a href="/member" class="contents-link">회원가입</a>
                            </li>
                            <li class="contents-item">
                                <a href="javascript:void(0)" class="contents-link">아이디 찾기</a>
                            </li>
                            <li class="contents-item">
                                <a href="javascript:void(0)" class="contents-link">비밀번호 찾기</a>
                            </li>
                        </ul>
                        <div class="btn-box">
<%--                            <a class="btnset2 btnset-lg btnset-rect" href="javascript:void(0)">로그인</a>--%>
                            <input type="submit" class="btnset2 btnset-lg btnset-rect" value="로그인">
                        </div>
                    </form>
                </div>
                <div class="form-footer">
                    <div class="form-footer-tit">
                        <span class="fw-500">SNS 계정으로 로그인</span>
                    </div>
                    <a class="btnset btnset-round contents-start-kakao" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=9e9c47f1553d5454adc41705006331a5&redirect_uri=http://localhost:8081/member/KaKaoCallback">
                        <img class="btn-icon" src="/icons/icon_kakao_circle.svg" alt="카카오로그인">
                    </a>
                    <a class="btnset btnset-round contents-start-naver" href="<%=apiURL%>">
                        <img class="btn-icon" src="/icons/icon_naver_circle.svg" alt="네이버로그인">
                    </a>
                    <a class="btnset btnset-round contents-start-naver" href="javascript:void(0)">
                        <img class="btn-icon" src="/icons/icon_apple_circle.svg" alt="애플로그인">
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- [E]bloomcity-N10 -->
</main>