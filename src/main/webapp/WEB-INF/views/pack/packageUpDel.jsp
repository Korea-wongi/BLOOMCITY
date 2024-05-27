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
		        <th>수정하기</th>
		        <th>삭제하기</th>
		        <th>Package Name</th>
		        <th>Destination Name</th>
		        <th>Package Type</th>
		        <th>Start Date</th>
		        <th>End Date</th>
		        <th>Price</th>
		      </tr>
		    </thead>
		    <tbody>
		   
		      <c:forEach var="item" items="${packList}">
		        <tr>
		        
		          <td> <a href="/packages/${item.packId }">${item.packId } 수정하기</a> </td>
		          <form action="/packages/${item.packId }" method="post">
					<input type="hidden" name="_method" value="DELETE">
					<td> <button type="submit">삭제하기</button> </td>
		          </form>
		          <td>${item.packName}</td>
		          <td>${item.destinationName}</td>
		          <td>${item.packType}</td>
		          <td>${item.startDate}</td>
		          <td>${item.endDate}</td>
		          <td>${item.price}</td>
		        </tr>
		      </c:forEach>
		    </tbody>
		  </table>
	</div>
</body>
</html>
