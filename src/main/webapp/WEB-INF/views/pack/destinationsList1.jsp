<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Destination Form</title>
<style>
  .p-b-100 {
    padding-bottom: 100px;
    padding-top: 100px;
  }
   .page-wrapper {
    min-height: 66.5vh;
  }
   .p-b-180 {
    padding-top: 100px;
  }
  .styled-table {
    width: 100%;
    border-collapse: collapse;
  }
  .styled-table th, .styled-table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
  }
  .styled-table th {
    background-color: #f2f2f2;
  }
</style>
</head>
<body >
	<div class="page-wrapper p-t-180 p-b-100">
		  <table class="styled-table">
		    <thead>
		      <tr>
		        <th>Select</th>
		        <th>Destination Name</th>
		        <th>Country</th>
		        <th>Description</th>
		      </tr>
		    </thead>
		    <tbody>
		      <c:forEach var="item" items="${destinations}">
		        <tr>
<%-- 		          <td><input type="radio" name="destinationId" value="${item.destinationId}"></td> --%>
		          <td> <a href="/restaurants/${item.destinationId }">${item.destinationId } 등록 하기</a> </td>
		          <td>${item.destinationName}</td>
		          <td>${item.country}</td>
		          <td>${item.destinationDescription}</td>
		        </tr>
		      </c:forEach>
		    </tbody>
		  </table>
	</div>
</body>
</html>
