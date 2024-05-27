<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>동영상 강의를 눌렀을때 나오는 화면</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #e9ecef;
        }
        h1 {
            color: #495057;
            text-align: center;
            margin: 40px 0;
        }
        .course-container {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 10px;
            background-color: #ffffff;
            margin: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            transition: 0.3s;
            width: 330px;
            height: 400px;
            overflow: auto;
        }
        .course-container:hover {
            transform: scale(1.05);
        }
        .course-container img {
            max-width: 100%;
            max-height: 55%;
            object-fit: cover;
            border-radius: 5px;
        }
        .course-info {
            padding: 15px;
            text-align: left;
            /*             overflow: auto; /* 내용이 넘칠 경우 스크롤바 표시 */
            max-height: 30%; /* 카드 내에서 정보 섹션의 최대 높이 제한 */
        }
        .description {
            overflow: auto; /* 컨테이너 너비를 넘어가는 텍스트 숨기기 */
        }
        .fa-icon {
            margin-right: 5px;
        }
    </style>
</head>
<body>

<center>
    <c:if test="${empty list}">
        <h1>패키지가 없습니다</h1>
    </c:if>
    <h1><i class="fas fa-video fa-icon"></i>패키지</h1>
    <table width="1000" height="470">
        <c:set var="j" value="0"/>
        <c:forEach var="list" items="${list}">
            <c:if test="${j % 4 == 0}">
                <tr align="center">
            </c:if>
            <td>
                <div class="course-container">
                    <a href="/package/${list.packId}?destinationName=${list.destinationName}">
                        <img src="/images/travel.jpg">
                        <div class="course-info">
                             <p><strong>번호</strong> : ${list.packId}</p>
                            <p><strong>여행지</strong> : ${list.destinationAlias}</p>
                            <p><strong>패키지이름</strong> : ${list.packName}</p>
                             <p><strong>여행타입</strong> : ${list.packType}</p>
                              <p><strong>패키지여행 시작날짜</strong> : ${list.startDate}</p>
                               <p><strong>패키지여행 마지막날짜</strong> : ${list.endDate}</p>
                                <p><strong>일인당 가격</strong> : ${list.price}</p>
                        </div>
                    </a>
                </div>
            </td>
            <c:set var="j" value="${j+1}"/>
            <c:if test="${j % 4 == 0}">
                </tr>
            </c:if>
        </c:forEach>
    </table>
    <!-- 강의를 검색하는 기능 구현 추가 예정 강의이름, 강사이름, 카테고리명으로 검색할 수 있도록 -->
</center>

</body>
</html>