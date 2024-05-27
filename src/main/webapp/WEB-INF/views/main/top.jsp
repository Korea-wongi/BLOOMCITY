<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
</head>

<%

	String contextPath = request.getContextPath();

%>
<header class="bloomcity-N1" data-bid="jFlvm1V1Ec">
    <div class="header-container container-lg">
        <div class="header-left">
            <h1 class="header-title">
                <a href="/">

                    <img src="/images/img_logo_black.png" alt="로고">
                </a>
            </h1>
        </div>

        <div class="header-center">
            <%
                //Session내장객체 메모리 영역에 session값 얻기
                String id = (String) session.getAttribute("id");
                System.out.println(id);
                //Session에 값이 저장되어 있지 않으면?
                if (id == null) {
            %>
            <ul class="header-member">
                <li>
                    <a href="javascript:void(0)">로그인123</a>
                </li>
                <li>
                    <a href="javascript:void(0)">회원가입</a>
                </li>
            </ul>
            <%
            } else if(id == "admin") {
            %>
            	<ul class="header-member">
                <li>
                    <a href="javascript:void(0)">로그아웃</a>
                </li>
                <li>
                    <a href="/admin">관리자 페이지</a>
                </li>
                <li>
                    <a href="javascript:void(0)">마이페이지</a>
                </li>
            </ul>
            <%	
            } else {
            %>
            <ul class="header-member">
                <li>
                    <a href="javascript:void(0)">로그아웃</a>
                </li>
                <li>
                    <a href="javascript:void(0)">마이페이지</a>
                </li>
            </ul>
            <%
                }
            %>
            <ul class="header-gnblist">

                <li class="header-gnbitem">
                    <a class="header-gnblink" href="javascript:void(0)">
                        <span>패키지</span>
                    </a>
                    <ul class="header-sublist">
                        <li class="header-subitem">
                            <a class="header-sublink" href="/package/list/all">
                                <span>전체</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>유럽</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="/package/list/japan">
                                <span>일본</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="/package/list/eastsouthasia">
                                <span>동남아</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="header-gnbitem">
                    <a class="header-gnblink" href="javascript:void(0)">
                        <span>카테고리</span>
                    </a>
                    <ul class="header-sublist">
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>전체</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>효도관광</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>허니문</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="header-gnbitem">
                    <a class="header-gnblink" href="javascript:void(0)">
                        <span>호텔</span>
                    </a>
                    <ul class="header-sublist">
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>부대시설</span>
                            </a>
                        </li>

                        <li class="header-subitem">
                            <a class="header-sublink" href="/hotels">
                                <span>호텔 등록</span>
                            </a>
                        </li>
                         <li class="header-subitem">
                            <a class="header-sublink" href="/hotels/correctionList">
                                <span>호텔 정보 수정</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="/destinations">
                                <span>목적지 등록</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="/restaurants">
                                <span>식당 등록</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="/attractions">
                                <span>명소 등록</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="/packages">
                                <span>패키지 등록</span>
                            </a>
                        </li>

                    </ul>
                    <!-- <ul class="header-sublist">
                    <li class="header-subitem">
                      <a class="header-sublink" href="javascript:void(0)">
                        <span></span>
                      </a>
                    </li>
                  </ul> -->
                </li>
                <li class="header-gnbitem">
                    <a class="header-gnblink" href="javascript:void(0)">
                        <span>CUSTOMER</span>
                    </a>
                    <ul class="header-sublist">
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>공지사항</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>FAQ</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>고객의소리</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="header-gnbitem">
                    <a class="header-gnblink" href="/link">
                        <span>ABOUT</span>
                    </a>
                    <ul class="header-sublist">
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>브랜드스토리</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="/aboutus">
                                <span>오시는길</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="header-right">
            <div class="header-utils">
                <a href="/reservation">
                    <button class="btn-calendar">
            <span class="btn-icon">
              <img src="/icons/icon_calendar_check_white.svg" alt="검색">
            </span>
                        <span>예약하기</span>
                    </button>
                </a>
                <button class="btn-allmenu">
                    <img src="/icons/ico_menu_black.svg" alt="PC메뉴">
                </button>
                <button class="btn-momenu">
                    <img src="/icons/ico_menu_black.svg" alt="모바일메뉴">
                </button>
                <button class="btn-moclose">
                    <img src="/icons/ico_close_black.svg" alt="닫기">
                </button>
            </div>
        </div>
    </div>
    <div class="header-fullmenu fullmenu-top">
        <div class="fullmenu-wrapper">
            <div class="fullmenu-head">
                <h4 class="fullmenu-title">
                    <a href="">
                        <img src="/images/img_logo_black.png" alt="로고">
                    </a>
                </h4>
                <%
                    if(id == null){
                %>
                <ul class="fullmenu-member">
                    <li>
                        <a href="/login">로그인</a>
                    </li>
                    <li>
                        <a href="/member">회원가입</a>
                    </li>
                </ul>
                <%
                    } else if(id.equals("admin")) {
                %>
                <ul class="fullmenu-member">	
                	<li>
                        <a href="/logout">로그아웃</a>
                    </li>
                    <li>
                        <a href="/admin">관리자 페이지</a>
                    </li>
                </ul>
                	
                <%    	
                    }else{
                %>
                <ul class="fullmenu-member">
                    <li>
                        <a href="/logout">로그아웃</a>
                    </li>
                    <li>
                        <a href="/editForm">회원정보수정</a>
                    </li>
                  
                </ul>
                <%
                    }
                %>
            </div>
            <ul class="fullmenu-gnblist">
                <li class="fullmenu-gnbitem">
                    <a class="fullmenu-gnblink" href="javascript:void(0)">
                        <span>ABOUT</span>
                    </a>
                    <ul class="header-sublist">
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>브랜드스토리</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>오시는길</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="fullmenu-gnbitem">
                    <a class="fullmenu-gnblink" href="javascript:void(0)">
                        <span>패키지</span>
                    </a>
                    <ul class="header-sublist">
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>전체</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>유럽</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>일본</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>동남아</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="fullmenu-gnbitem">
                    <a class="fullmenu-gnblink" href="javascript:void(0)">
                        <span>카테고리</span>
                    </a>
                    <ul class="header-sublist">
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>전체</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>허니문</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>효도관광</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="fullmenu-gnbitem">
                    <a class="fullmenu-gnblink" href="javascript:void(0)">
                        <span>호텔</span>
                    </a>
                    <ul class="header-sublist">
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>부대시설</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="fullmenu-gnbitem">
                    <a class="fullmenu-gnblink" href="javascript:void(0)">
                        <span>CUSTOMER</span>
                    </a>
                    <ul class="header-sublist">
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>공지사항</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>FAQ</span>
                            </a>
                        </li>
                        <li class="header-subitem">
                            <a class="header-sublink" href="javascript:void(0)">
                                <span>고객의소리</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <button class="fullmenu-close">
            <img src="/icons/ico_close_black.svg" alt="닫기">
        </button>
    </div>
</header>
</html>