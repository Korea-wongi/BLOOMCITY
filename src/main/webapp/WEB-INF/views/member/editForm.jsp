<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
        request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <link rel="stylesheet" href="reources/css/bootstrap.min.css">
    <style>
        .container {
            max-width: 600px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="mb-3">회원 정보 수정</h2>
<%--  form으로 post가 아닌 PUT 요청을 보냄   --%>
    <form action method="post">
        <input type="hidden" name="_method" value="PUT"/>
        <div class="form-group">
            <label for="customerId">회원 ID</label>
            <input type="text" class="form-control" id="customerId" name="customerId" value="${customer.customerId}" readonly>
        </div>
        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" id="password" name="password" value="${customer.password}">
        </div>
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" class="form-control" id="name" name="name" value="${customer.name}">
        </div>
        <div class="form-group">
            <label for="email">이메일</label>
            <input type="email" class="form-control" id="email" name="email" value="${customer.email}">
        </div>
        <div class="form-group">
            <label for="phoneNumber">전화번호</label>
            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${customer.phoneNumber}">
        </div>
        <div class="form-group">
            <label for="address">주소</label>
            <input type="text" class="form-control" id="address" name="address" value="${customer.address}">
        </div>
        <button type="submit" class="btn btn-primary">정보 수정</button>
        <button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
    </form>
</div>
</body>
</html>

