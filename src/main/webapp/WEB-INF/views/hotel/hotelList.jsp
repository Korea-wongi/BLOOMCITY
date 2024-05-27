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
    <title>호텔을 눌렀을때 나오는 화면</title>
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
        
        button{
        background: none;
        border: none;
        }
    </style>
</head>
<body>

<center>
    <c:if test="${empty list}">
        <h1>등록된 호텔이 없습니다.</h1>
    </c:if>
    <h1><i class="fas fa-video fa-icon"></i>호텔 정보 수정하기</h1>
    <table width="1000" height="470">
        <c:set var="j" value="0"/>
        <c:forEach var="list" items="${list}">
            <c:if test="${j % 4 == 0}">
                <tr align="center">
            </c:if>
            <td>
                <div class="course-container">
                    <form action="/hotels/correction" method="get">
                        <img src="/images/travel.jpg">
                        <div class="course-info">
                       <input type="hidden" name="hotelName" value="${list.hotelName}">
                        <input type="hidden" name="destinationName" value="${list.destinationName}">
                        <input type="hidden" name="starRating" value="${list.starRating}">
                        <input type="hidden" name="description" value="${list.description}">
                        <input type="hidden" name="hotelId" value="${list.hotelId}">
                         <button type="submit">
							<p><strong>호텔이름</strong> :${list.hotelName}</p>
							<p><strong>도착지</strong> : ${list.destinationName}</p>
							<p><strong>Star Rating</strong> : ${list.starRating}</p>
							<p><strong>설명</strong> : ${list.description}</p>
							<p><strong>호텔 ID</strong> : ${list.hotelId}</p>
						   </button>
                        </div>
                    </form>
                </div>
            </td>
            <c:set var="j" value="${j+1}"/>
            <c:if test="${j % 4 == 0}">
                </tr>
            </c:if>
        </c:forEach>
    </table>
</center>

</body>
</html>