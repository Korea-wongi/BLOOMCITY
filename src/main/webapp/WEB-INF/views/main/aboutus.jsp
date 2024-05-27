<%--
  Created by IntelliJ IDEA.
  User: 605
  Date: 2024-05-02
  Time: 오후 6:20
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String contextPath = request.getContextPath();
%>
<main class="th-layout-main ">
    <!-- [S]bloomcity-N31 -->
    <div class="bloomcity-N31" data-bid="XULVn6KuQ7">
        <div class="content-container">
            <div class="container-md">
                <div class="con-tit textset">
                    <h2 class="textset-tit ff-po">About</h2>
                    <p class="textset-desc">전세계 어디에서나 품격있는 서비스와 시설로 감동을 주는 블롬시티를 소개합니다.</p>
                </div>
                <div class="tabset tabset-solid">
                    <ul class="tabset-list tabset-lg">
                        <li class="tabset-item">
                            <a class="tabset-link" href="javascript:void(0)">
                                <span>브랜드스토리</span>
                            </a>
                        </li>
                        <li class="tabset-item">
                            <a class="tabset-link active" href="javascript:void(0)">
                                <span>오시는길</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="content-group">
                    <div class="left con-wrap">
                        <!-- * 카카오맵 - 지도퍼가기 -->
                        <!-- 1. 지도 노드 -->
                        <div id="daumRoughmapContainer1688712963834" class="root_daum_roughmap root_daum_roughmap_landing"></div>
                        <!--
                    2. 설치 스크립트
                    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                    -->
                        <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
                        <!-- 3. 실행 스크립트 -->
                        <script charset="UTF-8">
                            new daum.roughmap.Lander({
                                "timestamp": "1688712963834",
                                "key": "2ffv9",
                            }).render();
                        </script>
                    </div>
                    <div class="right con-wrap">
                        <div class="textset">
                            <p class="textset-subtit">Location</p>
                            <h2 class="textset-tit ff-po">블롬시티호텔 오시는 길</h2>
                        </div>
                        <ul class="info-content">
                            <li>
                                <figure class="icon">
                                    <img src="..//icons/icon_map_blod_black.svg" alt="아이콘">
                                </figure>
                                <dl class="textset">
                                    <dt class="textset-tit">주소</dt>
                                    <dd class="textset-desc"> 서울시 영등포구 문래동12 345-678 </dd>
                                </dl>
                            </li>
                            <li>
                                <figure class="icon">
                                    <img src="..//icons/icon_tel.svg" alt="아이콘">
                                </figure>
                                <dl class="textset">
                                    <dt class="textset-tit"> 전화번호</dt>
                                    <dd class="textset-desc">
                                        <p>
                                            <span class="co-text4">대표전화</span>
                                            <span>02-123-4567</span>
                                        </p>
                                        <p>
                                            <span class="co-text4">팩스번호</span>
                                            <span>02-234-5678</span>
                                        </p>
                                    </dd>
                                </dl>
                            </li>
                            <li>
                                <figure class="icon">
                                    <img src="..//icons/icon_map_blod_black.svg" alt="아이콘">
                                </figure>
                                <dl class="textset">
                                    <dt class="textset-tit">이메일</dt>
                                    <dd class="textset-desc">
                                        <span class="co-text4">openfield@openfield.co.kr</span>
                                    </dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- [E]bloomcity-N31 -->
</main>

