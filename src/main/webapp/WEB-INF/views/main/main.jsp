<%--
  Created by IntelliJ IDEA.
  User: 605
  Date: 2024-04-30
  Time: 오후 5:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%-- JSTL 전체라이브러리에 속한 core에 속한 태그들 사용을 위해  반드시 작성해야 하는 한줄 --%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("UTF-8");  %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="imagetoolbar" content="no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="title" content="웹사이트">
    <meta name="description" content="웹사이트입니다.">
    <meta name="keywords" content="키워드,키워드,키워드">
    <meta property="og:title" content="웹사이트">
    <meta property="og:description" content="웹사이트입니다">
    <meta property="og:image" content="https://웹사이트/images/opengraph.png">
    <meta property="og:url" content="https://웹사이트">
    <title>첫페이지 | aaa</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/setting.css">
    <link rel="stylesheet" href="/css/plugin.css">
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/style.css">
<%--    <link rel="stylesheet" href="/css/bootstrap.min.css/>">--%>

</head>

<body>
<c:set var="center" value="${center}"></c:set>
<%
    String id = (String)session.getAttribute("id");
%>
<c:if test="${center == null }">
    <c:set var="center" value="center.jsp"/>
</c:if>

<div class="wrapper">
    <div class="header">
        <c:out value="${center}"/>
        <jsp:include page="top.jsp"/>
    </div>
    <div class="content">
        <jsp:include page="${center}"/>
    </div>
    <div class="footer">
        <jsp:include page="footer.jsp"/>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/js/setting.js"></script>
<script src="/js/plugin.js"></script>
<script src="/js/template.js"></script>
<script src="/js/common.js"></script>
<script src="/js/script.js"></script>
</html>
